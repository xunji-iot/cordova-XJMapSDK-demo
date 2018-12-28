package com.xunji.xjmapsdk.demo;

import android.app.Application;
import android.content.Context;

import com.locnavi.map.XJMapSDK;

//import com.locnavi.map.XJMapSDK;

public class App extends Application {
    public String appKey = "OMyJFFhNiG";
    public static Context context;
    @Override
    public void onCreate() {
        super.onCreate();
        context = this;
        initXJmap();
    }
    private void initXJmap() {
        XJMapSDK.init(context,appKey);
    }
}
