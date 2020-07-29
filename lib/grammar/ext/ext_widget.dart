import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension ExtWidget on Widget {
  Widget addTapListener(Function fn) {
    return InkWell(
      child: this,
      onTap: fn,
    );
  }

  Widget callOnPostFrame(Function fn) {
    SchedulerBinding.instance.addPostFrameCallback((_) => fn());
    return this;
  }

  Widget setVisibility(bool visibility) {
    return Offstage(
      offstage: !visibility,
      child: this,
    );
  }

  Future<T> pushTo<T>(BuildContext context) async {
    return Navigator.of(context)
        .push<T>(MaterialPageRoute<T>(builder: (_) => this));
  }
}

extension ExtWidgetList on List<Widget> {
  List<Widget> joinWith(Widget separator) {
    List<Widget> result = [];
    for (var i = 0; i < this.length; i++) {
      if (i > 0) {
        result.add(separator);
      }
      result.add(this[i]);
    }
    return result;
  }
}
