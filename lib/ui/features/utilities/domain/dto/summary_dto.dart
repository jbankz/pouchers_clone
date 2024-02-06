import 'package:flutter/material.dart';

class SummaryDto {
  final String? imageUrl;
  final String? title;
  final String? recipient;
  final num? amount;
  final num? fee;
  final num? cashBack;
  final Widget? recipientWidget;
  final bool isGuest;

  SummaryDto(
      {this.imageUrl,
      this.title,
      this.recipient,
      this.amount,
      this.fee = 0,
      this.cashBack,
      this.recipientWidget,
      this.isGuest = false});
}
