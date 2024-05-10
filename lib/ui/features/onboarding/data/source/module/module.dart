import 'package:pouchers/ui/features/onboarding/data/source/slide_source.dart';
import 'package:pouchers/ui/features/onboarding/data/source/slide_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderSourceModule = Provider<SliderSource>((_) => SliderSourceImpl());
