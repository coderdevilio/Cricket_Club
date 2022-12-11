import 'package:cricket/models/authModel.dart';
import 'package:cricket/screens/root/root.dart';
import 'package:cricket/services/auth.dart';
import 'package:cricket/utils/ourTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthModel>.value(
      value: Auth().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: OurRoot(),
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
