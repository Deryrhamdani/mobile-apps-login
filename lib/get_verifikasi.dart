import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:uilogin/succes.dart';

class GetVerifikasi extends StatefulWidget {
  const GetVerifikasi({super.key});

  @override
  State<GetVerifikasi> createState() => _GetVerifikasiState();
}

class _GetVerifikasiState extends State<GetVerifikasi> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
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

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        // Here you can write your code for open new view
        _showNotification();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _initializeNotifications();

    bool _onEditing = true;
    String? _code;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(116, 95, 219, 100),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const Text(
            'Kode Verifikasi',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Masukan 5 digit kode verifikasi ',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14.0,
                // fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SizedBox(
            height: 200,
            child: Image(
              image: AssetImage(
                'assets/images/verifikasi.png',
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          OtpTextField(
            autoFocus: true,
            borderRadius: BorderRadius.circular(8.0),
            textStyle: TextStyle(
              color: Colors.white,
            ),
            numberOfFields: 5,
            borderColor: const Color.fromRGBO(116, 95, 219, 100),
            cursorColor: const Color.fromRGBO(116, 95, 219, 100),
            //set to true to show as box or false to show as dash
            // showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (
              String code,
            ) {},

            onSubmit: (String verificationCode) {
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
                          builder: (BuildContext context) => Succes()));
                });
              });
            }, // end onSubmit
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: _onEditing
                  ? const Text(
                      'Tidak mendapatkan kode? kirim ulang',
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    )
                  // ignore: dead_code
                  : Text('Your code: $_code'),
            ),
          )
        ],
      ),
    );
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Membuat dan menampilkan notifikasi
  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your_channel_id', 'your_channel_name',
            importance: Importance.max,
            priority: Priority.high,
            color: Colors.deepPurple);

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // ID notifikasi (dibutuhkan jika ingin memperbarui atau menghapus notifikasi)
      'Kode Verifikasi', // Judul notifikasi
      'Hai Dery, kode verifikasi Kamu adalah 22129 ', // Isi notifikasi
      platformChannelSpecifics,
    );
  }
}
