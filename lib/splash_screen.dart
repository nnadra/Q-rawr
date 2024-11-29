import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qr_scanner/main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
void initState() {
  super.initState();
  Timer(const Duration(seconds: 2), () {
  Navigator.pushReplacementNamed(context, "/scan");
});
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-scanq.png', 
            height: 150),
            Text("Scan with Q!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color(0xFF494AE2),
            ),
          )
          ],
        ),
      ),
    );
  }
}
