import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './pages/login.dart';
import './providers/players.dart';
import './pages/home_page.dart';
import './pages/detail_player_page.dart';
import './pages/add_player_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Players(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark().copyWith(
        //   primaryColor: Colors.white,
        //   accentColor: Colors.white,
        //   scaffoldBackgroundColor: Color(0xff070706),
        // ),
        home: FirebaseAuth.instance.currentUser == null
            ? LoginPage()
            : HomePage(),
        routes: {
          AddPlayer.routeName: (context) => AddPlayer(),
          DetailPlayer.routeName: (context) => DetailPlayer(),
        },
      ),
    );
  }
}
