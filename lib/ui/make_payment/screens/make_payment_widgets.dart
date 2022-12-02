import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pouchers/app/helpers/notifiers.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/make_payment/models/make_payment_model.dart';
import 'package:pouchers/ui/make_payment/providers/payment_providers.dart';
import 'package:pouchers/ui/make_payment/screens/transfer_summary.dart';
import 'package:pouchers/utils/assets_path.dart';
import 'package:pouchers/utils/components.dart';
import 'package:pouchers/utils/constant/theme_color_constants.dart';
import 'package:pouchers/utils/flushbar.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:flutter/services.dart';
import 'package:pouchers/utils/widgets.dart';

class TransferModal extends ConsumerStatefulWidget {
  final bool isRequest;

  const TransferModal({Key? key, required this.isRequest}) : super(key: key);

  @override
  ConsumerState<TransferModal> createState() => _TransferModalState();
}

class _TransferModalState extends ConsumerState<TransferModal> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _tag;
  Map<String, dynamic> contactInfo = {};
  List<ContactListData> contactData = [];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kMicroPadding),
            topRight: Radius.circular(kMicroPadding),
          ),
          color: kPrimaryWhite),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: kMacroPadding,
                    height: 3,
                    decoration: BoxDecoration(
                      color: kPurpleColor200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Center(
                  child: Text(
                    widget.isRequest ? requestMoney : sendMoney,
                    textAlign: TextAlign.center,
                    style: textTheme.headline4!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: kMacroPadding,
                ),
                Text(
                  widget.isRequest ? requestFrom : sendTo,
                  style: textTheme.headline4,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style:
                          textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                      cursorColor: kPrimaryColor,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return emptyField;
                        } else {
                          return null;
                        }
                      },
                      onChanged: (val) {
                        if (val.isNotEmpty) {
                          ref
                              .read(getContactByPoucherTagProvider.notifier)
                              .getContactByPoucherTag(poucherTag: val);
                        }
                      },
                      onSaved: (val) => setState(() => _tag = val),
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        hintText: enterPoucherTag,
                        hintStyle: textTheme.headline6!.copyWith(fontSize: 18),
                        prefixText: "@  ",
                        prefixStyle: textTheme.subtitle1!.copyWith(
                          color: kPrimaryTextColor.withOpacity(0.7),
                        ),
                        suffixIcon: Consumer(
                          builder: (context, ref, _) {
                            ref.listen(getContactByPoucherTagProvider,
                                (previous,
                                    NotifierState<Map<String, dynamic>> next) {
                              if (next.status == NotifierStatus.done) {
                                setState(() {
                                  contactInfo["phoneNumber"] =
                                      next.data!["phoneNumber"];
                                  contactInfo["firstName"] =
                                      next.data!["firstName"];
                                  contactInfo["lastName"] =
                                      next.data!["lastName"];
                                  contactInfo["profilePicture"] =
                                      next.data!["profilePicture"];
                                });

                                print(next.data);
                              } else if (next.status == NotifierStatus.error) {
                                showErrorBar(context, next.message ?? "");
                              }
                            });
                            var _widget = SizedBox(
                              width: kLargePadding,
                              child: SpinKitDemo(
                                size: kMacroPadding,
                              ),
                            );
                            return ref
                                .watch(getContactByPoucherTagProvider)
                                .when(
                                    done: (done) => SizedBox(),
                                    loading: () => _widget,
                                    error: (val) => SizedBox());
                          },
                        ),
                        fillColor: kBackgroundColor,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(kSmallPadding),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(kSmallPadding),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kSmallPadding),
                          borderSide: BorderSide(color: kColorRed),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kSmallPadding),
                          borderSide: BorderSide(color: kColorRed),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kMicroPadding,
                ),
                contactInfo["phoneNumber"] == null
                    ? SizedBox()
                    : inkWell(
                        onTap: () {
                          Navigator.pop(context, contactInfo);
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(116),
                              child: CachedNetworkImage(
                                  height: 40,
                                  width: 40,
                                  imageUrl: contactInfo["profilePicture"],
                                  placeholder: (context, url) => Container(
                                        color: Colors.transparent,
                                        height: 40,
                                        width: 40,
                                        child: const Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    kPrimaryColor),
                                          ),
                                        ),
                                      ),
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kPrimaryColor),
                                        child: Text(
                                            "${contactInfo["firstName"]!.substring(0, 1).toUpperCase()}${contactInfo["lastName"]!.substring(0, 1).toUpperCase()}",
                                            style: textTheme.bodyText2!
                                                .copyWith(fontSize: 22)),
                                      )),
                            ),
                            SizedBox(
                              width: kRegularPadding,
                            ),
                            Text(
                              "${contactInfo["firstName"]} ${contactInfo["lastName"]}",
                              style: textTheme.headline4!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      )
              ],
            ),
          ),
          Divider(
            color: kLight100,
            thickness: 2,
          ),
          SizedBox(
            height: kMicroPadding,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: contactData.isEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetPaths.chooseContact),
                      SizedBox(
                        width: kSmallPadding,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chooseContact,
                              style: textTheme.headline4!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              chooseContactSub,
                              style: textTheme.headline4!.copyWith(
                                color: kIconGrey,
                              ),
                            ),
                            SizedBox(
                              height: kPadding,
                            ),
                            Consumer(builder: (context, ref, _) {
                              ref.listen(getAllContactsProvider, (previous,
                                  NotifierState<ContactListResponse> next) {
                                if (next.status == NotifierStatus.done) {
                                  setState(() {
                                    contactData.addAll(next.data!.data!);
                                  });
                                  print(next.data);
                                } else if (next.status ==
                                    NotifierStatus.error) {
                                  showErrorBar(context, next.message ?? "");
                                }
                              });
                              var _widget = inkWell(
                                onTap: () async {
                                  List<Contact> allContact = await getContacts();
                                  List<String> phones = [];
                                  allContact.forEach((element) {
                                    setState(() {
                                      phones.addAll(element.phones);
                                    });
                                  });
                                  ref
                                      .read(getAllContactsProvider.notifier)
                                      .getAllContacts(
                                    contacts: phones,
                                  );
                                },
                                child: Text(
                                  enableContact,
                                  style: textTheme.headline2!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                              return ref.watch(getAllContactsProvider).when(
                                  done: (done) => _widget,
                                  loading: () => SpinKitDemo(
                                    size: 40,
                                  ),
                                  error: (val) => _widget);
                            })
                          ],
                        ),
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact,
                        style: textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: kMediumPadding,
                      ),
                      ...contactData.map((e) => Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(116),
                                    child: CachedNetworkImage(
                                        height: 40,
                                        width: 40,
                                        imageUrl: e.profilePicture ?? "",
                                        placeholder: (context, url) =>
                                            Container(
                                              color: Colors.transparent,
                                              height: 40,
                                              width: 40,
                                              child: const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(kPrimaryColor),
                                                ),
                                              ),
                                            ),
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: kPrimaryColor),
                                              child: Text(
                                                  "${e.firstName!.substring(0, 1).toUpperCase()}${e.lastName!.substring(0, 1).toUpperCase()}",
                                                  style: textTheme.bodyText2!
                                                      .copyWith(fontSize: 22)),
                                            )),
                                  ),
                                  SizedBox(
                                    width: kRegularPadding,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${e.firstName} ${e.lastName}",
                                          style: textTheme.headline4!.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: kPadding,
                                        ),
                                        Text("@${e.tag}",
                                            style: textTheme.headline6),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kMediumPadding,
                                        vertical: kSmallPadding),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            kSmallPadding),
                                        color: kPrimaryColor),
                                    child: Text(
                                      send,
                                      style: textTheme.bodyText2!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        fontFamily: "DMSans",
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                color: kLightColor300,
                                thickness: 1,
                              )
                            ],
                          ))
                    ],
                  ),
          ),
          SizedBox(
            height: kRegularPadding,
          )
        ],
      ),
    );
  }

  Future<List<Contact>> getContacts() async {
    bool isGranted = await Permission.contacts.status.isGranted;
    if (!isGranted) {
      isGranted = await Permission.contacts.request().isGranted;
    }
    if (isGranted) {
      return await FastContacts.allContacts;
    }
    return [];
  }
}

