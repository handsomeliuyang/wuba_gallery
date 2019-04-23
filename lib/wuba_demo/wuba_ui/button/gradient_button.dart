import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
    final double width;
    final double height;
    final Gradient gradient;
    final Widget child;
    final Function onTap;
    final BorderRadius shapeRadius;

    const GradientButton(
        {Key key, this.width, this.height, this.gradient, this.onTap, this.shapeRadius, this.child})
        : super(key: key);

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: this.onTap,
            child: Container(
                width: this.width,
                height: this.height,
                decoration: BoxDecoration(
                    gradient: this.gradient,
                    borderRadius: this.shapeRadius
                ),
                child: Center(
                    child: child,
                )
            ),
        );
    }

}