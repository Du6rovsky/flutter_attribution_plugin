package space.inphinit.flutter_attribution_plugin

import android.content.Context

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class FlutterAttributionPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var implementation: AttributionImpl
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
      context = binding.applicationContext
      implementation = AttributionImpl()

      channel = MethodChannel(
          binding.binaryMessenger,
          "flutter_attribution_plugin"
      )

      channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
      when (call.method) {
          "getAndroidReferrerUrl" -> {
              implementation.getAndroidReferrerUrl(context) { url, error ->
                  if (error != null) {
                      result.error(
                          "REFERRER_ERROR",
                          error.message,
                          null
                      )
                      return@getAndroidReferrerUrl
                  }

                  result.success(url)
              }
          }

          else -> result.notImplemented()
      }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
