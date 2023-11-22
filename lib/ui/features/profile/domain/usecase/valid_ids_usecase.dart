import 'package:Pouchers/ui/features/profile/domain/model/idenitification_type.dart';
import 'package:Pouchers/ui/features/profile/domain/repository/valid_id_repo.dart';
import 'package:dio/dio.dart';

import '../../../../../app/core/usecase/poucher_usecase.dart';

class ValidIdsUseCaseImpl
    implements PoucherUseCaseWithOutParam<List<IdentificationType>> {
  final ValidIdRepo _validIdRepo;

  ValidIdsUseCaseImpl(this._validIdRepo);

  @override
  List<IdentificationType> execute([CancelToken? cancelToken]) =>
      _validIdRepo.validIds();
}
