import 'package:facebook_audience_network/facebook_audience_network.dart';

class FbAdsHelper {
  bool isInterstitialAdLoaded = false;
  bool isRewardAdLoaded = false;

  FbAdsHelper._();

  static FbAdsHelper fbAdsHelper = FbAdsHelper._();

  FacebookBannerAd? facebookBannerAd;

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
        if (result == InterstitialAdResult.LOADED)
          isInterstitialAdLoaded = true;

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
  loadFbRewardAds() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        if (result == RewardedVideoAdResult.LOADED)
          isRewardAdLoaded = true;

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == RewardedVideoAdResult.VIDEO_CLOSED &&
            value["invalidated"] == true) {
          isRewardAdLoaded = false;
          loadFbRewardAds();
        }
      },
    );
  }
}
