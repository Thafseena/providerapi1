import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:providerapi1/provider/getdata_provider.dart';
import 'package:providerapi1/provider/todo_provider.dart';
import 'package:providerapi1/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>GetDataProvider()),
      ChangeNotifierProvider(create:(context)=>TodoProvider())
    ],
    child: GetMaterialApp(
      debugShowCheckedModeBanner:false,
      home: HomePage(),
    ),);
  }
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (context)=>TodoProvider(),

  //     child: const MaterialApp(
  //       debugShowCheckedModeBanner:false,
  //       home: HomePage(),
  //     ),
  //   );
  // }
}