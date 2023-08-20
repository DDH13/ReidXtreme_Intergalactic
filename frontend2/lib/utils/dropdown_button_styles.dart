import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatefulWidget
    implements PreferredSizeWidget {
  String dropdownValue;
  List<String> dropdownItems; // Add this line
  CustomDropdownButtonFormField({
    required this.dropdownValue,
    required this.dropdownItems, // Add this line
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomDropdownButtonFormFieldState createState() =>
      _CustomDropdownButtonFormFieldState();
}
class _CustomDropdownButtonFormFieldState
    extends State<CustomDropdownButtonFormField> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 40,
        width: 132,
        child: DropdownButtonFormField<String>(
          value: widget.dropdownValue,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            filled: true,
            fillColor: Color.fromARGB(255, 31, 39, 47),
          ),
          itemHeight: 50,
          items: widget.dropdownItems.map<DropdownMenuItem<String>>(
                (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (String? newValue) {
            setState(() {
              widget.dropdownValue = newValue!;
            });
          },
        ),
      ),
    );
  }
}
