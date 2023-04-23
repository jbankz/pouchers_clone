import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:Pouchers/app/helpers/webviews.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  // late final WebViewController _controller;
  double _progress = 0;
  late InAppWebViewController webView;
  late final ChromeSafariBrowser browser;

  @override
  void initState() {
    super.initState();
    browser = MyChromeSafariBrowser(onExitBrowser: () {
      print("successful");
      // setState(() {
      //   setFuture();
      // });
      // if (userFromTask) {
      //   Navigator.pop(context);
      // } else {
      //   if (!widget.fromSummary) {
      //     pushTo(context, const CreateTagScreen());
      //   } else {
      //     pushToAndClearStack(context, const TabLayoutWidget());
      //   }
      // }
    });
    browser.open(
      url: Uri.parse(widget.url),
      options: ChromeSafariBrowserClassOptions(
        android: AndroidChromeCustomTabsOptions(
            isTrustedWebActivity: true, showTitle: true),
        ios: IOSSafariOptions(barCollapsingEnabled: true),
      ),
    );

    // final WebViewController controller =
    //     WebViewController.fromPlatformCreationParams(
    //         PlatformWebViewControllerCreationParams());

//     controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(NavigationDelegate(
//         onProgress: (int progress) {
//           debugPrint('WebView is loading (progress : $progress%)');
//         },
//         onPageStarted: (String url) {
//           debugPrint('Page started loading: $url');
//         },
//         onPageFinished: (String url) {
//           debugPrint('Page finished loading: $url');
//         },
//         onWebResourceError: (WebResourceError error) {
//           debugPrint('''
// Page resource error:
//   code: ${error.errorCode}
//   description: ${error.description}
//   errorType: ${error.errorType}
//   isForMainFrame: ${error.isForMainFrame}
//           ''');
//         },
//         onNavigationRequest: (NavigationRequest request) {
//           // if (request.url.startsWith('https://www.youtube.com/')) {
//           //   debugPrint('blocking navigation to ${request.url}');
//           //   return NavigationDecision.prevent;
//           // }
//           debugPrint('allowing navigation to ${request.url}');
//           return NavigationDecision.navigate;
//         },
//       ))
//       ..addJavaScriptChannel(
//         'Toaster',
//         onMessageReceived: (JavaScriptMessage message) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(message.message)),
//           );
//         },
//       )
//       ..loadRequest(Uri.parse(widget.url));
//     ;
//     _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            // Center(
            //   child: ElevatedButton(
            //     onPressed: _launchUrl,
            //     child: Text('Show Flutter homepage'),
            //   ),

            //       InAppWebView(
            //           initialUrlRequest: URLRequest(
            // url: Uri.parse(widget.url),
            //)

            // WebView(
            //   initialUrl: widget.url,
            //   javascriptMode: JavascriptMode.unrestricted,
            //   onWebViewCreated: (WebViewController webViewController) {
            //     _controller.complete(webViewController);
            //   },
            //   onProgress: (int progress) {
            //     print('WebView is loading (progress : $progress%)');
            //   },
            //   navigationDelegate: (navigation){
            //     var uri = Uri.parse(navigation.url);
            //     var reference = uri.queryParametersAll['reference']![0];
            //     if(navigation.url.contains("https://app-dev.ilaundry.app/verify")){
            //       Navigator.of(context).pop(reference);
            //     }
            //     return NavigationDecision.navigate;
            //
            //   },
            // )
            ));
  }
// Future<void> _launchUrl() async {
//   if (!await launchUrl(Uri.parse(widget.url))) {
//     throw Exception('Could not launch ${widget.url}');
//   }
// }
}
