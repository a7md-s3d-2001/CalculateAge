import 'package:flutter/material.dart';

Widget defaultTextForm({
  required String label,
  required TextEditingController controller,
  required var validate,
}) => Expanded(
  child: TextFormField(
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        color: Colors.grey[500],
      ),
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
    controller: controller,
    keyboardType: TextInputType.number,
    validator: validate,
  ),
);

Widget defaultButton({
  required String label,
  required var onPressed,
}) => Container(
  height: 50.0,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: MaterialButton(
    onPressed: onPressed,
    height: 50.0,
    child: Text(
      label,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    ),
  ),
);