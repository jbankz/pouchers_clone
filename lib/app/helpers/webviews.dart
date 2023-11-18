import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:Pouchers/utils/logger.dart';

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  final VoidCallback onExitBrowser;

  MyChromeSafariBrowser({required this.onExitBrowser});

  @override
  void onOpened() {
    logPrint("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    logPrint("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    logPrint("ChromeSafari browser closed");
    onExitBrowser();
  }
}
