import 'package:bumbutpital/ComponentMainScreen/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key}) : super(key: key);

  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    List<dynamic> QRdata =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
        print(QRdata[0]);
    return Scaffold(
     
      body: Container(
        color: Color((0xff6367EA)),
        height: MediaQuery.of(context).size.height,
        child: Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                  Text(
                    'QR CODE',
                    style: GoogleFonts.karla(
                        fontSize: 24,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: QrImage(
                    data: QRdata[0],
                    version: QrVersions.auto,
                    size: 250.0,
                  ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  
                  Text(
                    'Please Scan',
                    style: GoogleFonts.karla(
                        fontSize: 24,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    child: Text(
                      'COMPLETE',
                      style: GoogleFonts.karla(
                          fontSize: 15,
                          color: Color((0xff6367EA)),
                          decoration: TextDecoration.none),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavBar()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
