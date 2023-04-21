import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsHelper {
  AdsHelper._();

  static final adsHelper = AdsHelper._();

  NativeAd? nativeAd;

  void loadNativeAds() {
    nativeAd = NativeAd(
      adUnitId: "ca-app-pub-3940256099942544/2247696110",
      factoryId: 'listTile',
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          nativeAd=ad as NativeAd;
        },
        onAdFailedToLoad: (ad, error) {},
      ),
      request: AdRequest(),
    );

    nativeAd!.load();
  }





  AppOpenAd? appOpenAd;

  void loadAppOpenAds() {
    AppOpenAd.load(
      adUnitId: "ca-app-pub-3940256099942544/3419835294",
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  }

  RewardedAd? rewardedAd;

  void loadRewardAds() {
    RewardedAd.load(
      adUnitId: "ca-app-pub-3940256099942544/5224354917",
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  InterstitialAd? interstitialAd;

  void loadInterstitialAds() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  BannerAd? bannerAd;

  void loadBannerAds() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(),
      request: AdRequest(),
    );

    bannerAd!.load();
  }
}
