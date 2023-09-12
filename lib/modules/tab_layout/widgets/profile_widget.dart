import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:Pouchers/app/helpers/notifiers.dart';
import 'package:Pouchers/data/hive_data.dart';
import 'package:Pouchers/modules/account/models/profile_model.dart';
import 'package:Pouchers/modules/account/providers/account_provider.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/flushbar.dart';
import 'package:Pouchers/utils/logger.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class KYCColumn extends StatelessWidget {
  final String title, subTitle;
  final int? tierLevel;
  final Function()? onTap;
  final bool isTag;

  const KYCColumn(
      {Key? key,
      required this.textTheme,
      required this.title,
      required this.subTitle,
      this.tierLevel,
      this.onTap, this.isTag = false})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inkWell(
          onTap: onTap,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: textTheme.headline2!.copyWith(
                    color: kIconGrey,
                  ),
                ),
              ),
              (title == idVerification && tierLevel != 3)
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: kSmallPadding, vertical: 2),
                      decoration: BoxDecoration(
                          color: kLightOrange100,
                          borderRadius: BorderRadius.circular(kSmallPadding)),
                      child: Text(
                        incomplete,
                        style: textTheme.headline4!.copyWith(
                          color: kLightOrange300,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : Text(
                      subTitle,
                      style: textTheme.subtitle1!.copyWith(
                        fontSize: 16,
                      ),
                    ),
              SizedBox(
                width: kSmallPadding,
              ),
              (title == idVerification && tierLevel == 3) ||isTag == true
                  ? SizedBox()
                  : Icon(
                      Icons.arrow_forward_ios,
                      color: kSecondaryTextColor,
                      size: kRegularPadding,
                    )
            ],
          ),
        ),
        SizedBox(
          height: kSmallPadding,
        ),
        Divider(
          color: kLightPurple,
          thickness: 1,
        ),
        SizedBox(
          height: title == poucherTag ? 0 : kSmallPadding,
        ),
      ],
    );
  }
}

class ProfileKYCDialog extends StatelessWidget {
  const ProfileKYCDialog({
    Key? key,
    required this.textTheme,
    required this.child,
  }) : super(key: key);

  final TextTheme textTheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kPrimaryWhite,
      insetPadding: EdgeInsets.symmetric(
        horizontal: kMacroPadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(kMicroPadding),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: kMicroPadding,
          vertical: kMediumPadding,
        ),
        child: child,
      ),
    );
  }
}

class EditFullNameModal extends StatefulWidget {
  const EditFullNameModal({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  State<EditFullNameModal> createState() => _EditFullNameModalState();
}

class _EditFullNameModalState extends State<EditFullNameModal> {
  String? _firstName;
  String? _lastName;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            fullName,
            style: widget.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: kMediumPadding),
          TextInputNoIcon(
            textTheme: widget.textTheme,
            text: firstName,
            onSaved: (val) => setState(() => _firstName = val),
            validator: (val) {
              if (val!.isEmpty) {
                return emptyField;
              } else if (val.length < 2) {
                return lessValueField;
              } else {
                return null;
              }
            },
          ),
          TextInputNoIcon(
            textTheme: widget.textTheme,
            text: lastName,
            onSaved: (val) => setState(() => _lastName = val),
            validator: (val) {
              if (val!.isEmpty) {
                return emptyField;
              } else if (val.length < 2) {
                return lessValueField;
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: kMicroPadding,
          ),
          Consumer(builder: (context, ref, _) {
            ref.listen(editProfileProvider,
                (previous, NotifierState<EditProfileResponse> next) {
              if (next.status == NotifierStatus.done) {
                Navigator.pop(context);
                showSuccessBar(context, next.data!.message);
                ref.read(editProfileInHouseProvider.notifier).state =
                    EditProfileData.fromJson(next.data!.data!.toJson());
              } else if (next.status == NotifierStatus.error) {
                showErrorBar(context, next.message!);
              }
            });
            var _widget =
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              inkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  cancel,
                  style: widget.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: kIconGrey,
                  ),
                ),
              ),
              SizedBox(
                width: kLargePadding,
              ),
              inkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref.read(editProfileProvider.notifier).editProfile(
                        firstName: _firstName, lastName: _lastName);
                  }
                },
                child: Text(
                  save,
                  style: widget.textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ]);

            return ref.watch(editProfileProvider).when(
                  done: (data) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget,
                );
          })
        ],
      ),
    );
  }
}

