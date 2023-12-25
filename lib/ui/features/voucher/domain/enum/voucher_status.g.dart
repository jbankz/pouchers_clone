// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VoucherStatusAdapter extends TypeAdapter<VoucherStatus> {
  @override
  final int typeId = 16;

  @override
  VoucherStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VoucherStatus.inactive;
      case 1:
        return VoucherStatus.active;
      case 2:
        return VoucherStatus.allType;
      case 3:
        return VoucherStatus.redeemed;
      case 4:
        return VoucherStatus.gifted;
      default:
        return VoucherStatus.inactive;
    }
  }

  @override
  void write(BinaryWriter writer, VoucherStatus obj) {
    switch (obj) {
      case VoucherStatus.inactive:
        writer.writeByte(0);
        break;
      case VoucherStatus.active:
        writer.writeByte(1);
        break;
      case VoucherStatus.allType:
        writer.writeByte(2);
        break;
      case VoucherStatus.redeemed:
        writer.writeByte(3);
        break;
      case VoucherStatus.gifted:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoucherStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
