import 'package:flutter/material.dart';

class NetworkDropdown extends StatefulWidget {
  final List<String> options;
  final String? selectedOption;
  final ValueChanged<String?> onChanged;

  NetworkDropdown({
    required this.options,
    required this.onChanged,
    this.selectedOption,
  });

  @override
  _NetworkDropdownState createState() => _NetworkDropdownState();
}

class _NetworkDropdownState extends State<NetworkDropdown> {
  String? _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.selectedOption ?? widget.options[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedOption,
      onChanged: (String? newValue) {
        setState(() {
          _selectedOption = newValue;
          widget.onChanged(newValue);
        });
      },
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
          
        );
      }).toList(),
    );
  }
}