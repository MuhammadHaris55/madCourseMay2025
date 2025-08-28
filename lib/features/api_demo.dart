// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Post {
//   final int id;
//   final String title;
//   final String body;

//   Post({required this.id, required this.title, required this.body});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//       body: json['body'],
//     );
//   }
// }

// class ApiDemoScreen extends StatefulWidget {
//   @override
//   _ApiDemoScreenState createState() => _ApiDemoScreenState();
// }

// class _ApiDemoScreenState extends State<ApiDemoScreen> {
//   late Future<List<Post>> posts;

//   Future<List<Post>> fetchPosts() async {
//     final response =
//         await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

//     if (response.statusCode == 200) {
//       List jsonData = json.decode(response.body);
//       return jsonData.map((post) => Post.fromJson(post)).toList();
//     } else {
//       throw Exception("Failed to load posts");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     posts = fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("API Integration")),
//       body: FutureBuilder<List<Post>>(
//         future: posts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text("No data found"));
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               final post = snapshot.data![index];
//               return ListTile(
//                 title: Text(
//                   post.title,
//                   style: TextStyle(
//                     fontFamily: "Spell of Asia",
//                   ),
//                 ),
//                 subtitle: Text(post.body),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
