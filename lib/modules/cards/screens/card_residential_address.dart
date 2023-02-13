import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/modules/cards/screens/card_widgets.dart';
import 'package:pouchers/modules/cards/screens/create_virtual_card.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

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
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Text(
                    residentialAddress,
                    style: textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    residentialAddressSub,
                    style: textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: kMacroPadding,
                  ),
                  TextInputNoIcon(
                    textTheme: textTheme,
                    text: address,
                    hintText: enterAddress,
                    onSaved: (val) => setState(() => _address = val),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return emptyField;
                      } else if (val.length < 2) {
                        return lessAddressValueField;
                      } else {
                        return null;
                      }
                    },
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
                  FormDropdown(
                      hint: selectState,
                      value: _selectedState,
                      hintColor: kIconGrey,
                      onChanged: (String? val) {
                        _selectedState = val;
                      },
                      items: nigeriaStates
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList()),
                  SizedBox(
                    height: kMediumPadding,
                  ),
                  TextInputNoIcon(
                    textTheme: textTheme,
                    text: city,
                    hintText: enterCity,
                    onSaved: (val) => setState(() => _city = val),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return emptyField;
                      } else if (val.length < 2) {
                        return lessAddressValueField;
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextInputNoIcon(
                    textTheme: textTheme,
                    text: postalCode,
                    hintText: enterPostalCode,
                    inputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onSaved: (val) => setState(() => _postalCode = val),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return emptyField;
                      } else if (val.length < 2) {
                        return lessAddressValueField;
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextInputNoIcon(
                    textTheme: textTheme,
                    text: bvn,
                    hintText: enterBvn,
                    onSaved: (val) => setState(() => _bvn = val),
                    inputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (val) {
                      if (val!.isEmpty) {
                        return emptyField;
                      } else if (val.length < 2) {
                        return lessAddressValueField;
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
                    if (_selectedState == null) {
                      showErrorBar(context, "Please select a state");
                    } else {
                      AddressClass addressDetails = AddressClass(
                          address: _address!,
                          postalCode: _postalCode!,
                          bvn: _bvn!,
                          country: "Nigeria",
                          city: _city!,
                          residentState: _selectedState!);
                      pushTo(
                          context,
                          CreateVirtualCard(
                            isNaira: widget.isNaira,
                            isFundNaira: widget.isFundNaira,
                            isFundCard: widget.isFundCard,
                            addressDetails: addressDetails,
                          ),
                          settings: const RouteSettings(
                              name: CreateVirtualCard.routeName));
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
