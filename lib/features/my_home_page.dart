import 'package:flutter/material.dart';
import 'package:mad_course_may_2025/providers/counter_provider.dart';
import 'package:mad_course_may_2025/ui/app_text.dart';
import 'package:provider/provider.dart';

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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              //? through setState
              // '$_counter',
              //? 1 way not optimize because rebuild the whole screen every time
              '${counterProvider.count}',
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () {
          //? 1 way
          // counterProvider.count++;
          //? optimize way
          // final counterProvider = context.read<CounterProvider>();
          counterProvider.count++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
