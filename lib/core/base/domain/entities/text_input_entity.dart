import 'package:flicker_api_app/core/ui_kit/input/text_form_field.dart';
import 'package:flutter/cupertino.dart';

class TextInEntity {
  TextInEntity({this.type = TextFormFieldType.normal, this.emptyErrorText = ""});

  TextEditingController textController = TextEditingController();
  FocusNode focus = FocusNode();
  String error = '';
  TextFormFieldType? type;
  String emptyErrorText;

  void dispose() {
    textController.dispose();
    focus.dispose();
  }
}
