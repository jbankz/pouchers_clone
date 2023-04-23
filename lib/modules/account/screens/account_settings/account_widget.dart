import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Pouchers/app/common/listener.dart';
import 'package:Pouchers/utils/assets_path.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';


class BiometricModal extends StatefulWidget {
  const BiometricModal({
    Key? key,
  }) : super(key: key);

  @override
  State<BiometricModal> createState() => _BiometricModalState();
}

class _BiometricModalState extends State<BiometricModal> {

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListenerPage(
      child: Container(
        padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 20),
        decoration: BoxDecoration(
            borderRadius:
            const BorderRadius.only(
              topLeft: Radius.circular(
                  kMicroPadding),
              topRight: Radius.circular(
                  kMicroPadding),
            ),
            color: kPrimaryWhite),
        child: ListView(
          shrinkWrap: true,
          physics:
          NeverScrollableScrollPhysics(),
          children: [
            Center(
              child: Container(
                alignment: Alignment.center,
                width: kMacroPadding,
                height: 5,
                decoration: BoxDecoration(
                  color: kPurpleColor200,
                  borderRadius:
                  BorderRadius.circular(4),
                ),
              ),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Container(
              padding: EdgeInsets.all(
                kMediumPadding,
              ),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(
                    kMacroPadding),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor
                        .withOpacity(
                      0.2,
                    )),
                child: Image.asset(
                  Platform.isAndroid
                      ? AssetPaths.fingerprint
                      : AssetPaths.faceId,
                  color: kPrimaryColor,
                  fit: BoxFit.scaleDown,
                  height: 75, width: 75,
                ),
              ),
            ),
            SizedBox(
              height: kMacroPadding,
            ),
            Text(
              biometricLogin,
              style: textTheme.subtitle1!
                  .copyWith(
                  fontWeight:
                  FontWeight.w500,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: kSmallPadding,
            ),
            Text(
              fingerprintSensor,
              style:
              textTheme.bodyText1!.copyWith(
                color: kIconGrey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: kRegularPadding,
            ),
          ],
        ),
      ),
    );
  }
}
