import 'package:flutter/material.dart';
import 'package:poshan/constants/constant_colors.dart';
import 'package:poshan/screens/OnBoardScreen.dart';
import 'package:poshan/services/prefs_helper.dart';

class AuthHandler extends StatefulWidget {
  const AuthHandler({Key? key}) : super(key: key);

  @override
  State<AuthHandler> createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  @override
  void initState() {
    super.initState();
    PrefsHelper().getAuthCode().then((value) {
      switch (value) {
        case 0:
          Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: ConstantColors.RED,
          ),
        ),
      ),
    );
  }
}
