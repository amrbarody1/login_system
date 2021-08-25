import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_system/Screens/Login_Screen.dart';

class LangCard extends StatelessWidget {
  final String langName;
  const LangCard({this.langName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.8.sw,
      height: 0.075.sh,
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.0),
          ),
          elevation: 1,
          child: Center(child: Text(langName, style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 18),)),
        ),
      ),
    );
  }
}