class EditAddressModal extends StatefulWidget {
  const EditAddressModal({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  State<EditAddressModal> createState() => _EditAddressModalState();
}

class _EditAddressModalState extends State<EditAddressModal> {
  String? _streetAddress;
  String? _city;
  String? _state;
  String? _postalCode;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            address,
            style: widget.textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: kMediumPadding),
          TextInputNoIcon(
            textTheme: widget.textTheme,
            text: addressStr,
            onSaved: (val) => setState(() => _streetAddress = val),
            validator: (val) {
              if (val!.isEmpty) {
                return emptyField;
              } else if (val.length < 2) {
                return lessValueField;
              } else {
                return null;
              }
            },
          ),
          TextInputNoIcon(
            textTheme: widget.textTheme,
            text: city,
            onSaved: (val) => setState(() => _city = val),
            validator: (val) {
              if (val!.isEmpty) {
                return emptyField;
              } else if (val.length < 2) {
                return lessValueField;
              } else {
                return null;
              }
            },
          ),
          TextInputNoIcon(
            textTheme: widget.textTheme,
            text: state,
            onSaved: (val) => setState(() => _state = val),
            validator: (val) {
              if (val!.isEmpty) {
                return emptyField;
              } else if (val.length < 2) {
                return lessValueField;
              } else {
                return null;
              }
            },
          ),
          TextInputNoIcon(
            textTheme: widget.textTheme,
            text: postalCode,
            inputType: TextInputType.number,
            onSaved: (val) => setState(() => _postalCode = val),
            validator: (val) {
              if (val!.isEmpty) {
                return emptyField;
              } else if (val.length < 2) {
                return lessValueField;
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: kMicroPadding,
          ),
          Consumer(builder: (context, ref, _) {
            ref.listen(editProfileProvider,
                (previous, NotifierState<EditProfileResponse> next) {
              if (next.status == NotifierStatus.done) {
                Navigator.pop(context);
                showSuccessBar(context, next.data!.message);
                ref.read(editProfileInHouseProvider.notifier).state =
                    EditProfileData.fromJson(next.data!.data!.toJson());
              } else if (next.status == NotifierStatus.error) {
                showErrorBar(context, next.message!);
              }
            });
            var _widget =
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              inkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  cancel,
                  style: widget.textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: kIconGrey,
                  ),
                ),
              ),
              SizedBox(
                width: kLargePadding,
              ),
              inkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ref.read(editProfileProvider.notifier).editProfile(
                          address: _streetAddress,
                          city: _city,
                          userState: _state,
                          postalCode: _postalCode,
                        );
                  }
                },
                child: Text(
                  save,
                  style: widget.textTheme.headline2!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ]);

            return ref.watch(editProfileProvider).when(
                  done: (data) => _widget,
                  loading: () => SpinKitDemo(),
                  error: (val) => _widget,
                );
          })
        ],
      ),
    );
  }
}

