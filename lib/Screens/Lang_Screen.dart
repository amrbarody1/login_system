import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_system/Widgets/Lang_Card.dart';

class LangScreen extends StatefulWidget {

  @override
  _LangScreenState createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(left: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.15.sh),
            Text('Select Language',style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 22)),
            SizedBox(height: 30),
            Column(
              children: [
                LangCard(langName: 'English',),
                SizedBox(height: 20),
                LangCard(langName: 'Deutsch',),
                SizedBox(height: 20)  ,
                LangCard(langName: 'عربي',),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


