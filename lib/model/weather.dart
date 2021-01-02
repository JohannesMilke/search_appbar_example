import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Weather {
  final String city;
  final int degrees;
  final String description;
  final IconData icon;

  const Weather({
    @required this.city,
    @required this.degrees,
    @required this.description,
    @required this.icon,
  });
}
