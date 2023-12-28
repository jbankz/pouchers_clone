import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfManager {
  static Future<Uint8List> generateReceipt(pw.Widget receipt) async {
    final pdf = pw.Document()
      ..addPage(pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => pw.Padding(
              padding:
                  pw.EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: receipt)));

    return await pdf.save();
  }
}
