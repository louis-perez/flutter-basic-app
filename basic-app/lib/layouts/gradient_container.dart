import 'package:flutter/material.dart';

class GradientContainer extends StatefulWidget {
  final List<Widget> widgets;

  const GradientContainer({
    super.key,
    required this.widgets,
  });

  @override
  State createState() {
    return _GradientContainerState();
  }
}

class _GradientContainerState extends State<GradientContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          transform: GradientRotation(1),
          colors: [
            Color.fromARGB(255, 33, 150, 243),
            Color.fromARGB(255, 144, 202, 249)
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.widgets,
      ),
    );
  }
}