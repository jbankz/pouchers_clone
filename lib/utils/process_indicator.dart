import 'package:flutter/material.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';

bool _isShowing = false;
String _dialogMessage = "Loading...";
String _dialogBody = "Please wait...";
late BuildContext _context, _dismissingContext;

class _Body extends StatefulWidget {
  final _State _dialog = _State();

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }

  update() {
    _dialog.update();
  }
}

class _State extends State<_Body> {
  update() {
    setState(() {});
  }

  @override
  void dispose() {
    _isShowing = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MediaQuery(
      // Set the default textScaleFactor to 1.0 for
      // the whole subtree.
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: kPrimaryBlack.withOpacity(0.8),
        body: MediaQuery(
          // Set the default textScaleFactor to 1.0 for
          // the whole subtree.
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                _dialogMessage,
                textAlign: TextAlign.center,
                style: theme.textTheme.headline2!.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryWhite),
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                _dialogBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyText2!.copyWith(color: Colors.white),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class ProcessIndicator {
  late _Body _dialog;

  ProcessIndicator(BuildContext context) {
    _context = context;
  }

  bool isShowing() {
    return _isShowing;
  }

  Future<bool> dismiss() {
    return Future.delayed(const Duration(milliseconds: 100), () {
      if (_isShowing) {
        try {
          _isShowing = false;
          if (Navigator.of(_dismissingContext).canPop()) {
            Navigator.of(_dismissingContext).pop();
          }
          return Future.value(true);
        } catch (_) {
          return Future.value(false);
        }
      } else {
        return Future.value(false);
      }
    });
  }

  void show({String? message, String? body}) {
    Future.delayed(const Duration(milliseconds: 50), () {
      _show(message: message ??= _dialogMessage, body: body ??= _dialogBody);
    });
  }

  void _show({String? message, String? body}) {
    _dialogMessage = message!;
    _dialogBody = body!;
    if (!_isShowing) {
      _dialog = _Body();
      _isShowing = true;

      showGeneralDialog(
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0.50),
        transitionDuration: const Duration(milliseconds: 200),
        context: _context,
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          _dismissingContext = context;

          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: _dialog,
          );
        },
      );
    }
  }
}
