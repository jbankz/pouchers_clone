import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/size_config.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/utilities/providers/utilities_provider.dart';
import 'package:Pouchers/modules/utilities/screens/voucher/voucher_widgets.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/constant/ui_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class Vouchers extends ConsumerStatefulWidget {
  static const String routeName = "vouchers";
  final bool? isGuest;

  const Vouchers({Key? key, this.isGuest}) : super(key: key);

  @override
  ConsumerState<Vouchers> createState() => _VouchersState();
}

class _VouchersState extends ConsumerState<Vouchers> {
  double voucherAmount = 0.0;
  int voucherList = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(fetchVoucherProvider.notifier).fetchVoucher(
          status: "active",
          then: (voucher) {

            voucherList = voucher.length;
            voucher.fold(0.0, (double? sum, element) {
              voucherAmount = sum! + double.parse(element.amount);
              return voucherAmount;
            });
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: voucher,
        child: ListenerPage(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ref.watch(fetchVoucherProvider).when(
                    loading: () => SpinKitDemo(),
                    error: (val) => SizedBox(),
                    done: (done) {
                      if (done != null) {
                        return VoucherImage(
                          amount: voucherAmount.toString(),
                          voucherCode: voucherList.toString(),
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
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
          ),
        ));
  }
}
