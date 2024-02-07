package com.enyata.pouchers

import android.app.Application
import io.maido.intercom.IntercomFlutterPlugin

class MyApp : Application() {
    override fun onCreate() {
        super.onCreate()
        IntercomFlutterPlugin.initSdk(
            application = this,
            appId = BuildConfig.INTERCOM_APP_ID,
            androidApiKey = BuildConfig.INTERCOM_API_KEY
        )
    }
}
