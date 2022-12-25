import 'package:flutter/material.dart';
import 'package:shifts/views/shift_details_screen.dart';
import 'package:shifts/views/shifts_offerts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shifts Offerts',
      initialRoute: '/',
      routes: {
        '/': (context) => const ShiftsOffertsScreen(),
        '/details': (context) => const ShiftDetailsScreen()
      },

    );
  }
}


