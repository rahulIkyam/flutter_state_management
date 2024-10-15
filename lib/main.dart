
import 'package:flutter/material.dart';
import 'package:flutter_state_management/providers/count_provider.dart';
import 'package:flutter_state_management/providers/dark_theme_provider.dart';
import 'package:flutter_state_management/providers/example_one_provider.dart';
import 'package:flutter_state_management/providers/favourite_provider.dart';
import 'package:flutter_state_management/providers/login_provider.dart';
import 'package:flutter_state_management/screens/count_example.dart';
import 'package:flutter_state_management/screens/dark_theme.dart';
import 'package:flutter_state_management/screens/example_one.dart';
import 'package:flutter_state_management/screens/favourite/favoutite_screen.dart';
import 'package:flutter_state_management/screens/login_screen.dart';
import 'package:flutter_state_management/screens/value_notify_listener.dart';
import 'package:flutter_state_management/why_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  /// Single Provider.
  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (_) => CountProvider(),
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       title: 'Flutter Demo',
  //       theme: ThemeData(
  //
  //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //         useMaterial3: true,
  //       ),
  //       home: const CountExample(),
  //     ),
  //   );
  // }

@override
  Widget build(BuildContext context){
  return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider(),),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider(),),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider(),),
        ChangeNotifierProvider(create: (_) => DarkThemeProvider(),),
        ChangeNotifierProvider(create: (_) => LoginProvider(),),
      ],
    child:  Builder(builder: (BuildContext context) {
      final themeChanger = Provider.of<DarkThemeProvider>(context);
      return MaterialApp(
        themeMode: themeChanger.themeMode,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          primaryColor: Colors.red,
          iconTheme: const IconThemeData(
            color: Colors.pink
          )
        ),
        theme: ThemeData(
          brightness: Brightness.light,
            // primaryColor: Colors.green,
            // primarySwatch: Colors.yellow,
            iconTheme: const IconThemeData(
                color: Colors.purple
            )
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:  const FavouriteScreen(),
      );
    },),
  );
}
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print(count);
    return Scaffold(
      body: Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            setState(() {
              count++;
            });
            // count++;
          },
          icon: const Icon(Icons.add)
      ),
    );
  }
}

