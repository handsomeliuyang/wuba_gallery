import 'package:flutter/material.dart';
import 'package:rubber/rubber.dart';
import 'album_grid.dart';

class TribePublish extends StatefulWidget {

    @override
    _TribePublishState createState() => _TribePublishState();

}

class _TribePublishState extends State<TribePublish> with SingleTickerProviderStateMixin {

    RubberAnimationController _controller;

    @override
    void initState() {
        super.initState();
        _controller = RubberAnimationController(
            vsync: this,
            lowerBoundValue: AnimationControllerValue(pixel: 54),
            halfBoundValue: AnimationControllerValue(pixel: 300),
            upperBoundValue: AnimationControllerValue(percentage: 1.0),
            duration: Duration(milliseconds: 200)
        );
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                title: Text('部落发布'),
            ),
            body: RubberBottomSheet(
                header: _getHeader(),
                lowerLayer: _getLowerLayer(),
                upperLayer: _getUpperLayer(),
                animationController: _controller,
            )
        );
    }

    Widget _getHeader() {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Image.asset(
                    'assets/images/publish/bg_shadow_bottom.png',
                    height: 8,
                    fit: BoxFit.fitWidth,
                ),
                Container(
                    height: 46,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Image.asset('assets/images/publish/chat_icon_pic_old.png'),
                                    onPressed: (){

                                    }
                                ),
                            ),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Image.asset('assets/images/publish/chat_icon_at.png'),
                                    onPressed: (){

                                    }
                                ),
                            ),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Image.asset('assets/images/publish/chat_icon_center.png'),
                                    onPressed: (){

                                    }
                                ),
                            ),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Image.asset('assets/images/publish/chat_icon_voice_old.png'),
                                    onPressed: (){

                                    }
                                ),
                            ),
                            Expanded(
                                flex: 1,
                                child: IconButton(
                                    icon: Image.asset('assets/images/publish/chat_icon_face_old.png'),
                                    onPressed: (){

                                    }
                                ),
                            )
                        ],
                    ),
                )
            ],
        );
    }

    Widget _getLowerLayer() {
        return Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
                child: Text('LowerLayer'),
            ),
        );
    }

    Widget _getUpperLayer() {
        return AlbumGrid();
    }
}