//!the flutter app searches for main.dart
//!inside the main.dart, the app first looks for main function
//!in main function, there's a function provided by material.dart known as runApp(_app_as_argument);

import 'package:currency_converter/cuptertino_page.dart';
import 'package:currency_converter/material_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//why const  MyApp() ??  and  not simply use MyApp()
//it makes the constructor a compile time constant
//it tells the  compiler that we don't need to create this again and again
// it should only  be create once when we run our app
//we tell the flutter that  this widget instance we create  here, doesn't need to be created
// every single time
//! improves the performace of the   app

//describes  how the ui should look like

//!what is a state ???
// the data which determines how the widgets will look like
// example :  a text written inside a button
//types of state
// 1 : StatelessWidget -> immutable
// 2 : StatefulWidget -> mutable : will  be changed by the  user, reponds to user input/activity
// 3 : InheritedWidget

void main() {
  runApp(Mini());
}

class MyApp extends StatelessWidget {
  //statelesswidget is an abstract class so we need to ovewrite sm functuions
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMaterialPage(),
    );
  }
}

class MyCuptertinoApp extends StatelessWidget {
  const MyCuptertinoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterCupertinoPage(),
    );
  }
}

class Temp extends StatelessWidget {
  Temp({super.key}) {
    print("Constructor Invoked");
  }

  @override
  Widget build(BuildContext context) {
    print("Build Function INvoked");
    return const Text(
      "Hello World",
      textDirection: TextDirection.ltr,
    );
  }
}

class Mini extends StatefulWidget {
  Mini({super.key}) {
    print("Mini Constructor");
  }
  @override
  State<Mini> createState() {
    print("from create state");
    return MiniState();
  }
}

class MiniState extends State<Mini> {
  late String abc = "hello";

  @override
  void initState() {
    super.initState();
    abc = "hehehehe";
    print("from initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("from  didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant Mini oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("from  didUpdateDependencies");
  }

  @override
  void dispose() {
    print("from dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        abc.toString(),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
