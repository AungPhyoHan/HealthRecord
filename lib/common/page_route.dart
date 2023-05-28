import 'package:flutter/material.dart';

void pageRouteWithReplacement(BuildContext context, Widget page) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => page,
  ));
}

void pageRouteNormal(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => page,
  ));
}
