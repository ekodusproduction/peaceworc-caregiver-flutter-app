import 'package:flutter/cupertino.dart';
mixin UtilsHelper{
  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}