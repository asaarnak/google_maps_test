# google_maps_test

Testing google maps.

Error https://github.com/flutter/flutter/issues/121485 can be reproduced with invalid google maps api key.

Add correct api key if you want to see real map to `app/src/main/AndroidManifest.xml`
```xml
<meta-data android:name="com.google.android.geo.API_KEY"
android:value="Your google maps api key"/>
```
