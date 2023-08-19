import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget
    implements PreferredSizeWidget {
  CustomTextFormField() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  DateTime? _selectedDate;

  void _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 160,
      child: TextFormField(
        readOnly: true,
        onTap: _showDatePicker,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            border: OutlineInputBorder(),
            labelText: 'Date',
            labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.normal),
            suffixIcon: Icon(Icons.calendar_today, color: Colors.white),
            filled: true,
            fillColor: Color.fromARGB(255, 31, 39, 47)),
        controller: TextEditingController(
          text: _selectedDate != null
              ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
              : "",
        ),
      ),
    );
  }
}
