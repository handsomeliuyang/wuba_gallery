import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import '../../native_api/album/album_manager.dart';

class AlbumGrid extends StatefulWidget {

    @override
    _AlbumGridState createState() => _AlbumGridState();

}

class _AlbumGridState extends State<AlbumGrid> {

    List<AssetEntity> list = new List<AssetEntity>();
    int currentPage = -1;

    @override
    void initState() {
        super.initState();

        // 加载第一页数据
        _initData(0);
    }

    void _initData(int nextPage) async {
        List<AssetEntity> newPage = await AlbumManagerPlugin.getAllAssetList(nextPage);
        this.setState((){
            list.addAll(newPage);
            currentPage = nextPage;
        });
    }

    @override
    Widget build(BuildContext context) {
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0
            ),
            padding: EdgeInsets.all(4.0),
            itemBuilder: _itemBuilder,
            itemCount: list.length,
        );
    }

    Widget _itemBuilder(BuildContext context, int index) {
        AssetEntity entity = list[index];

        return Image.file(
            File(entity.path),
            fit: BoxFit.cover,
        );

    }
}