import 'package:pouchers/ui/features/profile/data/source/valid_id/valid_id_source.dart';
import 'package:pouchers/ui/features/profile/domain/model/idenitification_type.dart';
import 'package:pouchers/ui/features/profile/domain/repository/valid_id_repo.dart';

class ValidIdRepoImpl implements ValidIdRepo {
  final ValidIdSource _validIdSource;

  ValidIdRepoImpl(this._validIdSource);

  @override
  List<IdentificationType> validIds() => _validIdSource.validIds();
}
