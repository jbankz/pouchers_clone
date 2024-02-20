import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/presentation/notifier/billers_notifier.dart';

class PagaWebView extends ConsumerStatefulWidget {
  const PagaWebView({super.key});

  @override
  ConsumerState<PagaWebView> createState() => _PagaWebViewState();
}

class _PagaWebViewState extends ConsumerState<PagaWebView> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    final billerState = ref.watch(billersNotifierProvider);
    final webPaymentLink =
        (billerState.guestServicesPurchase?.paymentMethods.isEmpty ?? false)
            ? ''
            : billerState.guestServicesPurchase?.paymentMethods.first.properties
                    ?.webPaymentLink ??
                '';
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        key: webViewKey,
        initialUrlRequest: URLRequest(url: WebUri(webPaymentLink)),
        initialSettings: settings,
        pullToRefreshController: pullToRefreshController,
        onWebViewCreated: (controller) => webViewController = controller,
        onLoadStart: (controller, url) {
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        onPermissionRequest: (controller, request) async => PermissionResponse(
            resources: request.resources,
            action: PermissionResponseAction.GRANT),
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final WebUri uri = navigationAction.request.url!;

          print("Jayceee====${uri.path}");
          // if (![
          //   "http",
          //   "https",
          //   "file",
          //   "chrome",
          //   "data",
          //   "javascript",
          //   "about"
          // ].contains(uri.scheme)) {
          //   if (await canLaunchUrl(uri)) {
          //     // Launch the App
          //     await launchUrl(
          //       uri,
          //     );
          //     // and cancel the request
          //     return NavigationActionPolicy.CANCEL;
          //   }
          // }

          return NavigationActionPolicy.ALLOW;
        },
        onLoadStop: (controller, url) async {
          pullToRefreshController?.endRefreshing();
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        onReceivedError: (controller, request, error) {
          pullToRefreshController?.endRefreshing();
        },
        onProgressChanged: (controller, progress) {
          if (progress == 100) {
            pullToRefreshController?.endRefreshing();
          }
          setState(() {
            this.progress = progress / 100;
            urlController.text = url;
          });
        },
        onUpdateVisitedHistory: (controller, url, androidIsReload) {
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        onConsoleMessage: (controller, consoleMessage) {
          if (kDebugMode) {
            print(consoleMessage);
          }
        },
      ),
    );
  }
}
