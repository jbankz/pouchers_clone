import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/account/screens/disable_account/disable_success.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class DeleteModal extends StatelessWidget {
  final String title, buttonText, reason;
  final String subTitle;
  final Color color;
  final Widget? widget;

  const DeleteModal(
      {Key? key,
      required this.textTheme,
      required this.reason,
      required this.buttonText,
      required this.title,
      required this.subTitle,
      required this.color,
      this.widget})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 1),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: kPrimaryWhite,
            borderRadius: BorderRadius.circular(kMediumPadding)),
        margin: EdgeInsets.symmetric(
            horizontal: kSmallPadding, vertical: kRegularPadding),
        padding: EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kLargePadding),
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kMediumPadding)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: kSmallPadding,
              ),
              widget == null
                  ? Text(
                      subTitle,
                      style: textTheme.bodyText1!.copyWith(color: kIconGrey),
                    )
                  : widget!,
              SizedBox(
                height: kLargePadding,
              ),
              Consumer(builder: (context, ref, _) {
                ref.listen(deleteUserProvider,
                    (previous, NotifierState<String> next) async{
                  if (next.status == NotifierStatus.done) {
                    await Hive.deleteFromDisk();
                    ref.invalidate(editProfileInHouseProvider);
                    ref.invalidate(biometricProvider);
                    pushTo(context, DisableSuccessful(
                      isDelete: true,
                    ),
                        settings: const RouteSettings(
                            name: DisableSuccessful.routeName));
                  } else if (next.status == NotifierStatus.error) {
                    showErrorBar(context, next.message!);
                  }
                });
                var _widget = Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    inkWell(
                      onTap: () => Navigator.pop(
                        context,
                      ),
                      child: Text(
                        cancel,
                        style: textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: kMacroPadding,
                    ),
                    inkWell(
                      onTap: () {
                        ref
                            .read(deleteUserProvider.notifier)
                            .deleteUser(reason: reason);
                        // Navigator.pop(context);
                      },
                      child: Text(
                        buttonText,
                        style: textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                );
                return ref.watch(deleteUserProvider).when(
                    done: (done) => _widget,
                    loading: () => SpinKitDemo(),
                    error: (val) => _widget);
              })
            ],
          ),
        ),
      ),
    );
  }
}