class GenderModal extends StatefulWidget {
  const GenderModal({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  State<GenderModal> createState() => _GenderModalState();
}

class _GenderModalState extends State<GenderModal> {
  String _genderType = male;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          gender,
          style: widget.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: kMacroPadding),
        inkWell(
          onTap: () {
            setState(() => _genderType = male);
          },
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        _genderType == male ? kPrimaryColor : kPurpleColor400,
                    width: 1.5,
                  ),
                ),
                child: _genderType == male
                    ? Container(
                        height: kSmallPadding,
                        width: kSmallPadding,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor,
                        ),
                      )
                    : SizedBox(
                        height: kSmallPadding,
                        width: kSmallPadding,
                      ),
              ),
              SizedBox(
                width: kMediumPadding,
              ),
              Text(
                male,
                style: widget.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        SizedBox(
          height: kLargePadding,
        ),
        inkWell(
          onTap: () {
            setState(() => _genderType = female);
          },
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        _genderType == female ? kPrimaryColor : kPurpleColor400,
                    width: 1.5,
                  ),
                ),
                child: _genderType == female
                    ? Container(
                        height: kSmallPadding,
                        width: kSmallPadding,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimaryColor,
                        ),
                      )
                    : SizedBox(
                        height: kSmallPadding,
                        width: kSmallPadding,
                      ),
              ),
              SizedBox(
                width: kMediumPadding,
              ),
              Text(
                female,
                style: widget.textTheme.subtitle1!
                    .copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        SizedBox(
          height: kLargePadding,
        ),
        Consumer(builder: (context, ref, _) {
          ref.listen(editProfileProvider,
              (previous, NotifierState<EditProfileResponse> next) {
            if (next.status == NotifierStatus.done) {
              Navigator.pop(context);
              showSuccessBar(context, next.data!.message);
              ref.read(editProfileInHouseProvider.notifier).state =
                  EditProfileData.fromJson(next.data!.data!.toJson());
            } else if (next.status == NotifierStatus.error) {
              showErrorBar(context, next.message!);
            }
          });
          var _widget =
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            inkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                cancel,
                style: widget.textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: kIconGrey,
                ),
              ),
            ),
            SizedBox(
              width: kLargePadding,
            ),
            inkWell(
              onTap: () {
                ref
                    .read(editProfileProvider.notifier)
                    .editProfile(gender: _genderType.toLowerCase());
              },
              child: Text(
                save,
                style: widget.textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ]);
          return ref.watch(editProfileProvider).when(
                done: (data) => _widget,
                loading: () => SpinKitDemo(),
                error: (val) => _widget,
              );
        })
      ],
    );
  }
}

class EditPhoneModal extends StatefulWidget {
  const EditPhoneModal({
    Key? key,
    required this.textTheme,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  State<EditPhoneModal> createState() => _EditPhoneModalState();
}

class _EditPhoneModalState extends State<EditPhoneModal> {
  String? _phone;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          phoneNumberText,
          style: widget.textTheme.subtitle1!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: kMacroPadding),
        TextInputNoIcon(
          textTheme: widget.textTheme,
          widget: SizedBox(),
          onSaved: (val) => setState(() => _phone = val),
          validator: (val) {
            if (val!.isEmpty) {
              return emptyField;
            } else {
              return null;
            }
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(11)
          ],
        ),
        SizedBox(
          height: kMicroPadding,
        ),
        Consumer(builder: (context, ref, _) {
          var _widget =
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            inkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                cancel,
                style: widget.textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: kIconGrey,
                ),
              ),
            ),
            SizedBox(
              width: kLargePadding,
            ),
            inkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ref.read(editProfileProvider.notifier).editProfile();
                }
              },
              child: Text(
                save,
                style: widget.textTheme.headline2!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ]);

          ref.listen(editProfileProvider,
              (previous, NotifierState<EditProfileResponse> next) {
            if (next.status == NotifierStatus.done) {
              Navigator.pop(context);
              showSuccessBar(context, next.data!.message);
              ref.read(editProfileInHouseProvider.notifier).state =
                  EditProfileData.fromJson(next.data!.data!.toJson());
            } else if (next.status == NotifierStatus.error) {
              showErrorBar(context, next.message!);
            }
          });
          return ref.watch(editProfileProvider).when(
                done: (data) => _widget,
                loading: () => SpinKitDemo(),
                error: (val) => _widget,
              );
        })
      ],
    );
  }
}

