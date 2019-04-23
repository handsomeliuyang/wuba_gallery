import 'package:flutter/material.dart';
import 'package:flutter_gallery/wuba_demo/home/tribe_publish/tribe_publish.dart';

class HomePublishBean {
    final String icon;
    final String name;

    HomePublishBean(this.icon, this.name);

}

class Quick extends StatelessWidget {

    final List<HomePublishBean> list;

    const Quick({Key key, @required this.list}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 20, left: 15),
                    child: GestureDetector(
                        child: Text(
                            '快捷发布',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF101010),
                                fontWeight: FontWeight.bold
                            ),
                        ),
                        onTap: (){
                            Navigator.push(context, PageRouteBuilder(
                                pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
                                    return TribePublish();
                                }
                            ));
                        },
                    )
                ),
                Expanded(
                    flex: 1,
                    child: GridView.builder(
                        itemCount: this.list.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                        itemBuilder: (BuildContext context, int index){
                            HomePublishBean bean = list[index];
                            return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                    Image.network(
                                        bean.icon,
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.contain,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Text(
                                            bean.name,
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF1A1A1A)
                                            ),
                                        ),
                                    )
                                ],
                            );
                        }
                    ),
                ),
            ],
        );
    }

}