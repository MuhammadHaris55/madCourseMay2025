import 'package:flutter/material.dart';
import 'package:mad_course_may_2025/providers/counter_provider.dart';
import 'package:mad_course_may_2025/ui/app_text.dart';
import 'package:mad_course_may_2025/utils/app_font.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //? through setState
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void settingSpValue(int counterValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counterValue);
  }

  void gettingSpValue() async {
    print("getting function start");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int counter = prefs.getInt('counter') ?? 79;
    setState(() {
      _counter = counter;
    });
    print("getting end");
  }

  @override
  Widget build(BuildContext context) {
    print("rendering UI");
    //? 1 way not optimize because rebuild the whole screen every time
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppText(
              text: 'You have pushed the button this many times:',
              // fontFamily: AppFont.primaryFont,
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
                print("Selector rebuilt");
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
        // onPressed: () {
        //   //? 1 way
        //   // counterProvider.count++;
        //   //? optimize way
        //   // final counterProvider = context.read<CounterProvider>();
        //   counterProvider.count++;
        // },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
