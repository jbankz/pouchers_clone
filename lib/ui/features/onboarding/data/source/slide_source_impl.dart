import 'package:pouchers/ui/features/onboarding/presentation/views/widgets/third_slide_widget.dart';
import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_images.dart';
import '../../../../widgets/gap.dart';
import '../../presentation/views/widgets/first_slide_widget.dart';
import '../../presentation/views/widgets/second_slide_widget.dart';
import 'slide_source.dart';

class SliderSourceImpl implements SliderSource {
  @override
  List<Widget> loadSliders() =>
      [_firstSlide(), _secondSlide(), const ThirSlideWidget()];
}

SingleChildScrollView _secondSlide() => SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(height: 39),
          SecondSlideWidget(
              alignmentGeometry: Alignment.centerRight,
              border: AppColors.kIconPink,
              asset: AppImage.wifiIcon,
              amount: 2000,
              title: 'for Internet'),
          const Gap(height: 25),
          SecondSlideWidget(
              border: AppColors.kPrimaryColor,
              asset: AppImage.airtimeIcon,
              amount: 2000,
              title: 'for airtime'),
          const Gap(height: 25),
          SecondSlideWidget(
              border: AppColors.limeGreen,
              alignmentGeometry: Alignment.centerRight,
              asset: AppImage.ticketIcon,
              amount: 2000,
              title: 'for ticket'),
          const Gap(height: 25),
          SecondSlideWidget(
              border: AppColors.kColorOrange,
              asset: AppImage.electricityIcon,
              amount: 2000,
              title: 'for Electricity'),
        ],
      ),
    );

SingleChildScrollView _firstSlide() => const SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Gap(height: 57),
          FirstSlideWidget(
              amount: 5000,
              title: 'Sis birthday money',
              alignmentGeometry: Alignment.topLeft),
          Gap(height: 57),
          FirstSlideWidget(
              amount: 7500,
              title: 'Mum’s upkeep',
              alignmentGeometry: Alignment.topRight),
          Gap(height: 58),
          FirstSlideWidget(
              amount: 5000,
              title: 'Bro’s benz cash',
              alignmentGeometry: Alignment.bottomLeft),
        ],
      ),
    );
