import 'package:flutter/material.dart';

Future <Widget> navigateto (context,Widget) async=> await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=>Widget,
  ),
);