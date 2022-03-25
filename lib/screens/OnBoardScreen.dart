import 'package:flutter/material.dart';
import 'package:poshan/constants/constant_colors.dart';
import 'package:poshan/screens/school_home_screen.dart';
import 'package:poshan/screens/school_login_screen.dart';
import 'package:poshan/widgets/custom_button.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Admin',
                onTap: () {},
              ),
              SizedBox(
                height: width / 30.0,
              ),
              CustomButton(
                text: 'School',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SchoolHomeScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
