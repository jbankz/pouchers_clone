// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReferralAdapter extends TypeAdapter<Referral> {
  @override
  final int typeId = 2;

  @override
  Referral read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Referral(
      earning: (fields[0] as List?)?.cast<Earning>(),
      referralTrail: (fields[1] as List?)?.cast<ReferralTrail>(),
    );
  }

  @override
  void write(BinaryWriter writer, Referral obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.earning)
      ..writeByte(1)
      ..write(obj.referralTrail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReferralAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReferralImpl _$$ReferralImplFromJson(Map<String, dynamic> json) =>
    _$ReferralImpl(
      earning: json['earning'] == null
          ? const []
          : const EarningSerializer().fromJson(json['earning']),
      referralTrail: json['referralTrail'] == null
          ? const []
          : const ReferralTrailSerializer().fromJson(json['referralTrail']),
    );

Map<String, dynamic> _$$ReferralImplToJson(_$ReferralImpl instance) =>
    <String, dynamic>{
      'earning': const EarningSerializer().toJson(instance.earning),
      'referralTrail':
          const ReferralTrailSerializer().toJson(instance.referralTrail),
    };
