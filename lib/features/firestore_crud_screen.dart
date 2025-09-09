import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mad_course_may_2025/navigation/route_paths.dart';
import 'package:mad_course_may_2025/ui/appbar/app_bar.dart';
import 'package:mad_course_may_2025/ui/app_text.dart';
import 'package:mad_course_may_2025/ui/appbar/app_bar_back_button.dart';
import 'package:mad_course_may_2025/utils/app_font.dart';
import 'package:mad_course_may_2025/utils/helpers/app_layout_helpers.dart';

class FirestoreCrudScreen extends StatefulWidget {
  const FirestoreCrudScreen({super.key});

  @override
  State<FirestoreCrudScreen> createState() => _FirestoreCrudScreenState();
}

class _FirestoreCrudScreenState extends State<FirestoreCrudScreen> {
  final TextEditingController nameController = TextEditingController();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users'); // collection name

  // Add new user
  Future<void> addUser(String name) {
    return users.add({
      'name': name,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // Update user by doc id
  Future<void> updateUser(String docId, String newName) {
    print("id == $docId");
    print("newName == $newName");
    return users.doc(docId).update({'name': newName});
  }

  // Delete user
  Future<void> deleteUser(String docId) {
    return users.doc(docId).delete();
  }

  bool isUpdateUser = false;
  String updateUserId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: AppBarBackButton(
            onPressed: () => context.go(RoutePaths.homeScreen)),
        title: AppText(
          text: "Theming",
          fontFamily: AppFont.midfielder,
        ),
        closeIcon: const SizedBox.shrink(),
      ),
      body: Column(
        children: [
          SizedBox(height: ch(25)),
          // Input field and Add button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Enter name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          if (isUpdateUser) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      updateUser(updateUserId, nameController.text);
                      nameController.clear();
                      setState(() {
                        isUpdateUser = false;
                      });
                    }
                  },
                  child: const Text("Update User"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isUpdateUser = false;
                      nameController.clear();
                    });
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ] else ...[
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  addUser(nameController.text);
                  nameController.clear();
                }
              },
              child: const Text("Add User"),
            ),
          ],

          // Show users list
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: users.orderBy('timestamp', descending: true).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final data = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var docId = data[index].id;
                    var userData = data[index].data() as Map<String, dynamic>;

                    return ListTile(
                      title: Text(userData['name']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // updateUser(docId, "Updated Name");
                              setState(() {
                                nameController.text = userData["name"];
                                updateUserId = docId;
                                isUpdateUser = true;
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              deleteUser(docId);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
