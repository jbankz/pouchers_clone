import 'package:pouchers/ui/features/admin/domain/model/banner.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';
import '../repository/admin_repo.dart';

class BannerUseCaseImpl
    implements PoucherUseCaseWithOutParam<Future<List<Banner>>> {
  final AdminRepo _adminRepo;

  BannerUseCaseImpl(this._adminRepo);

  @override
  Future<List<Banner>> execute([CancelToken? cancelToken]) async =>
      await _adminRepo.banners(cancelToken: cancelToken);
}
