import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/app/navigators/navigators.dart';
import 'package:Pouchers/modules/login/models/login_response.dart';
import 'package:Pouchers/modules/make_payment/models/make_payment_model.dart';
import 'package:Pouchers/modules/make_payment/providers/payment_providers.dart';
import 'package:Pouchers/modules/make_payment/screens/transfer_summary.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/input_formatters.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:flutter/services.dart';
import 'package:Pouchers/utils/utils.dart';
import 'package:Pouchers/utils/widgets.dart';

class TransferModal extends ConsumerStatefulWidget {
  final bool isRequest;

  const TransferModal({Key? key, required this.isRequest}) : super(key: key);

  @override
  ConsumerState<TransferModal> createState() => _TransferModalState();
}

class _TransferModalState extends ConsumerState<TransferModal> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _tag;
  String? _errorText = "";
  Map<String, dynamic> contactInfo = {};
  List<ContactListData> contactData = [];
  String? lastInputValue;


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListenerPage(
      child: Container(
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
          physics: NeverScrollableScrollPhysics(),
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
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                              RegExp(r'\s')),
                        ],
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
                        onChanged: (inputValue) {
                          if (inputValue.isNotEmpty) {
                            if (lastInputValue != inputValue) {
                              lastInputValue = inputValue;
                              ref
                                  .read(getContactByPoucherTagProvider.notifier)
                                  .getContactByPoucherTag(poucherTag: inputValue);
                            }
                          }
                          // if (val.isNotEmpty) {
                          //   Future.delayed(Duration(seconds: 2)).then((value) =>
                          //       ref
                          //           .read(getContactByPoucherTagProvider.notifier)
                          //           .getContactByPoucherTag(poucherTag: val));
                          // }
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

                                    _errorText = "";
                                    contactInfo["phoneNumber"] =
                                        next.data!["phoneNumber"] ?? "";
                                    contactInfo["firstName"] =
                                        next.data!["firstName"] ?? "";
                                    contactInfo["lastName"] =
                                        next.data!["lastName"] ?? "";
                                    contactInfo["profilePicture"] =
                                        next.data!["profilePicture"] ?? "";
                                    contactInfo["tag"] = next.data!["tag"] ?? "";
                                  });

                                  print(next.data);
                                } else if (next.status == NotifierStatus.error) {
                                  setState(() {
                                    _errorText = next.message ?? "";
                                  });
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
                  _errorText != ""
                      ? Text(
                          _errorText!,
                          style: textTheme.bodyText1!.copyWith(color: kColorRed),
                        )
                      : contactInfo.isEmpty
                          ? SizedBox()
                          : inkWell(
                              onTap: () {
                                Navigator.pop(context, contactInfo);
                              },
                              child: Row(
                                children: [
                                  contactInfo["profilePicture"] != null && contactInfo["profilePicture"].isNotEmpty
                                      ? ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(116),
                                      child: CachedNetworkImage(
                                        height: 40,
                                        width: 40,
                                        imageUrl:
                                        contactInfo["profilePicture"],
                                        placeholder: (context, url) =>
                                            Container(
                                              color: Colors.transparent,
                                              height: 40,
                                              width: 40,
                                              child: const Center(
                                                child: CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  valueColor:
                                                  AlwaysStoppedAnimation<
                                                      Color>(kPrimaryColor),
                                                ),
                                              ),
                                            ),
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                        contactInfo["profilePicture"] !=
                                            null
                                            ? Image.network(
                                          contactInfo[
                                          "profilePicture"],
                                          fit: BoxFit.fill,
                                          loadingBuilder: (BuildContext
                                          context,
                                              Widget child,
                                              ImageChunkEvent?
                                              loadingProgress) {
                                            if (loadingProgress ==
                                                null) return child;
                                            return Center(
                                              child:
                                              CircularProgressIndicator(
                                                value: loadingProgress
                                                    .expectedTotalBytes !=
                                                    null
                                                    ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                        )
                                            : Center(
                                          child: Text(
                                              "${contactInfo["firstName"]!.substring(0, 1).toUpperCase()}${contactInfo["lastName"]!.substring(0, 1).toUpperCase()}",
                                              style: textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                  fontSize:
                                                  22)),
                                        ),
                                      ))
                                      : SizedBox(),
                                  SizedBox(
                                    width: kRegularPadding,
                                  ),
                                  Text(
                                    "${contactInfo["firstName"].toString().toTitleCase2()} ${contactInfo["lastName"].toString().toTitleCase2()}",
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
                                    List<Contact> allContact =
                                        await getContacts();
                                    List<String> phones = [];
                                    allContact.forEach((element) {
                                      setState(() {
                                        phones.addAll(element.phones);
                                      });
                                    });
                                    if (phones.isNotEmpty) {
                                      List<String> phoneReplaced = [];
                                      List<String> phoneReplaced1 = [];
                                      phones.forEach((element) {
                                        // element.replaceAll("234", "0");
                                        // element.replaceAll(" ", "");
                                        phoneReplaced
                                            .add(element.replaceAll("+234", "0"));
                                      });
                                      phoneReplaced.forEach((element) {
                                        phoneReplaced1
                                            .add(element.replaceAll(" ", ""));
                                      });
                                      ref
                                          .read(getAllContactsProvider.notifier)
                                          .getAllContacts(
                                            contacts: phoneReplaced1,
                                          );
                                    } else {
                                      showErrorBar(context,
                                          "You have no contact on your list");
                                    }
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
                                            e.profilePicture != null
                                                ? Image.network(
                                                    e.profilePicture!,
                                                    fit: BoxFit.fill,
                                                    loadingBuilder:
                                                        (BuildContext context,
                                                            Widget child,
                                                            ImageChunkEvent?
                                                                loadingProgress) {
                                                      if (loadingProgress == null)
                                                        return child;
                                                      return Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          value: loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null
                                                              ? loadingProgress
                                                                      .cumulativeBytesLoaded /
                                                                  loadingProgress
                                                                      .expectedTotalBytes!
                                                              : null,
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : Center(
                                                    child: Text(
                                                        "${e.firstName!.substring(0, 1).toUpperCase()}${e.lastName!.substring(0, 1).toUpperCase()}",
                                                        style: textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                                fontSize: 22)),
                                                  ),
                                      ),
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

class BankAccountModal extends ConsumerStatefulWidget {
  const BankAccountModal({Key? key}) : super(key: key);

  @override
  ConsumerState<BankAccountModal> createState() => _BankAccountModalState();
}

class _BankAccountModalState extends ConsumerState<BankAccountModal> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _amount;
  String wholeText = "0";
  String decimalText = "00";
  FocusNode _focusNode = FocusNode();
  GetAllBanksDetail? _selectedBank;
  List<GetAllBanksDetail> banks = [];
  String? _accNo;
  TextEditingController amountController = TextEditingController();
  TextEditingController accNumberController = TextEditingController();
  int durationTime = 2;
  Map<String, dynamic> item = {};
  HiveStoreResponseData userProfile = Hive.box(kUserBox).get(kUserInfoKey);
  String? accName;
  String _errorText = "";
  String _amountChange = "0";
  double? fee;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getAllBanksProvider.notifier).getAllBanks();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: Container(
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
                      ? TextFormField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          controller: amountController,
                          style: textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 42,
                          ),
                          onChanged: (val) {
                            if (val.isEmpty) {
                              setState(() {
                                _amountChange = "0";
                                wholeText = "0";
                              });
                            } else {
                              setState(() {
                                _amountChange = val;
                              });
                            }
                          },
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
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onSaved: (val) => setState(() => _amount = val),
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
                  ref.watch(getWalletProvider).data == null
                      ? SizedBox()
                      : double.parse(_amountChange) >
                              double.parse(ref
                                      .watch(getWalletProvider)
                                      .data!
                                      .data!
                                      .balance ??
                                  "0")
                          ? Center(
                              child: Column(
                                children: [
                                  Text(
                                    insufficient,
                                    style: textTheme.headline4!
                                        .copyWith(color: kColorOrange),
                                  ),
                                  SizedBox(
                                    height: kRegularPadding,
                                  )
                                ],
                              ),
                            )
                          : SizedBox(),
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
                      ref.watch(getWalletProvider).data == null
                          ? Text(
                              "₦0.00",
                              style: TextStyle(
                                color: kPrimaryTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            )
                          : RichText(
                              text: TextSpan(
                                text: "₦",
                                style: TextStyle(
                                  color: kPrimaryTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                    text: kPriceFormatter(double.parse(ref
                                            .watch(getWalletProvider)
                                            .data!
                                            .data!
                                            .balance ??
                                        "0.00")),
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
            Consumer(builder: (context, ref, _) {
              ref.listen(getAllBanksProvider,
                  (previous, NotifierState<GetAllBanksResponse> next) {
                if (next.status == NotifierStatus.error) {
                  showErrorBar(context, next.message ?? "");
                }
              });
              var _widget = Container(
                padding: EdgeInsets.symmetric(horizontal: kSmallPadding),
                height: 56,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kSmallPadding),
                    color: kBackgroundColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectBankText,
                      style: textTheme.subtitle1!
                          .copyWith(color: kPrimaryTextColor),
                    ),
                    SpinKitDemo(
                      size: kMicroPadding,
                    )
                  ],
                ),
              );
              return ref.watch(getAllBanksProvider).when(
                    done: (data) {
                      if (data != null) {
                        data.data!.data!.forEach((element) {
                          banks.add(element);
                        });
                        var seen = Set<String>();
                        List<GetAllBanksDetail> uniquelist =
                            banks.where((bank) => seen.add(bank.attributes?.name ?? "")).toList();
                        uniquelist.sort((a,b) => a.attributes!.name!.toUpperCase().compareTo(b.attributes!.name!.toUpperCase()));
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 60,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: kBorderSmallRadius,
                                color: kBackgroundColor,
                                // border: Border.all(
                                //   color: borderColor,
                                // ),
                              ),
                              child: Center(
                                child: DropdownButton(
                                  value: _selectedBank,
                                  itemHeight: 60,
                                  isExpanded: true,
                                  borderRadius: kBorderMidRadius,
                                  hint: Text(
                                    selectBankText,
                                    style: textTheme.subtitle1!.copyWith(
                                        color: kIconGrey),
                                  ),
                                  style: textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                                  underline: const SizedBox(),
                                  menuMaxHeight:
                                  MediaQuery.of(context).size.height / 2,
                                  onChanged: (GetAllBanksDetail? val) {
                                    setState(() {
                                      _selectedBank = val;
                                          if (accNumberController.text.isNotEmpty &&
                                              accNumberController.text.length == 10) {
                                            ref
                                                .read(getAccountDetailsProvider.notifier)
                                                .getAccountDetails(
                                                    accountNumber: accNumberController.text,
                                                    amount: "100.00",
                                                    bankName: _selectedBank!.attributes!.name ?? "");
                                          }
                                    });

                                  },
                                  items: uniquelist
                                      .map((e) => DropdownMenuItem(
                                    child: Text(e.attributes?.name ?? ""),
                                    value: e,
                                  ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        );
                          // FormDropdown<GetAllBanksResponseData>(
                          //   hint: selectBankText,
                          //   value: _selectedBank,
                          //   onChanged: (GetAllBanksResponseData? val) {
                          //     _selectedBank = val;
                          //     if (accNumberController.text.isNotEmpty &&
                          //         accNumberController.text.length == 10) {
                          //       ref
                          //           .read(getAccountDetailsProvider.notifier)
                          //           .getAccountDetails(
                          //               accountNumber: accNumberController.text,
                          //               amount: "100.00",
                          //               bankName: _selectedBank!.name);
                          //     }
                          //   },
                          //   items: uniquelist
                          //       .map((e) =>
                          //           DropdownMenuItem<GetAllBanksResponseData>(
                          //             child: Text(e.name),
                          //             value: e,
                          //           ))
                          //       .toList());
                      } else {
                        return _widget;
                      }
                    },
                    loading: () => _widget,
                    error: (val) => FormDropdown<GetAllBanksDetail>(
                      hint: selectBankText,
                      value: _selectedBank,
                      onChanged: null,
                      items: const [],
                    ),
                  );
            }),
            SizedBox(
              height: kMicroPadding,
            ),
            TextInputNoIcon(
              textTheme: textTheme,
              text: accNumber,
              addSpace: false,
              hintText: enterAccNumber,
              controller: accNumberController,
              inputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10)
              ],
              onSaved: (val) => setState(() => _accNo = val),
              onChanged: (val) {
                if (val != null) {
                  if (val.length == 10) {
                    if (_selectedBank != null) {
                      ref
                          .read(getAccountDetailsProvider.notifier)
                          .getAccountDetails(
                              accountNumber: val,
                              amount: "100.00",
                              bankName: _selectedBank!.attributes?.name ?? "");
                    } else {
                      showErrorBar(context, "Please select a bank");
                    }
                  }
                }
              },
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
            Consumer(builder: (context, ref, _) {
              ref.listen(getAccountDetailsProvider,
                  (previous, NotifierState<AccountDetailsResponse> next) {
                if (next.status == NotifierStatus.done) {
                  setState(() {
                    accName = next.data!.data!.accountName;
                    fee = next.data!.data!.transactionFee;
                    _errorText = "";
                  });
                } else if (next.status == NotifierStatus.error) {
                  setState(() {
                    _errorText = next.message ?? "error";
                  });
                }
              });
              var _widget = Container(
                padding: EdgeInsets.only(top: kSmallPadding),
                child: Row(
                  children: [
                    Container(
                      child: SvgPicture.asset("${iconPath}nav_account.svg"),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(233, 230, 253, 0.7),
                          shape: BoxShape.circle),
                      padding: EdgeInsets.all(kPadding),
                    ),
                    SizedBox(
                      width: kSmallPadding,
                    ),
                    Flexible(
                      child: Text(
                        accName ?? "No name",
                        style: textTheme.subtitle1!.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              );
              return ref.watch(getAccountDetailsProvider).when(
                  idle: () => SizedBox(),
                  done: (data) => _widget,
                  loading: () => Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            padding: EdgeInsets.only(top: kSmallPadding),
                            width: 30,
                            child: SpinKitThreeBounce(
                              color: kPrimaryColor,
                              size: 10.0,
                            )),
                      ),
                  error: (val) => Text(
                        val ?? "",
                        style: textTheme.headline4!.copyWith(color: kColorRed),
                      ));
            }),
            SizedBox(
              height: kMacroPadding,
            ),
            LargeButton(
                title: continueText,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (_selectedBank != null &&
                        amountController.text.isNotEmpty &&
                        accNumberController.text.isNotEmpty &&
                        _errorText.isEmpty &&
                        double.parse(_amountChange) <
                            double.parse(ref
                                    .watch(getWalletProvider)
                                    .data!
                                    .data!
                                    .balance ??
                                "0")) {
                      pushTo(
                          context,
                          TransferSummary(
                              transferName: _selectedBank!.attributes?.name ,
                              accNo: _accNo,
                              amount: _amount,
                              fee: fee ?? 0,
                              beneficiary: accName),
                          settings: const RouteSettings(
                              name: TransferSummary.routeName));
                    } else if (_errorText.isNotEmpty) {
                      showErrorBar(context, "The account details is not valid");
                    } else if (double.parse(_amountChange) >
                        double.parse(
                            ref.watch(getWalletProvider).data!.data!.balance ??
                                "0")) {
                      showErrorBar(context, insufficient);
                    } else {
                      showErrorBar(context, "Please Input all fields");
                    }
                  }
                }),
            SizedBox(
              height: kRegularPadding,
            )
          ],
        ),
      ),
    );
  }
}

List<String> iconList = ["🍕", "📚", "👜", "🚘", "🥰"];

class TransferRowWidget extends StatelessWidget {
  final Widget icon;
  final String text;
  final Function() onTap;

  const TransferRowWidget({
    required this.icon,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Expanded(
        child: inkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
           vertical: kRegularPadding),
        decoration: BoxDecoration(
          color: kContainerColor,
          borderRadius: BorderRadius.circular(kSmallPadding),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: kSmallPadding,
            ),
            Flexible(
              child: Text(
                text,
                style: textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14, ),
                // textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
