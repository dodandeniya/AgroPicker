import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CircularProgress();
  }
}

class _CircularProgress extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1500),
        animationBehavior: AnimationBehavior.preserve)
      ..forward();
    _animation = CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.9, curve: Curves.fastOutSlowIn),
        reverseCurve: Curves.fastOutSlowIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _controller.forward();
        } else if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CircularProgressIndicator(
            value: _animation.value,
          );
        });
  }
}
