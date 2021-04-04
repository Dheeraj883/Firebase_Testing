import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/reusable_button.dart';

class FormSubmitButton extends ReusableButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          height: 45.0,
          color: Colors.indigo,
          radius: 5.0,
          callback: onPressed,
        );
}
