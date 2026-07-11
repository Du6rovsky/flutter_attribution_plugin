# flutter_attribution_plugin

A lightweight Flutter plugin for accessing native mobile attribution data

- 🍏 **Apple Search Ads Attribution Token** (iOS 14.3+)
- 🤖 **Google Play Install Referrer URL** (Android)
- ⚖️ **Dual licensing** (GPL-3.0-only + Commercial)

No AppsFlyer, Adjust, Branch or other third-party attribution SDKs required

### Installation

```bash
flutter pub add flutter_attribution_plugin
```

### Usage

```dart
import 'dart:io'; // Required for Platform check
import 'package:flutter_attribution_plugin/flutter_attribution_plugin.dart';

String? attributionToken;
String? referrerUrl;

if (Platform.isIOS) {
  // Returns Apple Search Ads token as string value
  attributionToken = await AttributionPlugin.getIosAttributionToken();
} else if (Platform.isAndroid) {
  // Returns raw Google Play Install Referrer URL string
  referrerUrl = await AttributionPlugin.getAndroidReferrerUrl();
}
```

### iOS Requirements
- Apple Search Ads Attribution Token requires iOS 14.3+
- Attribution data is available only for installs originating from Apple Search Ads
- Send the returned attribution token to your backend server to retrieve attribution data using the Apple AdServices API
- Official Apple Docs for Attribution Token: https://developer.apple.com/documentation/adservices/aaattribution/attributiontoken()

### Android Requirements
- Google Play Install Referrer provides attribution data only for installs originating from Google Ads
- Official Android Docs for Install Referrer API: https://developer.android.com/reference/com/android/installreferrer/api/package-summary

## 📄 License & Commercial Use

This project is dual-licensed to accommodate both open-source development and commercial products:

1. **GPL-3.0-only**: Free to use **ONLY** for open-source applications. If your app's source code is public and under a compatible open-source license, you can use this plugin for free.
2. **Commercial License**: **REQUIRED** for proprietary, closed-source, commercial applications and enterprise software. If you cannot disclose your app's source code under the GPLv3 copyleft terms, you must purchase a Commercial License.

For pricing, licensing terms, and acquisition, please visit:</br>
🔗 https://inphinit.space/flutter-attribution-plugin

### Contact for Commercial Licenses:
📩 **inphinit.dev@gmail.com**

