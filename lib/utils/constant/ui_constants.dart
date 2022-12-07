import 'package:flutter/material.dart';
import 'package:pouchers/ui/onboarding/model/onboarding_model.dart';
import 'package:pouchers/ui/onboarding/screens/guest_email.dart';
import 'package:pouchers/ui/tab_layout/models/ui_models_class.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/betting.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/buy_airtime.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/buy_cable.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/buy_data.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/buy_electricity.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/buy_internet.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/buy_voucher.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/gift_voucher.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/redeem_voucher.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/view_voucher_history.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher.dart';
import 'package:pouchers/utils/assets_path.dart';

final List<GuestClass> guestClass = [
  GuestClass("Airtime/Data", AssetPaths.airtimeIcon,
      page: GetGuestEmail(
        name: BuyAirtime.routeName,
      )),
  GuestClass("CableTV", AssetPaths.televisionIcon,
      page: GetGuestEmail(
        name: BuyCable.routeName,
      )),
  GuestClass("Water Bill", AssetPaths.waterTapIcon, page: GetGuestEmail()),
  GuestClass("Electricity", AssetPaths.electricityIcon,
      page: GetGuestEmail(
        name: BuyElectricity.routeName,
      )),
  GuestClass("Education", AssetPaths.educationIcon, page: Container()),
  GuestClass("Internet", AssetPaths.wifiIcon,
      page: GetGuestEmail(
        name: BuyInternet.routeName,
      )),
  GuestClass("Tickets", AssetPaths.ticketIcon, page: Container()),
  GuestClass("Vouchers", AssetPaths.voucherIcon, page: GetGuestEmail(
    name: Vouchers.routeName,
  )),
  GuestClass("Betting", AssetPaths.bettingIcon, page: GetGuestEmail(
    name: Betting.routeName,
  )),
];

List<GuestClass> guestList = [
  GuestClass("10 cashback", "50", page: SizedBox()),
  GuestClass("10 cashback", "100", page: SizedBox()),
  GuestClass("10 cashback", "200", page: SizedBox()),
  GuestClass("10 cashback", "500", page: SizedBox()),
  GuestClass("10 cashback", "1000", page: SizedBox()),
  GuestClass("10 cashback", "2000", page: SizedBox()),
];

List<GuestClass> guestListData = [
  GuestClass("10 cashback", "200", page: SizedBox(), mb: "350 MB", days: "2"),
  GuestClass("15 cashback", "300", page: SizedBox(), mb: "1 GB", days: "1"),
  GuestClass("10 cashback", "50", page: SizedBox(), mb: "50 MB", days: "1"),
  GuestClass("10 cashback", "500", page: SizedBox(), mb: "3 GB", days: "2"),
  GuestClass("10 cashback", "300", page: SizedBox(), mb: "2.5 GB", days: "2"),
  GuestClass("10 cashback", "1300", page: SizedBox(), mb: "4.5 GB", days: "2"),
];

List<int> containerIndex = [0, 1, 2, 3];

List<GetProviderClass> providerList = [
  GetProviderClass(title: "DSTV", icon: AssetPaths.dstv),
  GetProviderClass(title: "GOTV", icon: AssetPaths.dstv),
  GetProviderClass(title: "iROKOTV", icon: AssetPaths.dstv),
  GetProviderClass(title: "SHOWMAX", icon: AssetPaths.dstv),
  GetProviderClass(title: "StarTimes", icon: AssetPaths.dstv),
  GetProviderClass(title: "TSTV", icon: AssetPaths.dstv),
  GetProviderClass(title: "DSTV", icon: AssetPaths.dstv),
  GetProviderClass(title: "GOTV", icon: AssetPaths.dstv),
  GetProviderClass(title: "iROKOTV", icon: AssetPaths.dstv),
  GetProviderClass(title: "SHOWMAX", icon: AssetPaths.dstv),
  GetProviderClass(title: "StarTimes", icon: AssetPaths.dstv),
  GetProviderClass(title: "TSTV", icon: AssetPaths.dstv),
];

List<GetProviderClass> subscriptionList = [
  GetProviderClass(title: "Lite", icon: "900"),
  GetProviderClass(title: "Lite-quarterly", icon: "2,400"),
  GetProviderClass(title: "Lite-annually", icon: "7,000"),
  GetProviderClass(title: "Jinja", icon: "1,900"),
  GetProviderClass(title: "Jolli", icon: "2,800"),
  GetProviderClass(title: "Max", icon: "4,200"),
  GetProviderClass(title: "Supa", icon: "5,600"),
];

List<GuestClass> guestNumber = [
  GuestClass("3", "", page: SizedBox()),
  GuestClass("2", "", page: SizedBox()),
  GuestClass("1", "", page: SizedBox()),
  GuestClass("6", "", page: SizedBox()),
  GuestClass("5", "", page: SizedBox()),
  GuestClass("4", "", page: SizedBox()),
  GuestClass("9", "", page: SizedBox()),
  GuestClass("8", "", page: SizedBox()),
  GuestClass("7", "", page: SizedBox()),
  GuestClass("Delete", "", page: SizedBox()),
  GuestClass("0", "", page: SizedBox()),
];

List<GuestClass> guestNumberDot = [
  GuestClass("3", "", page: SizedBox()),
  GuestClass("2", "", page: SizedBox()),
  GuestClass("1", "", page: SizedBox()),
  GuestClass("6", "", page: SizedBox()),
  GuestClass("5", "", page: SizedBox()),
  GuestClass("4", "", page: SizedBox()),
  GuestClass("9", "", page: SizedBox()),
  GuestClass("8", "", page: SizedBox()),
  GuestClass("7", "", page: SizedBox()),
  GuestClass("Delete", "", page: SizedBox()),
  GuestClass("0", "", page: SizedBox()),
  GuestClass(".", "", page: SizedBox()),
];

final List<GuestClass> guestHomeClass = [
  GuestClass("Airtime", AssetPaths.airtimeIcon,
      page: BuyAirtime(
        isGuest: false,
      ),
      days: BuyAirtime.routeName),
  GuestClass("Data", AssetPaths.dataIcon,
      page: BuyData(), days: BuyData.routeName),
  GuestClass("CableTV", AssetPaths.televisionIcon,
      page: BuyCable(), days: BuyCable.routeName),
  GuestClass("Electricity", AssetPaths.electricityIcon,
      page: BuyElectricity(), days: BuyElectricity.routeName),
  GuestClass("Internet", AssetPaths.wifiIcon,
      page: BuyInternet(), days: BuyInternet.routeName),
  GuestClass("Betting", AssetPaths.bettingIcon,
      page: Betting(), days: Betting.routeName),
  GuestClass(
    "Vouchers",
    AssetPaths.voucherIcon,
    page: Vouchers(),
  ),
  GuestClass("More", AssetPaths.moreIcon, page: Container()),
];

final List<GuestClass> voucherClass = [
  GuestClass("Buy Voucher", AssetPaths.buyVoucher,
      page: BuyVouchers(), days: BuyVouchers.routeName),
  GuestClass("Gift Voucher", AssetPaths.giftVoucher,
      page: GiftVoucher(), days: GiftVoucher.routeName),
  GuestClass("Redeem Voucher", AssetPaths.redeemVoucher,
      page: RedeemVoucher(), days: RedeemVoucher.routeName),
  GuestClass("View History", AssetPaths.voucherHistory,
      page: VoucherHistory(), days: VoucherHistory.routeName),
];

List<String> buyVoucherList = [
  "5,000",
  "15,000",
  "20,000",
  "40,000",
  "50,000",
  "100,000"
];
