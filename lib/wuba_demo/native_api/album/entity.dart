part of 'album_manager.dart';

class AssetEntity {
    /**
     * in android is full path
     *
     * in ios is asset id
     */
    String path;

    AssetEntity({
        this.path
    });

    @override
    String toString() {
        return 'AssetEntity{path: $path}';
    }
}