import 'package:flutter/material.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';

class ProfileModal extends StatefulWidget {
  final List<String> methods;

  const ProfileModal({Key? key, required this.methods}) : super(key: key);

  @override
  State<ProfileModal> createState() => _ProfileModalState();
}

class _ProfileModalState extends State<ProfileModal> {
  String _prefixText = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.37,
        maxChildSize: 0.37,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kMicroPadding),
                topRight: Radius.circular(kMicroPadding),
              ),
              color: kPrimaryWhite),
          child: ListView(
            controller: controller,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: kMacroPadding,
                  height: 5,
                  decoration: BoxDecoration(
                    color: kPurpleColor200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(
                height: kMicroPadding,
              ),
              Text(
                idType,
                style: textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              ...widget.methods.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: kRegularPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: kMediumPadding),
                        child: inkWell(
                          onTap: () {
                            setState(() => _prefixText = e);
                            Navigator.pop(context, _prefixText);
                          },
                          child: Text(
                            e,
                            style: textTheme.headline4,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSmallPadding,
                      ),
                      Divider(
                        color: kLightPurple,
                        thickness: 1,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
