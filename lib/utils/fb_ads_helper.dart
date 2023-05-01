import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class FbAdsHelper {
  bool isInterstitialAdLoaded = false;
  bool isRewardAdLoaded = false;

  FbAdsHelper._();

  static FbAdsHelper fbAdsHelper = FbAdsHelper._();

  FacebookBannerAd? facebookBannerAd;
  FacebookNativeAd? facebookNativeAd;

  initFacebookAds() {
    FacebookAudienceNetwork.init(
      testingId: "a77955ee-3304-4635-be65-81029b0f5201",
      iOSAdvertiserTrackingEnabled: true,
    );
  }
  loadFbBannerAds() {
    facebookBannerAd = FacebookBannerAd(
        bannerSize: BannerSize.STANDARD,
        listener: (p0, p1) {},
        placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID");
  }
  loadFbInterAds() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {
          isInterstitialAdLoaded = true;
        }

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          isInterstitialAdLoaded = false;
          loadFbInterAds();
        }
      },
    );
  }
  // loadFbRewardAds() {
  //   FacebookRewardedVideoAd.loadRewardedVideoAd(
  //     placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
  //     listener: (result, value) {
  //       if (result == RewardedVideoAdResult.LOADED)
  //         isRewardAdLoaded = true;
  //
  //       /// Once an Interstitial Ad has been dismissed and becomes invalidated,
  //       /// load a fresh Ad by calling this function.
  //       if (result == RewardedVideoAdResult.VIDEO_CLOSED &&
  //           value["invalidated"] == true) {
  //         isRewardAdLoaded = false;
  //         loadFbRewardAds();
  //       }
  //     },
  //   );
  // }

  void loadRewardedVideoAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        print("Rewarded Ad: $result --> $value");
        if (result == RewardedVideoAdResult.LOADED) {
          isRewardAdLoaded = true;
        }
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE)

          if (result == RewardedVideoAdResult.VIDEO_CLOSED && (value == true || value["invalidated"] == true)) {
            isRewardAdLoaded = false;
            loadRewardedVideoAd();
          }
      },
    );
  }

  void nativeBannerAd() {
    facebookNativeAd = FacebookNativeAd(
      // placementId: "YOUR_PLACEMENT_ID",
      placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: double.infinity,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        print("Native Banner Ad: $result --> $value");
      },
    );
  }


}
