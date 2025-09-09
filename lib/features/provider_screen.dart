import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mad_course_may_2025/navigation/route_paths.dart';
import 'package:mad_course_may_2025/providers/counter_provider.dart';
import 'package:mad_course_may_2025/ui/appbar/app_bar.dart';
import 'package:mad_course_may_2025/ui/app_text.dart';
import 'package:mad_course_may_2025/ui/appbar/app_bar_back_button.dart';
import 'package:mad_course_may_2025/utils/app_font.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderScreen extends StatefulWidget {
  const ProviderScreen({super.key});

  @override
  State<ProviderScreen> createState() => _ProviderScreenState();
}

class _ProviderScreenState extends State<ProviderScreen> {
  //? through setState
  int _counter = 0;
  void _incrementCounter() {
    //   //? through setState
    setState(() {
      _counter++;
    });
    //   //? 1 way
    //   // counterProvider.count++;
    //   //? optimize way
    //   // final counterProvider = context.read<CounterProvider>();
    //   counterProvider.count++;
  }

  void settingSpValue(int counterValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counterValue);
  }

  void gettingSpValue() async {
    debugPrint("in getting Shared preference function");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int counter = prefs.getInt('counter') ?? 79;
    setState(() {
      _counter = counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("rendering UI");
    //? 1 way not optimize because rebuild the whole screen every time
    // final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        backButton: AppBarBackButton(
            onPressed: () => context.go(RoutePaths.homeScreen)),
        title: AppText(
          text: "Provider Implementation",
          fontFamily: AppFont.midfielder,
        ),
        closeIcon: const SizedBox.shrink(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppText(
              text: 'You have pushed the button this many times:',
            ),
            AppText(
              text: 'You have pushed the button this many times:',
              fontSize: 24,
            ),
            Text(
              //? through setState
              '$_counter',
              //? 1 way not optimize because rebuild the whole screen every time
              // '${counterProvider.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            //? 2 way
            // Consumer<CounterProvider>(
            //   builder: (context, counterProvider, child) {
            //     return Text(
            //       // '$_counter',
            //       "${counterProvider.count}",
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
            //? 3 way -- more optimize than Consumer<CounterProvider> widget
            Selector<CounterProvider, int>(
              selector: (_, provider) => provider.count,
              builder: (_, counter, __) {
                debugPrint("Selector rebuilt");
                return AppText(
                  text: "$counter",
                );
              },
            ),

            ElevatedButton(
                onPressed: () => settingSpValue(_counter),
                child: AppText(text: "Set counter in SP")),
            ElevatedButton(
                onPressed: gettingSpValue,
                child: AppText(text: "Update counter from SP"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
