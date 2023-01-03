import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_scanner.dart';

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
      title: 'QR Code Scanner',
      theme: ThemeData(
       
       appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0
       )
      ),
    home: QRScanner(),
    );
  }
}
