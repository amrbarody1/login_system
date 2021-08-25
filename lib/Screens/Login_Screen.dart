import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_system/Api/apiLogin.dart';
import 'package:login_system/Screens/Lang_Screen.dart';
import 'package:login_system/Screens/Main_Screen.dart';
import 'package:login_system/Screens/Register_Screen.dart';
import 'package:login_system/Widgets/Social_Card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  User user;
  @override

  void initState() {
    _auth.userChanges().listen((event) => setState(() => user = event));
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController;
  TextEditingController passwordController;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
              child: Image.network(
                'https://blog.hootsuite.com/wp-content/uploads/2017/06/types-of-social-media.png',
                height: 0.28.sh,
                width: 1.sw,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 0.06.sh),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 0.1.sw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sign in', style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 22)),
                  SizedBox(height: 0.02.sh),
                  Text('Please login to your account.', style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.w300),),
                  SizedBox(height: 0.04.sh),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(hintText: 'Email Address'),
                          validator: (String value) {
                            if (value.isEmpty) return 'Please enter valid Email';
                            return null;
                          },
                        ),
                        SizedBox(height: 0.03.sh),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: Padding(
                              padding:  EdgeInsets.only(top: 15),
                              child: InkWell(
                                  onTap: (){},
                                  child: Text('Forgot?')
                              ),
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) return 'Please enter Password';
                            return null;
                          },
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.06.sh),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async{
                        if (_formKey.currentState.validate()) {
                          await _signInWithEmailAndPassword();
                        }
                        },
                      child: Text('Login', style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFD68388),
                        minimumSize: Size(0.87.sw , 0.07.sh),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.033.sh),
                  Center(
                    child: InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text('Register Now', style: GoogleFonts.openSans(fontWeight: FontWeight.bold),)),
                  ),
                  SizedBox(height: 0.033.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(imgUrl: 'https://image.similarpng.com/very-thumbnail/2020/12/Illustration-of-Google-icon-on-transparent-background-PNG.png'),
                      SocialCard(imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbjfTENVPxIuAuqqLd7T7sRg7b9zRGAmhkLw&usqp=CAU'),
                      SocialCard(imgUrl: 'https://e7.pngegg.com/pngimages/751/541/png-clipart-apple-logo-iphone-symbol-computer-icons-apple-cdr-logo-thumbnail.png'),
                    ],
                  ),
                  SizedBox(height: 0.03.sh),
                  Center(
                      child: InkWell(
                          onTap: (){},
                          child: Text('Continue as a gust', style: GoogleFonts.openSans(decoration: TextDecoration.underline,),)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('${user.email} signed in'),
        ),
      );
    } catch (e) {
      Scaffold.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sign in with Email & Password'),
        ),
      );
    }
  }
}






