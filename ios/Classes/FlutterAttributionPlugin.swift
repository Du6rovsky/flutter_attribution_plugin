import Flutter
import UIKit

public class FlutterAttributionPlugin: NSObject, FlutterPlugin {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "flutter_attribution_plugin",
            binaryMessenger: registrar.messenger()
        )

        let instance = FlutterAttributionPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "getIosAttributionToken":
                let impl = AttributionImpl()

                impl.getIosAttributionToken { token, error in

                    if let error {
                        result(
                            FlutterError(
                                code: "ATTRIBUTION_ERROR",
                                message: error.localizedDescription,
                                details: nil
                            )
                        )

                        return
                    }

                    result(token)
                }

            default:
                result(FlutterMethodNotImplemented)
        }
    }
}
