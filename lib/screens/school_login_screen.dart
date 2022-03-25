import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'School Login',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            width / 50.0,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthTextField(
                  controller: emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {},
                ),
                SizedBox(
                  height: width / 30.0,
                ),
                AuthTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  keyboardType: TextInputType.text,
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
                  onPressed: () {},
                  child: Text(
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
