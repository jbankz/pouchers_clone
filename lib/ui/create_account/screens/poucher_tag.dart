import 'package:flutter/material.dart';
import 'package:pouchers/app/navigators/navigators.dart';
import 'package:pouchers/ui/tab_layout/tab_layout.dart';
import 'package:pouchers/utils/constants.dart';
import 'package:pouchers/utils/strings.dart';
import 'package:pouchers/utils/widgets.dart';

class PoucherTag extends StatefulWidget {
  const PoucherTag({Key? key}) : super(key: key);

  @override
  State<PoucherTag> createState() => _PoucherTagState();
}

class _PoucherTagState extends State<PoucherTag> {
  TextEditingController _tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InitialPage(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              poucherTag,
              style: textTheme.headline1,
            ),
            SizedBox(
              height: kPadding,
            ),
            Text(
              poucherTagSub,
              style: textTheme.bodyText1!,
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Container(
              child: TextFormField(
                keyboardType: TextInputType.text,
                style: textTheme.bodyText2!.copyWith(color: kPrimaryBlack),
                cursorColor: kPrimaryColor,
                validator: (val) {},
                controller: _tagController,
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  hintStyle: textTheme.headline6!.copyWith(
                      color: kSecondaryTextColor.withOpacity(0.7),
                      fontSize: 18),
                  prefixText: "@  ",
                  prefixStyle: textTheme.subtitle1!.copyWith(
                    color: kPrimaryTextColor.withOpacity(0.7),
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
            SizedBox(
              height: kFullPadding,
            ),
            LargeButton(
              title: createTag,
              onPressed: () {
                pushToAndClearStack(context, TabLayout());
              },
            ),
          ],
        ),
      ),
    );
  }
}
