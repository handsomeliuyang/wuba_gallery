import 'package:flutter/material.dart';
import '../../wuba_ui/button/gradient_button.dart';

class Topic extends StatelessWidget {

    final String topic;
    final String title;
    final String content;

    const Topic({Key key, @required this.topic, @required this.title, @required this.content})
        : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 15, top: 10),
                    child: Text(
                        this.topic,
                        style: TextStyle(
                            color: Color(0xff101010),
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                    ),
                ),
                Container(
                    decoration: BoxDecoration(color: Color(0xfff7f7f7)),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    padding: EdgeInsets.all(15),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                        Text(
                                            this.title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Color(0xFF1A1A1A),
                                                fontSize: 18,
                                            )
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 7),
                                            child: Text(
                                                this.content,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Color(0xFF999999),
                                                    fontSize: 12
                                                ),
                                            ),
                                        )
                                    ],
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: GradientButton(
                                    width: 75,
                                    height: 27,
                                    shapeRadius: BorderRadius.circular(21),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: const [Color(0xffFCE21B), Color(0xffFFCE06)]
                                    ),
                                    child: Text(
                                        '立即参与',
                                        style: TextStyle(
                                            color: Color(0xff1A1A1A),
                                            fontSize: 12
                                        ),
                                    ),
                                    onTap: (){
                                        debugPrint('onTap topic');
                                    },
                                ),
                            ),
                        ],
                    ),
                )
            ],
        );
    }
}