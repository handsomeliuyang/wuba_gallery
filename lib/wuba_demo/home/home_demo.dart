import 'package:flutter/material.dart';
import 'home_bottom_navigation_bar.dart';
import 'package:wubarn_plugin/wuba_rn_view.dart';

class HomeDemo extends StatefulWidget {
    static const String routeName = '/wuba/home';

    const HomeDemo({ Key key }) : super(key: key);

    @override
    _HomeDemoState createState() => _HomeDemoState();
}

class _HomeDemoState extends State<HomeDemo>
    with SingleTickerProviderStateMixin {

    List<NavigationItem> _navigationViews;
    TabController controller;

    @override
    void initState() {
        super.initState();

        _navigationViews = <NavigationItem>[
            NavigationItem(
                icon: 'assets/images/home/wb_home_tap_index_normal.png',
                activeIcon: 'assets/images/home/wb_home_tap_index_pressed.png',
                title: '首页',
            ),
            NavigationItem(
                icon: 'assets/images/home/wb_home_tap_history_normal.png',
                activeIcon: 'assets/images/home/wb_home_tap_history_pressed.png',
                title: '部落',
            ),
            NavigationItem(
                icon: 'assets/images/home/wb_home_tap_message_normal.png',
                activeIcon: 'assets/images/home/wb_home_tap_message_pressed.png',
                title: '消息',
            ),
            NavigationItem(
                icon: 'assets/images/home/wb_home_tap_center_normal.png',
                activeIcon: 'assets/images/home/wb_home_tap_center_pressed.png',
                title: '我的',
            )
        ];

        controller = TabController(
            initialIndex: 2, length: this._navigationViews.length, vsync: this);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Stack(
                children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 50,
                        child: TabBarView(
                            controller: controller,
                            children: <Widget>[
                                Container(
                                    color: Colors.red,
                                    child: Text('Fragment'),
                                ),
                                Container(
                                    child: WubaRNView(),
                                ),
                                Container(
                                    color: Colors.white,
                                    child: Text('Fragment'),
                                ),
                                Container(
                                    color: Colors.yellow,
                                    child: Text('Fragment'),
                                )
                            ]
                        ),
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        height: 63,
                        child: HomeBottomNavigationBar(
                            items: this._navigationViews,
                            controller: this.controller,
                            defaultColor: Colors.black,
                            selectColor: Colors.red,
                        ),
                    )
                ],
            ),
        );
    }
}