import 'package:flutter/material.dart';
import 'package:helio_world/back_draw.dart';
import 'package:helio_world/homepage.dart';

class AnimatedDrawer extends StatefulWidget {
  @override
  _AnimatedDrawerState createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _anim_ctrl;

  @override
  void initState() {
    super.initState();
    _anim_ctrl = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim_ctrl,
      builder: (ctx, wid) {
        return Stack(
          children: [
            BackDraw(),
            Transform(
              transform: Matrix4.identity()
                ..scale(
                  1 - (_anim_ctrl.value * .5),
                ),
              // child: GestureDetector(
              //   onTap: () => toggle(),
              //   // child: BackDraw(),
              // ),
              child: HomePage(
                drawerAction: () => toggle(),
              ),
              alignment: Alignment.centerRight,
            ),
          ],
        );
      },
    );
  }

  toggle() =>
      _anim_ctrl.isDismissed ? _anim_ctrl.forward() : _anim_ctrl.reverse();
}

class BluCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}

class YelCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
