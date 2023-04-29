import 'package:admob_ads_app/utils/fb_ads_helper.dart';
import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:facebook_audience_network/ad/ad_rewarded.dart';
import 'package:flutter/material.dart';

class FbAdsScreen extends StatefulWidget {
  const FbAdsScreen({Key? key}) : super(key: key);

  @override
  State<FbAdsScreen> createState() => _FbAdsScreenState();
}

class _FbAdsScreenState extends State<FbAdsScreen> {
  @override
  void initState() {
    super.initState();
    FbAdsHelper.fbAdsHelper.initFacebookAds();
    FbAdsHelper.fbAdsHelper.loadFbBannerAds();
    FbAdsHelper.fbAdsHelper.loadFbInterAds();
    FbAdsHelper.fbAdsHelper.loadFbRewardAds();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Fb Ads"),
        ),
        body: Column(
          children: [
            Center(child: FbAdsHelper.fbAdsHelper.facebookBannerAd!,),
            ElevatedButton(onPressed: (){
              if(FbAdsHelper.fbAdsHelper.isInterstitialAdLoaded)
              FacebookInterstitialAd.showInterstitialAd();
            }, child: Text("InterAds")),
            ElevatedButton(onPressed: (){
              if(FbAdsHelper.fbAdsHelper.isRewardAdLoaded)
              FacebookRewardedVideoAd.showRewardedVideoAd();
            }, child: Text("RewardAds")),
          ],
        ),
      ),
    );
  }
}
