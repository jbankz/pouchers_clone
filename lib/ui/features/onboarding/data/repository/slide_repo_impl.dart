import 'package:Pouchers/ui/features/onboarding/data/source/slide_source.dart';
import 'package:flutter/material.dart';

import '../../domain/repository/slide_repo.dart';

class SliderRepoImpl implements SliderRepo {
  final SliderSource sliderSource;

  SliderRepoImpl(this.sliderSource);

  @override
  List<Widget> loadSliders() => sliderSource.loadSliders();
}
