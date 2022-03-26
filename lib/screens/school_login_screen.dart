import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poshan/screens/school_home_screen.dart';
import 'package:poshan/services/firebase_service.dart';
import 'package:poshan/services/prefs_helper.dart';
import 'package:poshan/widgets/custom_text_field.dart';

class SchoolLoginScreen extends StatefulWidget {
  const SchoolLoginScreen({Key? key}) : super(key: key);

  @override
  State<SchoolLoginScreen> createState() => _SchoolLoginScreenState();
}

class _SchoolLoginScreenState extends State<SchoolLoginScreen> {
  bool isPasswordShown = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'School Login',
        ),
      ),
      body: SafeArea(
        child: isLoading ? const Center(
          child: CircularProgressIndicator(),
        ) : Padding(
          padding: EdgeInsets.all(
            width / 50.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthTextField(
                  controller: emailController,
                  hintText: 'ID',
                  keyboardType: TextInputType.number,
                  validator: (value) {},
                ),
                SizedBox(
                  height: width / 30.0,
                ),
                AuthTextField(
                  controller: passwordController,
                  hintText: 'Pin',
                  keyboardType: TextInputType.number,
                  obscureText: isPasswordShown,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordShown = !isPasswordShown;
                        });
                      },
                      icon: Icon(
                        isPasswordShown
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ),
                  validator: (value) {},
                ),
                SizedBox(
                  height: width / 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    FirebaseService().isTeacherExist(emailController.text.toString(), passwordController.text.toString()).then((value) {
                      if (value) {
                        FirebaseService().getTeacher(emailController.text.toString(), passwordController.text.toString()).then((teacher) {
                          PrefsHelper().saveTeacher(teacher);
                          PrefsHelper().saveAuthCode(4);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const SchoolHomeScreen()), (Route<dynamic> route) => false);
                        });
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });
                  },
                  child: const Text(
                    'LOGIN',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
