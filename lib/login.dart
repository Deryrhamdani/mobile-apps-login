import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uilogin/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;
  load() {
    if (loading = true) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: const Text(
                  "Tunggu ya",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0),
                ),
                content: Container(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: const SpinKitThreeBounce(
                        color: const Color.fromRGBO(116, 95, 219, 100),
                        size: 30.0,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    const Text("Memuat...")
                  ],
                )));
          });
    } else {}
  }

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
            Text('Masuk Akun Saya',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 250,
              child: Image(
                image: AssetImage(
                  'assets/images/login.png',
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontSize: 14.0),
                // obscureText: _secureText,
                decoration: InputDecoration(
                    hintText: 'Nama pengguna',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 50),
                        borderRadius: BorderRadius.circular(10.0)),
                    prefixIcon: Icon(Icons.account_circle)),
              ),
            ),
            const SizedBox(height: 30.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                style: TextStyle(fontSize: 14.0),
                obscureText: _secureText,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Kata sandi',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 50),
                      borderRadius: BorderRadius.circular(10.0)),
                  suffixIcon: IconButton(
                    onPressed: showHide,
                    icon: Icon(
                        _secureText ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    print('Lupa kata sandi');
                  },
                  child: Text(
                    'Lupa kata sandi?',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromRGBO(116, 95, 219, 100),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
              ],
            ),
            const SizedBox(height: 30.0),
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
                      Text('Masuk',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  // onPressed: () => Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => const Home()))),
                  onPressed: () {
                    setState(() {
                      loading = true;
                    });
                    load();
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        // Here you can write your code for open new view
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Home()));
                      });
                    });
                  },
                )),
          ],
        ) /* add child content here */,
      ),
    );
  }
}
