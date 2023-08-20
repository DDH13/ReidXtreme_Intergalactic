import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
   final String title;
  CustomAppBar({super.key, required this.title}) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: const TextStyle(
          fontFamily: 'Space Grotesk',
          fontSize: 24,
          fontWeight: FontWeight.bold),
      toolbarHeight: 100,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
      ],
    );
  }
}
