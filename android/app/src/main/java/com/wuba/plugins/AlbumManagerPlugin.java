package com.wuba.plugins;

import android.Manifest;
import android.content.Context;
import android.database.Cursor;
import android.provider.MediaStore;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class AlbumManagerPlugin implements MethodChannel.MethodCallHandler {

    public static void registerWith(PluginRegistry registry) {
        registerWith(registry.registrarFor("com.wuba.plugins.AlbumManagerPlugin"));
    }

    public static void registerWith(PluginRegistry.Registrar registrar){
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "plugins.wuba.com/album_manager");
        channel.setMethodCallHandler(new AlbumManagerPlugin(registrar.context(), registrar));
    }

    /**
     * the page size of query albums
     */
    public static final int PAGE_SIZE = 200;

    private final Context mContext;
    private final PluginRegistry.Registrar mRegistrar;
    private PermissionsUtils mPermissionsUtils;

    public AlbumManagerPlugin(Context context, PluginRegistry.Registrar registrar) {
        this.mContext = context;
        mRegistrar = registrar;
        mPermissionsUtils = new PermissionsUtils();

        registrar.addRequestPermissionsResultListener(new PluginRegistry.RequestPermissionsResultListener() {
            @Override
            public boolean onRequestPermissionsResult(int i, String[] strings, int[] ints) {
                mPermissionsUtils.dealResult(i, strings, ints);
                return false;
            }
        });
//        mPermissionsUtils.setPermissionsListener(new PermissionsListener() {
//            @Override
//            public void onDenied(String[] deniedPermissions) {
//
//            }
//
//            @Override
//            public void onGranted() {
//
//            }
//        });
//        mPermissionsUtils.withActivity(registrar.activity());
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        // 先申请权限
        mPermissionsUtils.setPermissionsListener(new PermissionsListener() {
            @Override
            public void onDenied(String[] deniedPermissions) {
                Log.i("permission", "onDenied call.method = ${call.method}");

                result.error("失败", "权限被拒绝", "");
            }

            @Override
            public void onGranted() {
                switch (methodCall.method){
                    case "getAllImage":
                        getAllImage(methodCall, result);
                        break;
                    default:
                        result.notImplemented();
                }
            }
        });
        mPermissionsUtils.withActivity(mRegistrar.activity());
        mPermissionsUtils.getPermissions(mRegistrar.activity(), 3001, Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.WRITE_EXTERNAL_STORAGE);
    }

    private void getAllImage(MethodCall methodCall, MethodChannel.Result result) {
        List<String> list = new ArrayList<String>();

//        int pageIndex = methodCall.argument("pageIndex");
        int pageIndex = 0;

        Log.d("liuyang", "" + methodCall.argument("pageIndex"));

        String[] projection = {MediaStore.Images.ImageColumns.DATA, MediaStore.Images.ImageColumns.BUCKET_DISPLAY_NAME};
        String sortOrder = MediaStore.Images.Media.DATE_TAKEN + " DESC limit " + PAGE_SIZE + " offset " + pageIndex * PAGE_SIZE;
        //执行分页
        String selection = null;
//        if (!ALL_PHOTO.equals(s)) {
//            selection = MediaStore.Images.ImageColumns.BUCKET_DISPLAY_NAME + " = '" + s + "' ";
//        }

        Cursor cursor = mContext.getContentResolver().query(MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                projection, selection, null, sortOrder);
        try {
            if (cursor != null) {
                while (cursor.moveToNext()) {
                    // 获取图片的路径
                    String path = cursor.getString(cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA));
                    list.add(path);
                }

                result.success(list);
            }
        } catch (Exception e) {
//            LOGGER.e(TAG, e.toString());
            result.error("AlbumManagerPlugin", e.getMessage(), "");
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }
}
