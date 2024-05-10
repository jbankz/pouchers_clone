import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:screenshot/screenshot.dart';

part 'receipt_state.freezed.dart';

@Freezed(copyWith: true)
class ReceiptState<T> with _$ReceiptState<T> {
  const factory ReceiptState(
      {@Default(false) bool isProcessing,
      ScreenshotController? screenshotController}) = _ReceiptState<T>;
}
