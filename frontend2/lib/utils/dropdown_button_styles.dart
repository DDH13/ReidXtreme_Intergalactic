import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatefulWidget
    implements PreferredSizeWidget {
  String dropdownValue;
  CustomDropdownButtonFormField({required this.dropdownValue})
      : preferredSize = Size.fromHeight(kToolbarHeight);

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
    return Container(
      height: 40,
      width: 132,
      // style: TextStyle(),
      // style: ColoredBox(color: Color.fromARGB(255, 31, 39, 47)),
      child: DropdownButtonFormField<String>(
        // Step 3.
        value: widget.dropdownValue,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            filled: true,
            fillColor: Color.fromARGB(255, 31, 39, 47)),
        itemHeight: 50,
        // width: 200,
        // Step 4.
        items: <String>['Dog', 'Cat', 'Tiger', 'ISS-2']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.normal),
            ),
          );
        }).toList(),
        // Step 5.
        onChanged: (String? newValue) {
          setState(() {
            widget.dropdownValue = newValue!;
          });
        },
      ),
    );
  }
}
