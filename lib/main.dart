import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_hive/Features/home/ui/home_screen.dart';
import 'package:help_hive/Utils/colors.dart';
import 'package:help_hive/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(options: 
   DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help Hive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        appBarTheme: const AppBarTheme(backgroundColor: backgroundColor),
        splashFactory:
            NoSplash.splashFactory, //Removes the splash effect from buttons
        textTheme: GoogleFonts.dmSansTextTheme(),
        iconTheme: const IconThemeData(color: inactiveTabItemColor)
      ),
      home: const HomeScreen(),
    );
  }
}
