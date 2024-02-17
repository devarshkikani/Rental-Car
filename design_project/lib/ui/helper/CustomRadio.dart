import 'package:flutter/material.dart';



class FilledRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double radius;
  final Color color;
  FilledRadio(
      {required this.value,
        required this.groupValue,
        required this.onChanged,
        this.radius = 20,
        this.color = const Color(0xFF49EF3E)});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(this.value);
      },
      child: Container(
        height: this.radius * 2,
        width: this.radius * 2,

        child: Center(
          child: Container(
            height: (this.radius * 2) - 9,
            width: (this.radius * 2) - 9,
            decoration: ShapeDecoration(
              shape: CircleBorder(
                side: BorderSide(width: 0.8, color: Color(0xffcdcdcd)),
              ),
              color: value == groupValue
                  ? color
                  : Color(0xffFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}