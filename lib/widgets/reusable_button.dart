import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final Widget child;
  final double height;
  final Function callback;
  final double radius;
  final Color color;
  ReusableButton({
    this.child,
    this.height: 50.0,
    this.callback,
    this.radius: 5.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: double.infinity,
      child: RaisedButton(
        child: child,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        onPressed: callback,
      ),
    );
  }
}
