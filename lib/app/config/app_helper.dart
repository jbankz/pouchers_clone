import 'dart:io';

import 'package:Pouchers/ui/notification/notification_tray.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/manager/pdf_manager.dart';
import 'app_logger.dart';

class AppHelper {
  static final logger = getLogger("AppHelper");

  static Future<void> copy(String value) async {
    try {
      await HapticFeedback.selectionClick();

      Clipboard.setData(ClipboardData(text: value));
      triggerNotificationTray('Copied');
    } catch (e) {
      debugPrintStack(label: e.toString());
    }
  }

  static String maskNumber(String phoneNumber) {
    // Check if the input is valid
    if (phoneNumber.length != 10 ||
        !phoneNumber.startsWith(RegExp(r'^[0-9]+$'))) {
      // Return an error message or handle the invalid input as needed
      return '';
    }

    // Mask the phone number
    final String maskedNumber = '**** *** ${phoneNumber.substring(6)}';
    return maskedNumber;
  }

  static Future<void> share(String link, {String? subject}) async {
    await HapticFeedback.selectionClick();

    await Share.share(link, subject: subject);
  }

  static Future<void> triggerUrl(String url,
      {LaunchMode mode = LaunchMode.platformDefault}) async {
    try {
      await HapticFeedback.selectionClick();

      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: mode);
      }
    } catch (e) {
      logger.e('Could not launch: $e');
    }
  }

  static Future<void> handleError(dynamic e) async {
    triggerNotificationTray(e.toString(),
        error: true, ignoreIfNull: e.toString().isNull);
  }

  static Future<void> shareReceipt(
      {Uint8List? uint8list, pw.Widget? widget}) async {
    try {
      await HapticFeedback.selectionClick();

      final String path = uint8list != null ? '.png' : '.pdf';
      await Printing.sharePdf(
        bytes: uint8list ??
            await PdfManager.generateReceipt(widget ?? pw.SizedBox.shrink()),
        filename: 'Receipt_${DateTime.now().millisecondsSinceEpoch}$path',
      );
    } catch (e) {
      logger.e('Error sharing pdf: $e');
    }
  }

  static Future<String> createFolderInAppDocDir(
      [String folderName = 'Receipts']) async {
    //Get this App Document Directory
    final Directory? appDocDir = Platform.isIOS
        ? await getApplicationDocumentsDirectory()
        : await getExternalStorageDirectory();

    //App Document Directory + folder name
    final Directory appDocDirFolder =
        Directory('${appDocDir?.path}/$folderName');

    if (await appDocDirFolder.exists()) {
      //if folder already exists return path
      return appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory appDocDirNewFolder =
          await appDocDirFolder.create(recursive: true);

      return appDocDirNewFolder.path;
    }
  }
}
