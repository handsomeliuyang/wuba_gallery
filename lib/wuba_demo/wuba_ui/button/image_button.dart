import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {

    final double width;
    final double height;
    final String imageAssetName;
    final String activeImageAssetName;
    final GestureTapCallback onTap;
    final String text;
    final Color textColor;
    final Color activeTextColor;

    final bool isActive;

    const ImageButton({Key key,
        @required this.width,
        @required this.height,
        @required this.imageAssetName,
        @required this.activeImageAssetName,
        this.text,
        this.textColor,
        this.activeTextColor,
        this.onTap,
        @required this.isActive
    }) : super(key: key);


    @override
    Widget build(BuildContext context) {
        return InkResponse(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Image.asset(
                        this.isActive ? this.activeImageAssetName : this.imageAssetName,
                        width: width,
                        height: height,
                        fit: BoxFit.contain
                    ),
                    Text(
                        this.text,
                        style: TextStyle(color: this.isActive ? this.activeTextColor : this.textColor),
                    )
                ],
            ),
            onTap: onTap,
        );
    }

}