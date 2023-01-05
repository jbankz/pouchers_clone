import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/ui/account/two_factor_auth/copy_code.dart';
import 'package:pouchers/ui/cards/screens/card_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
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
            left: kMediumPadding, right: kMediumPadding, top: kLargePadding),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  // Container(
                  //   // width: 50,
                  //   // height: 30,
                  //   //   color: Colors.red,
                  //     child: RotationTransition(
                  //       turns: AlwaysStoppedAnimation(0.83),
                  //       child: Stack(
                  //         children: [
                  //           ClipRRect(
                  //             child: Container(
                  //               padding: EdgeInsets.all(25),
                  //               child: SvgPicture.asset(
                  //                 AssetPaths.cardFrame,
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //             borderRadius: BorderRadius.circular(15),
                  //           ),
                  //           Positioned(
                  //             bottom: 0,
                  //             top: 70,
                  //             left: 0,
                  //             right: 0,
                  //             child: RotationTransition(
                  //               turns: AlwaysStoppedAnimation(0.3),
                  //               child: Center(
                  //                 child: Column(
                  //                   children: [
                  //                     Container(
                  //                       height: 15,
                  //                       width: 30,
                  //                       decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.circular(80),
                  //                         // shape: BoxShape.circle,
                  //                         color: Color.fromRGBO(255, 255, 238, 0.2),
                  //                       ),
                  //                     ),
                  //                     SizedBox(height: kSmallPadding,),
                  //                     Container(
                  //                       height: 89,
                  //                       width: 89,
                  //                       decoration: BoxDecoration(
                  //                         shape: BoxShape.circle,
                  //                         color: Color.fromRGBO(255, 255, 238, 0.2),
                  //                       ),
                  //                       child: SvgPicture.asset(AssetPaths.dollarSign, fit: BoxFit.scaleDown,),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             )
                  //           )
                  //         ],
                  //       ),
                  //     )),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 300,
                    // clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Image.asset(AssetPaths.nairaCard),
                          top: 50,
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
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
                  SizedBox(
                    height: kSmallPadding,
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
