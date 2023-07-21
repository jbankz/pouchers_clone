import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/cards/screens/card_widgets.dart';
import 'package:Pouchers/modules/cards/screens/create_virtual_card.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class ResidentialAddress extends StatefulWidget {
  static const String routeName = "residentialAddress";
  final bool? isNaira;
  final bool? isFundCard;
  final bool? isFundNaira;

  const ResidentialAddress({
    Key? key,
    this.isNaira,
    this.isFundCard,
    this.isFundNaira,
  }) : super(key: key);

  @override
  State<ResidentialAddress> createState() => _ResidentialAddressState();
}

class _ResidentialAddressState extends State<ResidentialAddress> {
  String? _address;
  String? _postalCode;
  String? _selectedState;
  String? _city;
  String? _bvn;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InitialPage(
      title:
      headerText(widget.isFundCard!, widget.isFundNaira!, widget.isNaira!),
      child: ListenerPage(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      residentialAddressSub,
                      style: textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: kMacroPadding,
                    ),
                    // TextInputNoIcon(
                    //   textTheme: textTheme,
                    //   text: address,
                    //   hintText: enterAddress,
                    //   onSaved: (val) => setState(() => _address = val),
                    //   validator: (val) {
                    //     if (val!.isEmpty) {
                    //       return emptyField;
                    //     } else if (val.length < 2) {
                    //       return lessAddressValueField;
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                    // SizedBox(
                    //   height: kSmallPadding,
                    // ),
                    Text(
                      country,
                      style: textTheme.headline6,
                    ),
                    SizedBox(
                      height: kSmallPadding,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: kRegularPadding),
                      height: 60,
                      decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(kSmallPadding)),
                      child: Text(
                        "Nigeria",
                        style: textTheme.subtitle1,
                      ),
                    ),
                    SizedBox(
                      height: kMicroPadding,
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.stretch,
                    //   children: [
                    //     Container(
                    //       height: 60,
                    //       alignment: Alignment.center,
                    //       padding: const EdgeInsets.symmetric(horizontal: 15),
                    //       decoration: BoxDecoration(
                    //         borderRadius: kBorderSmallRadius,
                    //         color: kBackgroundColor,
                    //         // border: Border.all(
                    //         //   color: borderColor,
                    //         // ),
                    //       ),
                    //       child: Center(
                    //         child: DropdownButton(
                    //           value: _selectedState,
                    //           itemHeight: 60,
                    //           isExpanded: true,
                    //           borderRadius: kBorderMidRadius,
                    //           hint: Text(
                    //             selectState,
                    //             style: textTheme.subtitle1!.copyWith(
                    //                 color: kIconGrey),
                    //           ),
                    //           style: textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                    //           icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    //           underline: const SizedBox(),
                    //           menuMaxHeight:
                    //               MediaQuery.of(context).size.height / 2,
                    //           onChanged: (String? val) {
                    //             setState(() {
                    //               _selectedState = val;
                    //             });
                    //
                    //           },
                    //           items: nigeriaStates
                    //               .map((e) => DropdownMenuItem(
                    //                     child: Text(e),
                    //                     value: e,
                    //                   ))
                    //               .toList(),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: kMediumPadding,
                    // ),
                    // TextInputNoIcon(
                    //   textTheme: textTheme,
                    //   text: city,
                    //   hintText: enterCity,
                    //   onSaved: (val) => setState(() => _city = val),
                    //   validator: (val) {
                    //     if (val!.isEmpty) {
                    //       return emptyField;
                    //     } else if (val.length < 2) {
                    //       return lessAddressValueField;
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                    // TextInputNoIcon(
                    //   textTheme: textTheme,
                    //   text: postalCode,
                    //   hintText: enterPostalCode,
                    //   inputType: TextInputType.number,
                    //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    //   onSaved: (val) => setState(() => _postalCode = val),
                    //   validator: (val) {
                    //     if (val!.isEmpty) {
                    //       return emptyField;
                    //     } else if (val.length < 2) {
                    //       return lessAddressValueField;
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                    TextInputNoIcon(
                      textTheme: textTheme,
                      text: bvn,
                      hintText: enterBvn,
                      onSaved: (val) => setState(() => _bvn = val),
                      inputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11)
                      ],
                      validator: (val) {
                        if (val!.isEmpty) {
                          return emptyField;
                        } else if (val.length != 11) {
                          return bvnElevenDigits;
                        } else {
                          return null;
                        }
                      },
                    ),
                  ],
                ),
              ),
              LargeButton(
                  title: continueText,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // AddressClass addressDetails = AddressClass(
                      //     address: _address!,
                      //     postalCode: _postalCode!,
                      //     bvn: _bvn!,
                      //     country: "Nigeria",
                      //     city: _city!,
                      //     residentState: _selectedState!);
                      pushTo(
                          context,
                          CreateVirtualCard(
                            isNaira: widget.isNaira,
                            isFundNaira: widget.isFundNaira,
                            isFundCard: widget.isFundCard,
                            country: "Nigeria",
                            bvn: _bvn!,
                          ),
                          settings: const RouteSettings(
                              name: CreateVirtualCard.routeName));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
