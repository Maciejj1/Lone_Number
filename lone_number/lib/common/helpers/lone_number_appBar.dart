// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoneNumberAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoneNumberAppBar({super.key, required this.appBarTitle});
  final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitle),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xFF8C67F4), Color(0xFFFFA4CF)],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
