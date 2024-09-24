import 'package:flutter/material.dart';

mixin Widgets {
  Widget textFieldMaker(
      BuildContext context,
      String hintName,
      TextEditingController controller,
      void Function() function,
      void Function() function2) {
    return Container(
      margin: const EdgeInsets.only(bottom: 21),
      width: double.infinity,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width / 7,
      padding: const EdgeInsets.only(left: 11),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 15,
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, -2))
          ]),
      child: TextField(
        
        onTap: function,
        onEditingComplete: function2,
        controller: controller,
        style: const TextStyle(
            decorationThickness: 0,
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 18),
        decoration: InputDecoration(
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: hintName,
            hintStyle: const TextStyle(color: Colors.black, fontSize: 18)),
      ),
    );
  }
}
