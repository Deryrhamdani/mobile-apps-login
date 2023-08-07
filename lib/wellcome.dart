import 'package:flutter/material.dart';
import 'package:uilogin/get_verifikasi.dart';
import 'package:uilogin/verifikasi.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({Key? key}) : super(key: key);

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
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
              const Text(
                'Selamat Datang',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Silahkan daftar terlebih dahulu \nsebelum melanjutkan ke langkah berikut nya!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.0,
                    // fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 300,
                child: Image(
                  image: AssetImage(
                    'assets/images/wellcome.png',
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
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
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        Image(
                          image: AssetImage(
                            'assets/images/tiktok.png',
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),
                        Text('Daftar melalui Tiktok',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ],
                    ),
                    onPressed: () {}),
              ),
              const SizedBox(height: 30.0),
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
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        Image(
                          image: AssetImage(
                            'assets/images/instagram.png',
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),
                        Text('Daftar melalui Instagram',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ],
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const GetVerifikasi()))),
              ),
              const SizedBox(height: 80.0),
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
                      children: [
                        SizedBox(
                          width: 15.0,
                        ),
                        Image(
                          image: AssetImage(
                            'assets/images/google.png',
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),
                        Text('Daftar melalui Google',
                            style:
                                TextStyle(fontSize: 14.0, color: Colors.black)),
                      ],
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const Verifikasi()))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