class ProfileRoleWidget extends StatelessWidget {
  final String text, subText;
  final Widget icon;
  final Color? color, textColor;
  final Function() onTap;

  const ProfileRoleWidget(
      {Key? key,
      required this.textTheme,
      required this.text,
      required this.onTap,
      required this.icon,
      this.color,
      this.textColor,
      required this.subText})
      : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return inkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: kMediumPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(kRegularPadding),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: color ?? kBackgroundColor),
                child: icon),
            SizedBox(
              width: kSmallPadding,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: textColor ?? kPrimaryTextColor),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  subText == ""
                      ? SizedBox()
                      : Text(
                          subText,
                          style: textTheme.headline6,
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PickerDialog extends StatelessWidget {
  final List<int>? dateNumbers;

  PickerDialog({this.dateNumbers});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 0.0,
      backgroundColor: kPrimaryColor,
      child: Container(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: dateNumbers!
                .map(
                  (e) => InkWell(
                    onTap: () {
                      Navigator.pop(context, e);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        e.toString(),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class BirthCalendar extends StatefulWidget {
  const BirthCalendar({Key? key}) : super(key: key);

  @override
  State<BirthCalendar> createState() => _BirthCalendarState();
}

class _BirthCalendarState extends State<BirthCalendar> {
  int? dateNumber = DateTime.now().year;

  List<int> dateTest = [];

  final dateFormat = DateFormat('dd-MM-yyyy');
  DateTime maximumSelected = DateTime(3000, 12, 31);
  DateTime minimumSelected = DateTime(1800, 01, 31);
  String? selectedDate;

  @override
  void initState() {
    super.initState();
    for (int i = minimumSelected.year + 1; i < maximumSelected.year + 1; i++) {
      dateTest.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kMediumPadding, vertical: kRegularPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
        color: kPrimaryWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Consumer(builder: (context, ref, _) {
            ref.listen(editProfileProvider,
                (previous, NotifierState<EditProfileResponse> next) {
              if (next.status == NotifierStatus.done) {
                Navigator.pop(context);
                showSuccessBar(context, next.data!.message);
                ref.read(editProfileInHouseProvider.notifier).state =
                    EditProfileData.fromJson(next.data!.data!.toJson());
              } else if (next.status == NotifierStatus.error) {
                showErrorBar(context, next.message!);
              }
            });
            var _widget = TableCalendar(
              firstDay: DateTime.utc(1800, 01, 31),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime(
                  dateNumber!, DateTime.now().month, DateTime.now().day),
              calendarStyle: CalendarStyle(
                defaultTextStyle:
                    textTheme.headline4!.copyWith(fontWeight: FontWeight.bold),
              ),
              onDaySelected: (date, date2) {
                ref
                    .read(editProfileProvider.notifier)
                    .editProfile(dob: dateFormat.format(date));
              },
              onHeaderTapped: (date) async {
                final result = await showDialog(
                  barrierDismissible: true,
                  useSafeArea: true,
                  context: context,
                  builder: (_) => PickerDialog(
                    dateNumbers: dateTest,
                  ),
                );
                if (result == null) {
                  return;
                } else {
                  setState(() {
                    dateNumber = result;
                  });
                }
                print("here");
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: textTheme.headline2!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: textTheme.headline4!
                      .copyWith(fontWeight: FontWeight.bold),
                  weekendStyle: textTheme.headline4!
                      .copyWith(fontWeight: FontWeight.bold)),
            );
            return ref.watch(editProfileProvider).when(
                  done: (data) => _widget,
                  loading: () => Padding(
                      padding: EdgeInsets.symmetric(vertical: kRegularPadding),
                      child: SpinKitDemo()),
                  error: (val) => _widget,
                );
          }),
        ],
      ),
    );
  }
}
