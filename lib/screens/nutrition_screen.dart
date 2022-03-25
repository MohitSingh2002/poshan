import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poshan/constants/constant_colors.dart';
import 'package:poshan/models/food_details.dart';
import 'package:poshan/providers/food_details_provider.dart';
import 'package:poshan/screens/add_food_screen.dart';
import 'package:poshan/widgets/circular_step_progress_indicator.dart';
import 'package:provider/provider.dart';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                SizedBox(
                  height: width / 30.0,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: context
                      .watch<FoodDetailsProvider>()
                      .getFoodDetails()
                      .length,
                  itemBuilder: (_, index) {
                    Parsed parsed = context
                        .watch<FoodDetailsProvider>()
                        .getFoodDetails()
                        .elementAt(index);
                    return Card(
                      elevation: 3.0,
                      child: ListTile(
                        title: Text(
                          '${parsed.food.label}',
                          style: TextStyle(
                            color: ConstantColors.BLACK,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Protein: ${parsed.food.nutrients.procnt}g',
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${parsed.food.nutrients.enercKcal} Cal',
                              style: TextStyle(
                                color: ConstantColors.BLACK,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                                color: ConstantColors.RED,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
