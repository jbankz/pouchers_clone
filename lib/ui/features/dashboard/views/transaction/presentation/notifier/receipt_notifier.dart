import 'dart:io';
import 'dart:typed_data';

import 'package:Pouchers/app/config/app_helper.dart';
import 'package:Pouchers/ui/features/dashboard/views/transaction/domain/model/transaction_history.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../../../app/app.logger.dart';
import '../../../../../../common/app_strings.dart';
import '../../../../../../notification/notification_tray.dart';
import '../receipt/transaction_receipt.dart';
import '../state/receipt_state.dart';

part 'receipt_notifier.g.dart';

@riverpod
class ReceiptNotifier extends _$ReceiptNotifier {
  final _logger = getLogger('ReceiptNotifier');

  final ScreenshotController screenshotController = ScreenshotController();

  @override
  ReceiptState build() =>
      ReceiptState(screenshotController: screenshotController);

  Future<void> downloadPdf(TransactionHistory transactionHistory) async {
    try {
      state = state.copyWith(isProcessing: true);
      final pdf = pw.Document();

      final permission = await Permission.storage.request();

      if (permission.isGranted) {
        final response = await generateTransactionReceipt(transactionHistory);

        pdf.addPage(pw.Page(build: (context) => response));

        final folder = await AppHelper.createFolderInAppDocDir();

        final file = File("$folder/${DateTime.now().toIso8601String()}.pdf");

        final pdfBytes = await pdf.save();
        await file.writeAsBytes(pdfBytes);

        triggerNotificationTray(AppString.showReceiptMessage);
      }
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isProcessing: false);
    }
  }

  Future<void> shareImage() async {
    try {
      state = state.copyWith(isProcessing: true);

      final image = await _generateImage();

      if (image != null) {
        await Share.shareXFiles([XFile(image.path)]);
        triggerNotificationTray(AppString.showReceiptMessage);
      }
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isProcessing: false);
    }
  }

  Future<void> downloadImage() async {
    try {
      state = state.copyWith(isProcessing: true);

      final image = await _generateImage();

      if (image != null) {
        await ImageGallerySaver.saveImage(image.readAsBytesSync());
        triggerNotificationTray(AppString.showReceiptMessage);
      }
    } catch (e) {
      _logger.e(e);
    } finally {
      state = state.copyWith(isProcessing: false);
    }
  }

  Future<File?> _generateImage({String fileExtention = 'png'}) async {
    File? file;

    final permission = await Permission.storage.request();
    if (permission.isGranted) {
      await screenshotController
          .capture(delay: const Duration(milliseconds: 10))
          .then((Uint8List? image) async {
        if (image != null) {
          final folder = await AppHelper.createFolderInAppDocDir();

          final imagePath = await File(
                  '$folder/${DateTime.now().toIso8601String()}.$fileExtention')
              .create();
          file = await imagePath.writeAsBytes(image);
        }
      });
    }

    return file;
  }
}
