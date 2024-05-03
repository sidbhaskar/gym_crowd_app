import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

class VisitCountScreen extends StatefulWidget {
  @override
  _VisitCountScreenState createState() => _VisitCountScreenState();
}

class _VisitCountScreenState extends State<VisitCountScreen> {
  Future<List<_VisitData>> fetchVisitCount() async {
    final url = 'http://54.234.163.158:5000/get_visit_count/?date=2024-04-28';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final visitCounts = data['visit_counts'] as Map<String, dynamic>;
        return visitCounts.entries
            .map((entry) => _VisitData(int.parse(entry.key), entry.value))
            .toList();
      } else {
        throw Exception('Failed to load visit count: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<_VisitData>>(
      future: fetchVisitCount(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Container(
            padding: EdgeInsets.all(16.0),
            height: 400,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: TextStyle(color: Colors.white),
              ),
              primaryYAxis: NumericAxis(
                labelStyle: TextStyle(color: Colors.white),
              ),
              series: <ColumnSeries<_VisitData, int>>[
                ColumnSeries<_VisitData, int>(
                  width: 0.05,
                  dataSource: snapshot.data!,
                  xValueMapper: (_VisitData visit, _) => visit.hour,
                  yValueMapper: (_VisitData visit, _) => visit.count,
                )
              ],
            ),
          );
        }
      },
    );
  }
}

class _VisitData {
  _VisitData(this.hour, this.count);

  final int hour;
  final int count;
}
