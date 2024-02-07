package com.enyata.pouchers

import android.app.Application
import io.maido.intercom.IntercomFlutterPlugin

class MyApp: Application() {
    override fun onCreate() {
        super.onCreate()
        IntercomFlutterPlugin.initSdk(this, appId = "ors25jkb", androidApiKey = "android_sdk-543ba1f4cb81b13247aea6879c923fa666d9d79a")
    }
}
