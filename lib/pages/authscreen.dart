import 'package:driving_question/constant/constant.dart';
import 'package:driving_question/pages/questionAddSubject_screen.dart';
import 'package:driving_question/widget/textfieldwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

FirebaseAuth auth = FirebaseAuth.instance;

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late FocusNode focusNode;
  bool isInFocus = false;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isInFocus = false;
        });
      } else {
        setState(() {
          isInFocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 40, left: 40),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey, boxShadow: [
                    isInFocus
                        ? const BoxShadow(
                            color: Color.fromARGB(255, 243, 82, 33),
                            blurRadius: 8,
                            spreadRadius: 2)
                        : BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            spreadRadius: 2)
                  ]),
                  child: TextField(
                      keyboardType: TextInputType.text,
                      controller: emailController,
                      focusNode: FocusNode(),
                      obscureText: false,
                      maxLines: 1,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1)),
                          focusedBorder: const OutlineInputBorder(
                              //text kenarlık rengi
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 39, 39),
                                  width: 1)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 40, left: 40),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey, boxShadow: [
                    isInFocus
                        ? const BoxShadow(
                            color: Color.fromARGB(255, 243, 82, 33),
                            blurRadius: 8,
                            spreadRadius: 2)
                        : BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            spreadRadius: 2)
                  ]),
                  child: TextField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      focusNode: FocusNode(),
                      obscureText: true,
                      maxLines: 1,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: "Şifre",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1)),
                          focusedBorder: const OutlineInputBorder(
                              //text kenarlık rengi
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 39, 39),
                                  width: 1)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                    onPressed: () {
                      signinUser(
                          email: emailController.text,
                          password: passwordController.text);
                    },
                    child: Text("     Giriş Yap    ")),
              )
            ],
          )),
    );
  }

  Future<void> signinUser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Bir şeyler yanlış gitti";
    // ignore: avoid_print
    print(email);
    if (email != "" && password != "") {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        output = "Giriş başarılı";
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuestionAddSubjectScreen(),
            ));
      } on FirebaseAuthException catch (e) {
        {
          output = e.message.toString();
        }
      }
    } else {
      output = "Bilgileri doğru girdiğiniden emin olun";
    }
    constant().showSnackBar(context, output);
  }
}
