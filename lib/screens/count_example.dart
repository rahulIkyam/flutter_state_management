import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  // void initState() {
  //   /// we can increase it with timer periodic.
  //   super.initState();
  //   final countProvider = Provider.of<CountProvider>(context, listen: false);
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     countProvider.setCount();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    /// make listen to false to not to rebuild
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("build");
    return Scaffold(
      body:  Center(
        /// everytime it is building, when I click on the button, 
        /// So, I'll use Consumer widget
        child: Consumer<CountProvider>(builder: (context, value, child) {
          /// after using Consumer Widget and making Listen false.
          print("only this widget will rebuild");
          return Text(
            value.count.toString(),
            style: TextStyle(fontSize: 50),
          );
        },),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.setCount();
          },
        child: const Icon(Icons.add),
      ),
    );
  }
}
