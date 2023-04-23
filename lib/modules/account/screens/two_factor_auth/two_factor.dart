import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/modules/tab_layout/two_fa_modal.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class TwoFactor extends ConsumerStatefulWidget {
  static const String routeName = "twoFactor";

  const TwoFactor({Key? key}) : super(key: key);

  @override
  ConsumerState<TwoFactor> createState() => _TwoFactorState();
}

class _TwoFactorState extends ConsumerState<TwoFactor> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getSelectedQuestionsProvider.notifier).getSelectedQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title: factorAuth,
      child: ListenerPage(
        child:
      ref.watch(getSelectedQuestionsProvider).when(
          loading: () => Center(
                child: SpinKitDemo(),
              ),
          done: (done) {
            if(done != null){
              return Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            AssetPaths.twoFactor,
                          ),
                        ),
                        SizedBox(
                          height: kFullPadding,
                        ),
                        Text(
                          factor2Authentication,
                          style: textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: kSmallPadding,
                        ),
                        Text(
                          factorAuthSub,
                          style: textTheme.headline2!.copyWith(
                            color: kIconGrey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: kMacroPadding,
                        ),
                      ],
                    ),
                  ),
                  LargeButton(
                    title: setUpFactorAuth,
                    onPressed: () {
                      buildShowModalBottomSheet(context, TwoFactorPinModal(
                        lengthOfQuestion: done.data!.length,
                      ));
                    },
                  )
                ],
              );
            }else{
              return SizedBox();
            }

          }),
    ));
  }
}
