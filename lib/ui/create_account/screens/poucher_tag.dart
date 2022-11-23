import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/create_account/models/create_account_response.dart';
import 'package:pouchers/ui/create_account/providers/create_account_provider.dart';
import 'package:pouchers/ui/create_account/screens/biometrics_page.dart';
import 'package:pouchers/ui/create_account/screens/create_pin.dart';
import 'package:pouchers/ui/login/screens/login.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class PoucherTag extends StatefulWidget {

  const PoucherTag({Key? key, this.fromLogin = false}) : super(key: key);
  static const String routeName = "poucherTag";
  final bool? fromLogin;

  @override
  State<PoucherTag> createState() => _PoucherTagState();
}

class _PoucherTagState extends State<PoucherTag> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _tag;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      onTap: () {
        widget.fromLogin!
            ? Navigator.popUntil(context,
                (route) => route.settings.name == LogInAccount.routeName)
            : Navigator.pop(context);
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              poucherTag,
              style: textTheme.headline1,
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              poucherTagSub,
              style: textTheme.bodyText1!,
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Form(
              key: _formKey,
              child: Container(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                  cursorColor: kPrimaryColor,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return emptyField;
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) => setState(() => _tag = val),
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    hintStyle: textTheme.headline6!.copyWith(
                        color: kSecondaryTextColor.withOpacity(0.7),
                        fontSize: 18),
                    prefixText: "@  ",
                    prefixStyle: textTheme.subtitle1!.copyWith(
                      color: kPrimaryTextColor.withOpacity(0.7),
                    ),
                    fillColor: kBackgroundColor,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(kSmallPadding),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(kSmallPadding),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      borderSide: BorderSide(color: kColorRed),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kSmallPadding),
                      borderSide: BorderSide(color: kColorRed),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: kFullPadding,
            ),
            Consumer(builder: (context, ref, _) {
              ref.listen(createTagProvider,
                  (previous, NotifierState<TagResponse> next) {
                if (next.status == NotifierStatus.done) {
                  pushTo(context, CreatePin(), settings: const RouteSettings(
                      name: CreatePin.routeName));
                } else if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message!);
                }
              });

              var _widget = LargeButton(
                title: createTag,
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref.read(createTagProvider.notifier).createTag(
                          tag: _tag!,
                        );
                  }
                },
              );
              return ref.watch(createTagProvider).when(
                  done: (done) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget);
            }),
          ],
        ),
      ),
    );
  }
}
