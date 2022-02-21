import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CusomTextFeild extends StatelessWidget {
  String? hintText;
  TextInputType? ketBoardType;
  TextEditingController? controller;
  CusomTextFeild({Key? key,
     this.hintText,
     this.icon,
     this.password,
    this.ketBoardType,
     this.controller,
  }) : super(key: key);
  IconData? icon;
  bool? password;
   errorName(String str) {
    switch (hintText) {
      case "Username":
        return "Enter $hintText";
      case "Password":
        return "Enter $hintText";
      case "First Name":
        return "Enter $hintText";
      case "Middle Name":
        return "Enter $hintText";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return errorName(hintText!);
          }
        },
        keyboardType: ketBoardType,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.headline3!.color),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 5.0,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
          prefixIcon: icon == null
              ? null
              : Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey,
                    ),
                  ),
                ),
        ),
        obscureText: password!,
      ),
    );
  }
}