class BankAccountModal extends StatefulWidget {
  const BankAccountModal({Key? key}) : super(key: key);

  @override
  State<BankAccountModal> createState() => _BankAccountModalState();
}

class _BankAccountModalState extends State<BankAccountModal> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _tag;
  String wholeText = "0";
  String decimalText = "00";
  FocusNode _focusNode = FocusNode();
  String? selectedBank;
  List<String> banks = ["Access", "UBA", "Sterling"];
  String? _accNo;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: kMediumPadding,
          right: kMediumPadding),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kMicroPadding),
            topRight: Radius.circular(kMicroPadding),
          ),
          color: kPrimaryWhite),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: kMacroPadding,
                    height: 3,
                    decoration: BoxDecoration(
                      color: kPurpleColor200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Center(
                  child: Text(
                    transferMoney,
                    textAlign: TextAlign.center,
                    style: textTheme.headline4!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                wholeText == ""
                    ? Form(
                        key: _formKey,
                        child: TextFormField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          style: textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 42,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'^\d+\.?\d{0,2}')),
                          ],
                          cursorColor: kPrimaryColor,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return emptyField;
                            } else {
                              return null;
                            }
                          },
                          focusNode: _focusNode,
                          decoration: InputDecoration(
                            // hintText: "0.00",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onSaved: (val) => setState(() => _tag = val),
                        ),
                      )
                    : inkWell(
                        onTap: () {
                          print(wholeText);
                          setState(() {
                            wholeText = "";
                          });
                          _focusNode.requestFocus();
                        },
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                                text: "₦",
                                style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 42,
                                ),
                                children: [
                                  TextSpan(
                                      text: wholeText,
                                      style: textTheme.subtitle1!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 42,
                                      )),
                                  TextSpan(
                                      text: ".",
                                      style: textTheme.headline3!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: kIconGrey,
                                        fontSize: 22,
                                      )),
                                  TextSpan(
                                      text: decimalText,
                                      style: textTheme.headline3!.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: kPrimaryTextColor,
                                        fontSize: 22,
                                      )),
                                ]),
                          ),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: SvgPicture.asset(
                          AssetPaths.walletIcon,
                          height: kRegularPadding,
                          width: kRegularPadding,
                        ),
                        decoration: BoxDecoration(
                            color: kLightPurple, shape: BoxShape.circle),
                        padding: EdgeInsets.all(kSmallPadding)),
                    Text(
                      "  $balance - ",
                      style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "₦",
                        style: TextStyle(
                          color: kPrimaryTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: "26,945",
                            style: textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          FormDropdown(
              hint: selectBankText,
              value: selectedBank,
              onChanged: (val) {
                selectedBank = val;
              },
              items: banks
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList()),
          SizedBox(
            height: kMicroPadding,
          ),
          TextInputNoIcon(
            textTheme: textTheme,
            text: accNumber,
            hintText: enterAccNumber,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10)
            ],
            onSaved: (val) => setState(() => _accNo = val),
            validator: (val) {
              if (val!.isEmpty) {
                return emptyField;
              } else if (val.length != 10) {
                return accNumberValidation;
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: kMacroPadding,
          ),
          LargeButton(
              title: continueText,
              onPressed: () {
                Navigator.pop(context);
                pushTo(context, TransferSummary(),
                    settings:
                        const RouteSettings(name: TransferSummary.routeName));
              }),
          SizedBox(
            height: kRegularPadding,
          )
        ],
      ),
    );
  }
}

List<String> iconList = [
  AssetPaths.pizzaImage,
  AssetPaths.bookImage,
  AssetPaths.bagImage,
  AssetPaths.carImage,
  AssetPaths.smileImage
];
