# flutter_attribution_plugin

A lightweight Flutter plugin for accessing native mobile attribution data

- 🍏 **Apple Search Ads Attribution Token** (iOS 14.3+)
- 🤖 **Google Play Install Referrer URL** (Android)
- ⚖️ **MIT license**

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

## 📄 License
This project is distributed under the terms of the MIT license

### Need help integrating it?
I can integrate it into your application
📩 **inphinit.dev@gmail.com**

