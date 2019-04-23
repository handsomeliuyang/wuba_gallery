import 'package:flutter/material.dart';
import 'package:flutter_gallery/wuba_demo/home/publish/publish_home.dart';
import '../wuba_ui/button/image_button.dart';

class NavigationItem {
    final String title;

    final String icon;
    final String activeIcon;

    NavigationItem({
        this.title,
        this.icon,
        this.activeIcon
    });
}

class HomeBottomNavigationBar extends StatefulWidget {

    final List<NavigationItem> items;
    final Function onTap;
    final TabController controller;
    final Color defaultColor;
    final Color selectColor;

    HomeBottomNavigationBar({
        @required this.items,
        this.onTap,
        @required this.controller,
        @required this.defaultColor,
        @required this.selectColor
    });

    @override
    _HomeBottomNavigationBarState createState() => _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {

    int _currentIndex;
    TabController _controller;

    @override
    void initState() {
        super.initState();
        _updateTabController();
    }

    @override
    void didUpdateWidget(HomeBottomNavigationBar oldWidget) {
        super.didUpdateWidget(oldWidget);
        _updateTabController();
    }


    @override
    void dispose() {
        if (_controller != null) {
            _controller.removeListener(_handleTabControllerTick);
        }
        super.dispose();
    }

    void _handleTabControllerTick() {
        debugPrint('_handleTabControllerTick ${_controller.index}');
        if (this._currentIndex != _controller.index) {
            setState(() {
                this._currentIndex = _controller.index;
            });
        }
    }

    void _updateTabController() {
        if (widget.controller == _controller) {
            return;
        }
        // 移除老的controller的listener
        if (_controller != null) {
            _controller.removeListener(_handleTabControllerTick);
        }

        _controller = widget.controller;
        if (_controller != null) {
            _controller.addListener(_handleTabControllerTick);
            _currentIndex = _controller.index;
        }
    }

    @override
    Widget build(BuildContext context) {
        var children = <Widget>[];
        // 添加正常的tab选项
        for (var i = 0; i < widget.items.length; i++) {
            var navigationItem = widget.items[i];
            children.add(Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: ImageButton(
                        width: 23,
                        height: 23,
                        imageAssetName: navigationItem.icon,
                        activeImageAssetName: navigationItem.activeIcon,
                        text: navigationItem.title,
                        textColor: widget.defaultColor,
                        activeTextColor: widget.selectColor,
                        isActive: this._currentIndex == i,
                        onTap:  () {
                            if (this._controller != null) {
                                this._controller.animateTo(i);
                            }
                            if (widget.onTap != null) {
                                widget.onTap(i);
                            }
                        },
                    ),
                )
            ));
        }

        // 添加发布item
        children.insert(2, Expanded(
            flex: 1,
            child: ImageButton(
                width: 40,
                height: 40,
                imageAssetName: 'assets/images/home/wb_home_tab_publish_img.png',
                activeImageAssetName: '',
                text: '发布',
                textColor: widget.defaultColor,
                isActive: false,
                onTap: (){
                    Navigator.push(context, PageRouteBuilder(
                        transitionDuration: Duration(),
                        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                            return PublishHome();
                        }
                    ));
                },
            ),
        ));

        return Container(
            height: 63,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home/wb_tab_bg.png'),
                    fit: BoxFit.fill
                )
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
            )
        );
    }
}

