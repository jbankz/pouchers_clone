import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/slide_repo.dart';

class GetSlidersUseCaseImpl extends PoucherUseCaseWithOutParam<List<Widget>> {
  final SliderRepo sliderRepo;

  GetSlidersUseCaseImpl(this.sliderRepo);

  @override
  List<Widget> execute([CancelToken? cancelToken]) => sliderRepo.loadSliders();
}
