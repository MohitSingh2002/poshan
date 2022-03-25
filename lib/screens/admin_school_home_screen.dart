import 'package:flutter/material.dart';
import 'package:poshan/constants/constant_colors.dart';
import 'package:poshan/models/day_attendance.dart';
import 'package:poshan/services/firebase_service.dart';
import 'package:poshan/services/prefs_helper.dart';
import 'package:poshan/services/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminSchoolHomeScreen extends StatefulWidget {

  String schoolName;

  AdminSchoolHomeScreen({required this.schoolName});

  // const AdminSchoolHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminSchoolHomeScreen> createState() => _AdminSchoolHomeScreenState();
}

class _AdminSchoolHomeScreenState extends State<AdminSchoolHomeScreen> {

  String stateName = '', districtName = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getFromSharedPreferences();
  }

  void getFromSharedPreferences() {
    setState(() {
      isLoading = true;
    });
    PrefsHelper().getStateName().then((state) {
      setState(() {
        stateName = state;
      });
      PrefsHelper().getDistrictName().then((district) {
        setState(() {
          districtName = district;
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstantColors.WHITE,
        iconTheme: const IconThemeData(
          color: ConstantColors.BLACK,
        ),
        title: Text(
          widget.schoolName,
          style: const TextStyle(
            color: ConstantColors.BLACK,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: isLoading ? const Center(
          child: CircularProgressIndicator(),
        ) : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.01, vertical: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: FirebaseService().getDayAttendance(stateName, districtName, widget.schoolName),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<DayAttendance> dayAttendanceList = snapshot.data as List<DayAttendance>;
                      return SfCartesianChart(
                        enableSideBySideSeriesPlacement: true,
                        primaryXAxis: CategoryAxis(
                          title: AxisTitle(
                            text: 'Percentage',
                            textStyle: const TextStyle(
                              color: ConstantColors.BLACK,
                            ),
                          ),
                        ),
                        title: ChartTitle(
                          text: 'Attendance Report',
                          textStyle: const TextStyle(
                            color: ConstantColors.BLACK,
                          ),
                        ),
                        onDataLabelRender: (DataLabelRenderArgs args) {
                          args.textStyle = const TextStyle(
                            color: ConstantColors.BLACK,
                          );
                        },
                        series: <AreaSeries<DayAttendance, String>>[
                          AreaSeries<DayAttendance, String>(
                            // color: Color(0xff2658e5),
                            gradient: LinearGradient(
                              colors: [
                                Colors.red,
                                Colors.red[200]!,
                                Colors.red[50]!,
                              ],
                              stops: [0.0, 0.5, 1.0],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderColor: Colors.red,
                            borderWidth: 2.0,
                            dataSource: dayAttendanceList,
                            xValueMapper: (DayAttendance dayAttendance, _) => '${dayAttendance.docID.substring(0, 2)}/${dayAttendance.docID.substring(2, 4)}/${dayAttendance.docID.substring(4)}',
                            yValueMapper: (DayAttendance dayAttendance, _) => dayAttendance.getPercentageForGraph(),
                            dataLabelSettings: DataLabelSettings(isVisible: true),
                          )
                        ],
                      );
                    }
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
