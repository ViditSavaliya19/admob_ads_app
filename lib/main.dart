import 'package:admob_ads_app/screen/ads_screen.dart';
import 'package:admob_ads_app/screen/fb_ads_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'fb',
      routes: {
        '/':(context) => AdsScreen(),
        'fb':(context) => FbAdsScreen(),
      },
    ),
  );
}
