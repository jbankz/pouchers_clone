import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

import '../../providers/utilities_provider.dart';

class Vouchers extends ConsumerStatefulWidget {
  static const String routeName = "vouchers";
  final bool? isGuest;

  const Vouchers({Key? key, this.isGuest}) : super(key: key);

  @override
  ConsumerState<Vouchers> createState() => _VouchersState();
}

class _VouchersState extends ConsumerState<Vouchers> {
  int _currentPage = 0;

  // PageController _controller = PageController(viewportFraction: 0.85);

  List<VoucherItems> _pages = [
    VoucherItems(
        value: "5000",
        expiry: "12/04/2022",
        code: "#12ABC99J",
        image: AssetPaths.voucherImage),
    VoucherItems(
        value: "6000",
        expiry: "12/05/2022",
        code: "#12ABC99J",
        image: AssetPaths.voucher1Image),
    VoucherItems(
        value: "7000",
        expiry: "12/06/2022",
        code: "#12ABC99J",
        image: AssetPaths.voucherImage)
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: voucher,
        child: SingleChildScrollView(
          child: Column(
            children: [
              VoucherImage(
                amount: "5000",
                voucherCode: "#12ABC499J",
              ),
              SizedBox(
                height: kLargePadding,
              ),
              Container(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: SizeConfig.blockSizeHorizontal! / 4,
                  children: List.generate(
                    voucherClass.length,
                    (index) => inkWell(
                      onTap: () {
                        pushTo(context, voucherClass[index].page,
                            settings:
                                RouteSettings(name: voucherClass[index].days));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kSmallPadding),
                            color: kBackgroundColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              voucherClass[index].icon,
                            ),
                            SizedBox(
                              height: kRegularPadding,
                            ),
                            Text(
                              voucherClass[index].title,
                              style: textTheme.headline2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
