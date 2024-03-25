import 'package:pouchers/ui/features/admin/domain/model/banner.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_state.freezed.dart';

@Freezed(copyWith: true)
class AdminState<T> with _$AdminState<T> {
  const factory AdminState(
      {@Default(false) bool isBusy,
      @Default([]) List<Banner> banner,
      String? errorMessage,
      StackTrace? stackTrace}) = _AdminState<T>;
}
