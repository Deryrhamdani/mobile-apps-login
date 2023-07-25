import 'package:flutter/material.dart';
import 'package:uilogin/login.dart';

class Succes extends StatefulWidget {
  const Succes({super.key});

  @override
  State<Succes> createState() => _SuccesState();
}

class _SuccesState extends State<Succes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color.fromRGBO(116, 95, 219, 100),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 300,
                child: Image(
                  image: AssetImage(
                    'assets/images/verikasi-berhasil.png',
                  ),
                ),
              ),
              const Text(
                'Verifikasi Berhasil!',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Selamat! Verifikasi akun Anda berhasil! \nSekarang Anda dapat menikmati semua fitur \ndan keuntungan yang disediakan oleh aplikasi ini. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0,
                    // fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(height: 90.0),
              SizedBox(
                width: 320,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 3.0,
                      textStyle: const TextStyle(fontSize: 18.0),
                      minimumSize: const Size.fromHeight(42),
                      shape: const StadiumBorder(),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Lanjutkan',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => Login()))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
