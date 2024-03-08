import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../app/config/app_helper.dart';
import '../../../../../../../common/app_images.dart';
import '../../../../../../../widgets/gap.dart';

class BuildCardDetailsTile extends StatelessWidget {
  const BuildCardDetailsTile(
      {super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (value.isNotEmpty) AppHelper.copy(value);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style:
                    context.displaySmall?.copyWith(fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            const Gap(width: 47),
            Expanded(
              child: Text(
                value,
                style: context.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Gap(width: 9),
            SvgPicture.asset(AppImage.copyIcon)
          ],
        ),
      );
}
