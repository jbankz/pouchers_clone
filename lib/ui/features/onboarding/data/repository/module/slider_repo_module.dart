import 'package:Pouchers/ui/features/onboarding/data/repository/slide_repo_impl.dart';
import 'package:Pouchers/ui/features/onboarding/data/source/module/module.dart';
import 'package:Pouchers/ui/features/onboarding/domain/repository/slide_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sliderRepoModule =
    Provider<SliderRepo>((ref) => SliderRepoImpl(ref.read(sliderSourceModule)));
