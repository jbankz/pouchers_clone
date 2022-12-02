import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class Vouchers extends StatelessWidget {
  static const String routeName = "vouchers";

  const Vouchers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: voucher,
        child: Column(
          children: [
            Container(
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: SizeConfig.blockSizeHorizontal! / 5.2,
                children: List.generate(
                  voucherClass.length,
                  (index) => Column(
                    children: [
                      inkWell(
                        onTap: () {
                          pushTo(context, voucherClass[index].page,
                              settings: RouteSettings(
                                  name: voucherClass[index].days));
                        },
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kColorBackgroundLight,
                          ),
                          padding: EdgeInsets.all(kMediumPadding),
                          child: SvgPicture.asset(
                            voucherClass[index].icon,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kRegularPadding,
                      ),
                      Text(
                        voucherClass[index].title,
                        style: textTheme.headline4,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
