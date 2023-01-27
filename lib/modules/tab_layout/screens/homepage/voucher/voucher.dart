import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pouchers/app/helpers/size_config.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/tab_layout/screens/homepage/voucher/voucher_widgets.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/constant/ui_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class Vouchers extends StatefulWidget {
  static const String routeName = "vouchers";
  final bool? isGuest;

  const Vouchers({Key? key, this.isGuest}) : super(key: key);

  @override
  State<Vouchers> createState() => _VouchersState();
}

class _VouchersState extends State<Vouchers> {
  int _currentPage = 0;

  PageController _controller = PageController(viewportFraction: 0.85);

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
        title: voucher,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                child: PageView.builder(
                  padEnds: false,
                  itemBuilder: (context, int index) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(right: 20),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kPrimaryWhite,
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    _pages[index].image,
                                  ))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: SvgPicture.asset(
                                  AssetPaths.pouIcon,
                                  color: _pages[index].image ==
                                          AssetPaths.voucherImage
                                      ? kPurple100
                                      : kColorLightGreen,
                                  height: constraints.maxHeight / 1.5,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            AssetPaths.poucherTextImage,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                value,
                                                style: textTheme.headline3!
                                                    .copyWith(
                                                        color: kLightPurple,
                                                        fontSize: 8),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              RichText(
                                                  text: TextSpan(
                                                      text: "₦",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 12,
                                                          color: kPrimaryWhite),
                                                      children: [
                                                    TextSpan(
                                                      text: _pages[index].value,
                                                      style: textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily: "DMSans",
                                                        fontSize: 12,
                                                      ),
                                                    )
                                                  ])),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                code,
                                                style: textTheme.headline3!
                                                    .copyWith(
                                                        color: kLightPurple,
                                                        fontSize: 8),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(_pages[index].code,
                                                  style: textTheme.bodyText2!
                                                      .copyWith(
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: "DMSans",
                                                    fontSize: 12,
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            width: kPadding,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  expiryText,
                                                  style: textTheme.headline3!
                                                      .copyWith(
                                                          color: kLightPurple,
                                                          fontSize: 8),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(_pages[index].expiry,
                                                    softWrap: true,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textTheme.bodyText2!
                                                        .copyWith(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily: "DMSans",
                                                      fontSize: 10,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                  padding: EdgeInsets.only(
                                      top: constraints.maxHeight / 5,
                                      left: constraints.maxWidth / 12,
                                      right: 20,
                                      bottom: 20),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    );
                  },
                  itemCount: _pages.length,
                  controller: _controller,
                  onPageChanged: _onChanged,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < _pages.length; i++)
                    SlideBar(
                      index: i,
                      currentPage: _currentPage,
                    )
                ],
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
