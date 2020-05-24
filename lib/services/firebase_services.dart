import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class FirebaseServices {
  static Crashlytics initCrashlytics() {
    return Crashlytics.instance;
  }

  static FirebaseAnalytics initAnalytics() {
    final analytics = FirebaseAnalytics();
    return analytics;
  }

  static FirebaseAnalyticsObserver initAnalyticsObserver() {
    final observer = FirebaseAnalyticsObserver(analytics: initAnalytics());
    return observer;
  }
}
