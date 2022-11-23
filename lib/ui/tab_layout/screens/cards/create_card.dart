import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/tab_layout/screens/account/two_factor_auth/copy_code.dart';
import 'package:pouchers/ui/tab_layout/screens/cards/card_widgets.dart';
import 'package:pouchers/ui/tab_layout/screens/cards/create_virtual_card.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class CreateCard extends StatelessWidget {
  static const String routeName = "createCard";

  const CreateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
            left: kMediumPadding, right: kMediumPadding, top: kFullPadding),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 300,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Image.asset(AssetPaths.nairaCard),
                          top: 50,
                          right: 150,
                        ),
                        Positioned(
                          left: 130,
                          child: Image.asset(AssetPaths.visaCard),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  Text(
                    creationFee,
                    style: textTheme.headline2!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: kFullPadding,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kSmallPadding),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AssetPaths.faIcon),
                            SizedBox(
                              width: SizeConfig.blockSizeHorizontal! * 4,
                            ),
                            Expanded(
                                child: RichText(
                              text: TextSpan(
                                  text: instantPay,
                                  style: textTheme.headline4!.copyWith(
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: nairaText,
                                      style: textTheme.headline4!.copyWith(
                                          fontSize: 16, color: kColorGreen),
                                    ),
                                    TextSpan(
                                      text: orText,
                                      style: textTheme.headline4!.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    TextSpan(
                                      text: dollarText,
                                      style: textTheme.headline4!.copyWith(
                                          fontSize: 16,
                                          color: kSecondaryPurple),
                                    ),
                                    TextSpan(
                                      text: virtualCard,
                                      style: textTheme.headline4!.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: kSmallPadding,
                        ),
                        CopyCodeRow(
                          textTheme: textTheme,
                          text: payOnline,
                          color: kPrimaryTextColor,
                        ),
                        SizedBox(
                          height: kSmallPadding,
                        ),
                        CopyCodeRow(
                          textTheme: textTheme,
                          text: easyPay,
                          color: kPrimaryTextColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: kSmallPadding),
              child: LargeButton(
                title: createVirtualCard,
                onPressed: () {
                  buildShowModalBottomSheet(
                    context,
                    CreateCardWidget(textTheme: textTheme),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}