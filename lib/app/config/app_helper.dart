import 'package:Pouchers/ui/notification/notification_tray.dart';
import 'package:Pouchers/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/manager/pdf_manager.dart';

class AppHelper {
  static Future<void> copy(String value) async {
    try {
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
    await Share.share(link, subject: subject);
  }

  static Future<void> triggerUrl(String url,
      {LaunchMode mode = LaunchMode.platformDefault}) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: mode);
      }
    } catch (e) {
      debugPrint('Could not launch: $e');
    }
  }

  static Future<void> handleError(dynamic e) async {
    triggerNotificationTray(e.toString(),
        error: true, ignoreIfNull: e.toString().isNull);
  }

  static Future<void> shareReceipt(
      {Uint8List? uint8list, pw.Widget? widget}) async {
    try {
      final String path = uint8list != null ? '.png' : '.pdf';
      await Printing.sharePdf(
        bytes: uint8list ??
            await PdfManager.generateReceipt(widget ?? pw.SizedBox.shrink()),
        filename: 'Receipt_${DateTime.now().millisecondsSinceEpoch}$path',
      );
    } catch (e) {
      debugPrint('Error sharing pdf: $e');
    }
  }
}
