// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mental_health_app/core/theme/colors.dart';

import 'package:mental_health_app/settings/services/settings_services.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/mood_chart.dart';

class StatisticsScreen extends StatefulWidget {
  final String uid;
  StatisticsScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Chart'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: SettingsServices().fetchMonthlyMoodData(widget.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Map<String, dynamic>> moodData = snapshot.data!;
                  return buildMoodChart(moodData);
                } else {
                  return Text('No data available.');
                }
              },
            ),
          ),
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: chartM1,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text("Anxiety"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: chartM2,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text("Depression"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: chartM3,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text("Stress"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        color: chartM4,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text("Normal"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              height: 80,
              decoration:
                  BoxDecoration(border: Border.all(color: primaryColor)),
              child: Center(
                child: Text(
                    "This chart represents the count of different mental statuses for the user. Each color in the chart corresponds to a specific mental status."),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.all(4),
              height: 100,
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: Column(
                children: [
                  Center(
                    child: Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                  ),
                  Center(
                    child: Text(
                        "If the count for anxiety, stress, or depression is very high, it is advisable to seek help from a psychotherapy specialist."),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMoodChart(List<Map<String, dynamic>> moodData) {
    print(moodData);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 250,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <ChartSeries>[
          ColumnSeries<Map<String, dynamic>, String>(
            dataSource: moodData,
            xValueMapper: (Map<String, dynamic> datum, _) => datum['monthYear'],
            yValueMapper: (Map<String, dynamic> datum, _) => datum['anxiety'],
            dataLabelSettings:
                DataLabelSettings(isVisible: true, color: Colors.white),
            name: 'Anxiety',
          ),
          ColumnSeries<Map<String, dynamic>, String>(
            dataSource: moodData,
            xValueMapper: (Map<String, dynamic> datum, _) => datum['monthYear'],
            yValueMapper: (Map<String, dynamic> datum, _) =>
                datum['depression'],
            dataLabelSettings:
                DataLabelSettings(isVisible: true, color: Colors.white),
            name: 'Depression',
          ),
          ColumnSeries<Map<String, dynamic>, String>(
            dataSource: moodData,
            xValueMapper: (Map<String, dynamic> datum, _) => datum['monthYear'],
            yValueMapper: (Map<String, dynamic> datum, _) => datum['stress'],
            dataLabelSettings:
                DataLabelSettings(isVisible: true, color: Colors.white),
            name: 'Stress',
          ),
          ColumnSeries<Map<String, dynamic>, String>(
            dataSource: moodData,
            xValueMapper: (Map<String, dynamic> datum, _) => datum['monthYear'],
            yValueMapper: (Map<String, dynamic> datum, _) => datum['normal'],
            dataLabelSettings:
                DataLabelSettings(isVisible: true, color: Colors.white),
            name: 'Normal',
          ),
        ],
      ),
    );
  }
}
