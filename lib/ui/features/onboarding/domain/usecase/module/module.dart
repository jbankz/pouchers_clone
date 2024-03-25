import 'package:pouchers/ui/features/onboarding/data/repository/module/slider_repo_module.dart';
import 'package:pouchers/ui/features/onboarding/domain/usecase/get_sliders_usecase.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../../../app/core/usecase/poucher_usecase.dart';

final getSliderUseCaseModule = Provider<PoucherUseCaseWithOutParam>(
    (ref) => GetSlidersUseCaseImpl(ref.read(sliderRepoModule)));
