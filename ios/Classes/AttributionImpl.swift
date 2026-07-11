import Foundation
import AdServices

@objc(AttributionImpl)
public class AttributionImpl: NSObject {

    @objc
    public func getIosAttributionToken(
        _ completion: @escaping (NSString?, NSError?) -> Void
    ) {
        guard #available(iOS 14.3, *) else {
            completion(
                nil,
                NSError(
                    domain: "FlutterAttribution",
                    code: 1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "AdServices API requires iOS 14.3+"
                    ]
                )
            )
            return
        }

        Task {
            do {
                let token = try await AAAttribution.attributionToken()
                completion(token as NSString, nil)
            } catch {
                completion(nil, error as NSError)
            }
        }
    }
}