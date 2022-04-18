import 'package:chat/screens/login/login.dart';
import 'package:chat/screens/signup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // ensure initialisation
//   FirebaseApp firebaseApp = await Firebase.initializeApp();
//   runApp(MaterialApp(
//     home: SignupBody(),
//   ));
// }

main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignupBody(),
    );
  }
}

class ab extends StatelessWidget {
  const ab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("data"),
    );
  }
}
