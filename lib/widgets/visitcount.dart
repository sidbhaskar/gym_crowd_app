import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';

class VisitCountWidget extends StatefulWidget {
  @override
  _VisitCountWidgetState createState() => _VisitCountWidgetState();
}

class _VisitCountWidgetState extends State<VisitCountWidget> {
  late Future<String> _visitCount;

  @override
  void initState() {
    super.initState();
    _visitCount = fetchVisitCountAsString();
  }

  Future<String> fetchVisitCountAsString() async {
    final url = 'http://54.234.163.158:5000/get_visit_count/?date=2024-04-28';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['visit_counts'].toString();
      } else {
        throw Exception('Failed to load visit count: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _visitCount,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Text(
            '${snapshot.data![1]}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          );
        }
      },
    );
  }
}

class VisitData {
  VisitData(this.hour, this.count);

  final int hour;
  final int count;
}
