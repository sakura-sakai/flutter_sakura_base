import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

List<double> useAnimationValues(
  AnimationController ctrl1,
  AnimationController ctrl2,
) {
  return use(_AnimationValuesHook(
    controller1: ctrl1,
    controller2: ctrl2,
  ));
}

class _AnimationValuesHook extends Hook<List<double>> {
  const _AnimationValuesHook({
    required this.controller1,
    required this.controller2,
  });

  final AnimationController controller1;
  final AnimationController controller2;

  @override
  _AnimationValuesState createState() => _AnimationValuesState();
}

class _AnimationValuesState
    extends HookState<List<double>, _AnimationValuesHook> {
  Timer? _timer;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  @override
  void initHook() {
    super.initHook();
    animation1 = _customAnimation(
      begin: 0.1,
      end: 0.15,
      controller: hook.controller1,
    );

    animation2 = _customAnimation(
      begin: 0.021,
      end: 0.04,
      controller: hook.controller1,
    );

    animation3 = _customAnimation(
      begin: 0.41,
      end: 0.38,
      controller: hook.controller2,
    );

    animation4 = _customAnimation(
      begin: 170,
      end: 190,
      controller: hook.controller2,
    );

    animation1.addListener(() => setState(() {}));
    animation2.addListener(() => setState(() {}));
    animation3.addListener(() => setState(() {}));
    animation4.addListener(() => setState(() {}));

    animation1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        hook.controller1.reverse();
      }

      if (status == AnimationStatus.dismissed) {
        hook.controller1.forward();
      }
    });

    animation3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        hook.controller2.reverse();
      }

      if (status == AnimationStatus.dismissed) {
        hook.controller2.forward();
      }
    });

    _timer = Timer(
      const Duration(milliseconds: 2500),
      hook.controller1.forward,
    );

    hook.controller2.forward();
  }

  Animation<double> _customAnimation({
    required double begin,
    required double end,
    required AnimationController controller,
  }) {
    return Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  List<double> build(BuildContext context) {
    return [
      animation1.value,
      animation2.value,
      animation3.value,
      animation4.value,
    ];
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
