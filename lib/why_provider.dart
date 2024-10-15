import 'dart:async';

import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({super.key});

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}

class _WhyProviderState extends State<WhyProvider> {
  
  int count = 0;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        count++;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    print("build$count");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",style: const TextStyle(fontSize: 20)),
            Text(count.toString(),style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
