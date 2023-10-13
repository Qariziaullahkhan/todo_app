import 'package:flutter/material.dart';

class Costomtextfield extends StatelessWidget {
  var controller;
  var labeltext;
  var hinttext;
  var icon;
  var icons;
  var obscuretext;
  var maximum;
  var phonelength;
  Costomtextfield(
      {super.key,
      this.controller,
      this.labeltext,
      this.hinttext,
      this.icon,
      this.icons,
      this.obscuretext,
      this.maximum,
      this.phonelength});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 20),
      child: TextField(
        maxLength: phonelength,
        controller: controller,
        keyboardType: maximum,
        decoration: InputDecoration(
          hintText: hinttext,
          labelText: labeltext,
          prefixIcon: Icon(
            icon,
            color: Colors.black,
          ),
          suffixIcon: Icon(
            icons,
            color: Colors.black,
          ),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
