import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            const Text(
              'Login Berhasil',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: Colors.orange,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const SizedBox(
              height: 300,
              child: Image(
                image: AssetImage(
                  'assets/images/login-berhasil.png',
                ),
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            const Text(
              'Follow \n@deryrhamdani',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                // fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
