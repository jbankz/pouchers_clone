import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/betting.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/buy_airtime.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/buy_cable.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/buy_electricity.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/buy_internet.dart';
import 'package:pouchers/ui/tab_layout/screens/homepage/voucher/voucher.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class GetGuestEmail extends StatefulWidget {
  static const String routeName = "getGuestEmail";
  final String? name;

  const GetGuestEmail({Key? key, this.name}) : super(key: key);

  @override
  State<GetGuestEmail> createState() => _GetGuestEmailState();
}

class _GetGuestEmailState extends State<GetGuestEmail> {
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Image.asset(
                  AssetPaths.messageImage,
                  height: 150,
                ),
                Text(
                  guestEnterEmail,
                  style: textTheme.bodyText1!.copyWith(
                    color: kIconGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: kFullPadding,
                ),
                Form(
                  key: _formKey,
                  child: TextInputNoIcon(
                    textTheme: textTheme,
                    text: yourEmailAddress,
                    hintText: enterYourEmail,
                    controller: controller,
                    onChanged: (val) {
                      if (val!.isNotEmpty) {
                        setState(() {
                          isEmpty = false;
                        });
                      } else {
                        setState(() {
                          isEmpty = true;
                        });
                      }
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return emptyField;
                      } else if (!isEmail(val)) {
                        return invalidEmail;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
              ],
            ),
          ),
          LargeButton(
            title: continueText,
            disableColor: isEmpty ? kPurpleColor100 : kPrimaryColor,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                if (widget.name == BuyAirtime.routeName) {
                  pushTo(
                    context,
                    BuyAirtime(isGuest: true,),
                    settings: const RouteSettings(name: BuyAirtime.routeName),
                  );
                }else if(widget.name == BuyCable.routeName){
                  pushTo(
                    context,
                    BuyCable(isGuest: true,),
                    settings: const RouteSettings(name: BuyCable.routeName),
                  );
                }else if(widget.name == BuyElectricity.routeName){
                  pushTo(
                    context,
                    BuyElectricity(isGuest: true,),
                    settings: const RouteSettings(name: BuyElectricity.routeName),
                  );
                }else if(widget.name == BuyInternet.routeName){
                  pushTo(
                    context,
                    BuyInternet(isGuest: true,),
                    settings: const RouteSettings(name: BuyInternet.routeName),
                  );
                }else if(widget.name == Betting.routeName){
                  pushTo(
                    context,
                    Betting(isGuest: true,),
                    settings: const RouteSettings(name: Betting.routeName),
                  );
                }else if(widget.name == Vouchers.routeName){
                  pushTo(
                    context,
                    Vouchers(isGuest: true,),
                    settings: const RouteSettings(name: Vouchers.routeName),
                  );
                }
              }
            },
          )
        ],
      ),
    );
  }
}
