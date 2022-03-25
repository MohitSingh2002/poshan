import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poshan/constants/constant_colors.dart';
import 'package:poshan/screens/add_food_screen.dart';
import 'package:poshan/widgets/circular_step_progress_indicator.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({Key? key}) : super(key: key);

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.WHITE,
        iconTheme: IconThemeData(
          color: ConstantColors.BLACK,
        ),
        title: Text(
          'Nutrition',
          style: TextStyle(
            color: ConstantColors.BLACK,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.01, vertical: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3.0,
                child: ListTile(
                  leading: CircularStepProgressIndicator(
                    totalSteps: 10,
                    currentStep: 0,
                    stepSize: 5,
                    selectedColor: ConstantColors.RED,
                    unselectedColor: Colors.grey[200],
                    padding: 0,
                    width: height * 0.06,
                    height: height * 0.06,
                    roundedCap: (_, __) => true,
                    child: Center(
                      child: Icon(Icons.food_bank),
                    ),
                  ),
                  title: Text(
                    '200 of 700',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Cal Eaten',
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddFoodScreen()));
                    },
                    child: Text(
                      'Add Meal',
                      style: TextStyle(
                        color: ConstantColors.RED,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
