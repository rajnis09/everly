package com.unmount.everly

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

const val METHOD_CHANNEL = "com.unmount.everly/channel"

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METHOD_CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "invite") {
                invite()
                result.success(true)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun invite() {
        val intent = Intent(Intent.ACTION_SEND)
        intent.type = "text/plain"
        intent.putExtra(Intent.EXTRA_TEXT, "This text will be shared as share link for now")
        startActivity(Intent.createChooser(intent, "Share via"))
    }
}
