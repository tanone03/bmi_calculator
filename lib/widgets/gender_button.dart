import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  GenderButton({required this.gender, required this.color, required this.func});
  final String gender;
  final color;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func();
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  gender,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
