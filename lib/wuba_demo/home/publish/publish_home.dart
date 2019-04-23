import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'topic.dart';
import 'quick.dart';

class PublishHome extends StatefulWidget {
    @override
    _PublishHomeState createState() => _PublishHomeState();
}

class _PublishHomeState extends State<PublishHome> with SingleTickerProviderStateMixin {

    Animation<double> animation;
    AnimationController controller;

    @override
    void initState() {
        super.initState();

        controller = AnimationController(duration: Duration(milliseconds: 200), vsync: this);
        animation = Tween(begin: 0.0, end: 45.0).animate(controller);
        animation.addStatusListener((AnimationStatus status){
            if(status == AnimationStatus.dismissed) {
                Navigator.pop(context);
            }
        });
        controller.forward();
    }

    @override
    Widget build(BuildContext context) {
        return WillPopScope(
            onWillPop: () async {
                controller.reverse();
                return false;
            },
            child: Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                    top: true,
                    child: Stack(
                        children: <Widget>[
                            Positioned(
                                left: 0,
                                top: 0,
                                right: 0,
                                bottom: 75,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                        Expanded(
                                            flex: 1,
                                            child: Quick(
                                                list: <HomePublishBean>[
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/fangchan@3x.png', '房产'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/zhaorencai@3x.png', '发职位找人才'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/zhaogongzuo@3x.png', '发简历找工作'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/ershouwupin@3x.png', '二手物品'),

                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/ershouche@3x.png', '二手车'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/bendifuwu@3x.png', '本地服务'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/qiufuwu@3x.png', '求租求购求服务'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/jiazhenfuwu@3x.png', '家政服务'),

                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/zhuangxiu@3x.png', '装修建材'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/qichefuwu@3x.png', '汽车服务'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/kaquan@3x.png', '票务/卡券'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/shunfengche@3x.png', '拼车/顺风车'),

                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/xunrenxunwu@3x.png', '寻人寻物'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/jiaoyou@3x.png', '相亲交友'),
                                                    HomePublishBean('http://a.58cdn.com.cn/app58/icons/qiuzhu@3x.png', '万能求助'),
                                                ],
                                            )
                                        ),
                                        Topic(
                                            topic: '精选话题',
                                            title: '# 你都吃过什么奇怪的东西吗？你都吃过什么奇怪的东西吗？你都吃过什么奇怪的东西吗？',
                                            content: '132人已参与',
                                        )
                                    ],
                                ),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                height: 63,
                                child: GestureDetector(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                            AnimatedBuilder(
                                                animation: this.animation,
                                                builder: (BuildContext context, Widget child){
                                                    return Transform.rotate(
                                                        angle: animation.value * math.pi / 180.0,
                                                        child: child,
                                                    );
                                                },
                                                child: Image.asset(
                                                    'assets/images/home/wb_home_tab_publish_img.png',
                                                    width: 40,
                                                    height: 40,
                                                    fit: BoxFit.contain
                                                ),
                                            ),
                                            Text(
                                                '发布',
                                                style: TextStyle(color: Colors.white),
                                            )
                                        ],
                                    ),
                                    onTap: (){
                                        controller.reverse();
                                    },
                                ),
                            )
                        ],

                    ),
                ),
            )
        );
    }
}