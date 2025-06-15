import 'package:flutter/material.dart';

class Textformauth extends StatelessWidget {
  final String hint;
  final Icon suffix;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isnumber;
  final bool? obscuretext;
  final void Function()? onTap;
  const Textformauth(
      {super.key,
      required this.hint,
      required this.suffix,
       this.controller,
      required this.validator,
       this.isnumber, this.obscuretext, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      obscureText:obscuretext==null ||obscuretext==false?false:true ,
      
          
      validator: validator,
      controller: controller,
      style: const TextStyle(
          height: 1, fontSize: 15, fontWeight: FontWeight.normal),
      decoration: InputDecoration(
          hintText: hint,
          suffixIcon: InkWell(onTap:onTap ,child: suffix,),
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
    );
  }
}