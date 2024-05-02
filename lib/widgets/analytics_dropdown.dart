import 'package:flutter/material.dart';

class AnalyticsDropdown extends StatefulWidget {
  const AnalyticsDropdown({super.key});

  @override
  State<AnalyticsDropdown> createState() => _AnalyticsDropdownState();
}

class _AnalyticsDropdownState extends State<AnalyticsDropdown> {
  String? _selectedOption = 'Actual Crowd Registered';

  void _onDropdownChanged(String? newValue) {
    setState(() {
      _selectedOption = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedOption,
      onChanged: _onDropdownChanged,
      style: TextStyle(color: Colors.white),
      underline: Container(),
      iconEnabledColor: Colors.black87,
      elevation: 8,
      items: <String>[
        'Actual Crowd Registered',
        'Predicted Crowding Level',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
                color: Colors.black), // Make dropdown menu items white
          ),
        );
      }).toList(),
    );
  }
}
