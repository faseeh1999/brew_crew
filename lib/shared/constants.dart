import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.transparent,
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 2.0)),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
);

const buttonTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 16.0);
