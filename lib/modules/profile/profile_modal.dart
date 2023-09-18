import 'dart:io';

import 'package:flutter/material.dart';
import 'package:Pouchers/utils/components.dart';
import 'package:Pouchers/utils/constant/theme_color_constants.dart';
import 'package:Pouchers/utils/strings.dart';
import 'package:Pouchers/utils/widgets.dart';
import 'package:collection/collection.dart';

class IdModal extends StatefulWidget {
  final List<String> idTypes;

  const IdModal({Key? key, required this.idTypes}) : super(key: key);

  @override
  State<IdModal> createState() => _IdModalState();
}

class _IdModalState extends State<IdModal> {
  String _selectedIdType = "";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return makeDismissible(
      context: context,
      child: DraggableScrollableSheet(
        initialChildSize: Platform.isIOS ? 0.38 : 0.53,
        maxChildSize: Platform.isIOS ? 0.38 : 0.53,
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
              ...widget.idTypes.mapIndexed(
                (index, e) => inkWell(
                  onTap: () {
                    setState(() => _selectedIdType = e);
                    Navigator.pop(context, _selectedIdType);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: kMediumPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: kMediumPadding),
                          child: Text(
                            e,
                            style: textTheme.headline4,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: kMediumPadding,
                        ),
                        Divider(
                          color: kLightPurple,
                          thickness: 1,
                          height: 0,
                        ),
                      ],
                    ),
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
