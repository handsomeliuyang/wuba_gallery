part of 'album_manager.dart';

class AlbumManagerPlugin {

    static const MethodChannel _channel = MethodChannel('plugins.wuba.com/album_manager');

    static Future<List<AssetEntity>> getAllAssetList(int pageIndex) async {
        Map<dynamic, dynamic> map = Map<dynamic, dynamic>();
        map['pageIndex'] = pageIndex;

        List<dynamic> paths = await _channel.invokeMethod('getAllImage', map);

        return _castAsset(paths);
    }

    static Future<List<AssetEntity>> _castAsset(List<dynamic> paths) async {
        List<AssetEntity> result = <AssetEntity>[];

//        var timeStampList = await _getTimeStampWithIds(ids.cast());

        for (var i = 0; i < paths.length; i++) {
//            var id = ids[i];
//            var entity = AssetEntity(id: id)
//                ..type = type
//                ..createTime = timeStampList[i];
            result.add(AssetEntity(path: paths[i]));
        }

        return result;
    }
}