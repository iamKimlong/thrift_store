// import 'package:flutter/material.dart';

// import 'introduction.dart';
// import 'welcome.dart';
// import 'login.dart';
// import 'register.dart';
// import 'forgot_password.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.brown,
//       ),
//       initialRoute: '/', // Start with the introduction page
//       routes: {
//         '/': (context) => IntroductionPage(), // The initial screen will be the Introduction page
//         '/welcome': (context) => WelcomePage(), // Welcome page after Introduction
//         '/login': (context) => LoginPage(), // Login page
//         '/register': (context) => RegisterPage(), // Registration page
//         '/forgot_password': (context) => ForgotPasswordPage(), // Forgot password page
//       },
//     );
//   }
// }

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:thrift_store/dashboard.dart';
import 'package:thrift_store/home.dart';
import 'package:thrift_store/introduction.dart';

void main() {
  // runApp(MyApp());
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thrift Shop',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Color(0xFFD6CBBE), // Beige background
      ),
      home: BottomNavScreen(), // Run CreditCardScreen
    );
  }
}
