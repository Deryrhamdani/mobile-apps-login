import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'get_verifikasi.dart';

class Verifikasi extends StatefulWidget {
  const Verifikasi({super.key});

  @override
  State<Verifikasi> createState() => _VerifikasiState();
}

class _VerifikasiState extends State<Verifikasi> {
  bool isloading = false;
  bool _secureText = true;
  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Verifikasi',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 200,
              child: Image(
                image: AssetImage(
                  'assets/images/get-verifikasi.png',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'Kami akan mengirimkan One Time Password \npada nomor ponsel ini',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                // fontWeight: FontWeight.w700,
                color: Color.fromRGBO(116, 95, 219, 100),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextFormField(
                maxLength: 12,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 14.0),
                // obscureText: _secureText,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 50),
                      borderRadius: BorderRadius.circular(10.0)),
                  prefixIcon: Image(
                    image: AssetImage(
                      'assets/images/+62.png',
                    ),
                  ),
                  // suffixIcon: IconButton(
                  //   onPressed: showHide,
                  //   icon: Icon(
                  //       _secureText ? Icons.visibility_off : Icons.visibility),
                  // ),
                ),
              ),
            ),
            const SizedBox(height: 60.0),
            SizedBox(
              width: 320,
              height: 55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(116, 95, 219, 100),
                    elevation: 3.0,
                    textStyle: const TextStyle(fontSize: 18.0),
                    minimumSize: const Size.fromHeight(42),
                    shape: const StadiumBorder(),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Dapatkan kode',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) => GetVerifikasi()))),
            ),
          ],
        ) /* add child content here */,
      ),
    );
  }
}
