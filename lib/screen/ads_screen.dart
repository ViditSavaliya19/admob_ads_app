import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../utils/ads_helper.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({Key? key}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  void initState() {
    super.initState();
    AdsHelper.adsHelper.loadNativeAds(); // Native Ads load
    AdsHelper.adsHelper.loadBannerAds(); // Banner Ads
    AdsHelper.adsHelper.loadInterstitialAds(); // Interstitial Ads load
    AdsHelper.adsHelper.loadRewardAds(); // Reward Ads load
    AdsHelper.adsHelper.loadAppOpenAds(); // AppOpen Ads load
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Admob Ads"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
              child: AdWidget(ad: AdsHelper.adsHelper.bannerAd!),
              // Show Banner Using AdWidget
            ),
            SizedBox(
              height: 20,
            ),
            //show InterstitialAds on Button click
            ElevatedButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.interstitialAd != null) {
                    AdsHelper.adsHelper.interstitialAd!.show();
                  }
                },
                child: Text("Show Interstitial")),
            //show RewardAds on Button click
            ElevatedButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.rewardedAd != null) {
                    AdsHelper.adsHelper.rewardedAd!.show(
                      onUserEarnedReward: (ad, reward) {
                        print("Amount/Points of To earn => ${reward.amount}");
                      },
                    );
                  }
                },
                child: Text("Show Reward")),
            //show AppOpen Ads open after splashscreen
            ElevatedButton(
                onPressed: () {
                  if (AdsHelper.adsHelper.appOpenAd != null) {
                    AdsHelper.adsHelper.appOpenAd!.show();
                  }
                },
                child: Text("Show AppOpenAds")),

            SizedBox(
              height: 300,
              child: AdsHelper.adsHelper.nativeAd==null?CircularProgressIndicator(): AdWidget(
                ad: AdsHelper.adsHelper.nativeAd!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
