// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Billers _$BillersFromJson(Map<String, dynamic> json) {
  return _Billers.fromJson(json);
}

/// @nodoc
mixin _$Billers {
  @HiveField(0)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get category => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get status => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'logo_url')
  String? get logoUrl => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get operatorpublicid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillersCopyWith<Billers> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillersCopyWith<$Res> {
  factory $BillersCopyWith(Billers value, $Res Function(Billers) then) =
      _$BillersCopyWithImpl<$Res, Billers>;
  @useResult
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) @JsonKey(name: 'display_name') String? displayName,
      @HiveField(2) String? category,
      @HiveField(3) String? status,
      @HiveField(4) @JsonKey(name: 'logo_url') String? logoUrl,
      @HiveField(5) String? operatorpublicid});
}

/// @nodoc
class _$BillersCopyWithImpl<$Res, $Val extends Billers>
    implements $BillersCopyWith<$Res> {
  _$BillersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? displayName = freezed,
    Object? category = freezed,
    Object? status = freezed,
    Object? logoUrl = freezed,
    Object? operatorpublicid = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      operatorpublicid: freezed == operatorpublicid
          ? _value.operatorpublicid
          : operatorpublicid // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillersImplCopyWith<$Res> implements $BillersCopyWith<$Res> {
  factory _$$BillersImplCopyWith(
          _$BillersImpl value, $Res Function(_$BillersImpl) then) =
      __$$BillersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? name,
      @HiveField(1) @JsonKey(name: 'display_name') String? displayName,
      @HiveField(2) String? category,
      @HiveField(3) String? status,
      @HiveField(4) @JsonKey(name: 'logo_url') String? logoUrl,
      @HiveField(5) String? operatorpublicid});
}

/// @nodoc
class __$$BillersImplCopyWithImpl<$Res>
    extends _$BillersCopyWithImpl<$Res, _$BillersImpl>
    implements _$$BillersImplCopyWith<$Res> {
  __$$BillersImplCopyWithImpl(
      _$BillersImpl _value, $Res Function(_$BillersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? displayName = freezed,
    Object? category = freezed,
    Object? status = freezed,
    Object? logoUrl = freezed,
    Object? operatorpublicid = freezed,
  }) {
    return _then(_$BillersImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      operatorpublicid: freezed == operatorpublicid
          ? _value.operatorpublicid
          : operatorpublicid // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 12, adapterName: 'BillersAdapter')
class _$BillersImpl implements _Billers {
  _$BillersImpl(
      {@HiveField(0) this.name,
      @HiveField(1) @JsonKey(name: 'display_name') this.displayName,
      @HiveField(2) this.category,
      @HiveField(3) this.status,
      @HiveField(4) @JsonKey(name: 'logo_url') this.logoUrl,
      @HiveField(5) this.operatorpublicid});

  factory _$BillersImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillersImplFromJson(json);

  @override
  @HiveField(0)
  final String? name;
  @override
  @HiveField(1)
  @JsonKey(name: 'display_name')
  final String? displayName;
  @override
  @HiveField(2)
  final String? category;
  @override
  @HiveField(3)
  final String? status;
  @override
  @HiveField(4)
  @JsonKey(name: 'logo_url')
  final String? logoUrl;
  @override
  @HiveField(5)
  final String? operatorpublicid;

  @override
  String toString() {
    return 'Billers(name: $name, displayName: $displayName, category: $category, status: $status, logoUrl: $logoUrl, operatorpublicid: $operatorpublicid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillersImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.operatorpublicid, operatorpublicid) ||
                other.operatorpublicid == operatorpublicid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, displayName, category,
      status, logoUrl, operatorpublicid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillersImplCopyWith<_$BillersImpl> get copyWith =>
      __$$BillersImplCopyWithImpl<_$BillersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillersImplToJson(
      this,
    );
  }
}

abstract class _Billers implements Billers {
  factory _Billers(
      {@HiveField(0) final String? name,
      @HiveField(1) @JsonKey(name: 'display_name') final String? displayName,
      @HiveField(2) final String? category,
      @HiveField(3) final String? status,
      @HiveField(4) @JsonKey(name: 'logo_url') final String? logoUrl,
      @HiveField(5) final String? operatorpublicid}) = _$BillersImpl;

  factory _Billers.fromJson(Map<String, dynamic> json) = _$BillersImpl.fromJson;

  @override
  @HiveField(0)
  String? get name;
  @override
  @HiveField(1)
  @JsonKey(name: 'display_name')
  String? get displayName;
  @override
  @HiveField(2)
  String? get category;
  @override
  @HiveField(3)
  String? get status;
  @override
  @HiveField(4)
  @JsonKey(name: 'logo_url')
  String? get logoUrl;
  @override
  @HiveField(5)
  String? get operatorpublicid;
  @override
  @JsonKey(ignore: true)
  _$$BillersImplCopyWith<_$BillersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
