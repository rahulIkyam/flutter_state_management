import 'package:flutter/material.dart';





/// how to use state less to state full

class NotifyListenerScreen extends StatelessWidget {
   NotifyListenerScreen({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("State Less to State Full"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
              return TextFormField(
                obscureText: toggle.value,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Password",
                    suffixIcon: InkWell(
                      onTap: () {
                        toggle.value = !toggle.value;
                      },
                      child: Icon(toggle.value ?Icons.visibility : Icons.visibility_off),
                    )
                ),
              );
            },),
            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(_counter.value.toString(),style: const TextStyle(fontSize: 40),);
                },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        _counter.value++;
        print(_counter.value.toString());
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}
