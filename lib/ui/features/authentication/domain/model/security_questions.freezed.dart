// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_questions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SecurityQuestions _$SecurityQuestionsFromJson(Map<String, dynamic> json) {
  return _SecurityQuestions.fromJson(json);
}

/// @nodoc
mixin _$SecurityQuestions {
  String? get id => throw _privateConstructorUsedError;
  String? get question => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SecurityQuestionsCopyWith<SecurityQuestions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityQuestionsCopyWith<$Res> {
  factory $SecurityQuestionsCopyWith(
          SecurityQuestions value, $Res Function(SecurityQuestions) then) =
      _$SecurityQuestionsCopyWithImpl<$Res, SecurityQuestions>;
  @useResult
  $Res call({String? id, String? question});
}

/// @nodoc
class _$SecurityQuestionsCopyWithImpl<$Res, $Val extends SecurityQuestions>
    implements $SecurityQuestionsCopyWith<$Res> {
  _$SecurityQuestionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecurityQuestionsImplCopyWith<$Res>
    implements $SecurityQuestionsCopyWith<$Res> {
  factory _$$SecurityQuestionsImplCopyWith(_$SecurityQuestionsImpl value,
          $Res Function(_$SecurityQuestionsImpl) then) =
      __$$SecurityQuestionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? question});
}

/// @nodoc
class __$$SecurityQuestionsImplCopyWithImpl<$Res>
    extends _$SecurityQuestionsCopyWithImpl<$Res, _$SecurityQuestionsImpl>
    implements _$$SecurityQuestionsImplCopyWith<$Res> {
  __$$SecurityQuestionsImplCopyWithImpl(_$SecurityQuestionsImpl _value,
      $Res Function(_$SecurityQuestionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? question = freezed,
  }) {
    return _then(_$SecurityQuestionsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SecurityQuestionsImpl implements _SecurityQuestions {
  _$SecurityQuestionsImpl({this.id, this.question});

  factory _$SecurityQuestionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SecurityQuestionsImplFromJson(json);

  @override
  final String? id;
  @override
  final String? question;

  @override
  String toString() {
    return 'SecurityQuestions(id: $id, question: $question)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityQuestionsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, question);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityQuestionsImplCopyWith<_$SecurityQuestionsImpl> get copyWith =>
      __$$SecurityQuestionsImplCopyWithImpl<_$SecurityQuestionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SecurityQuestionsImplToJson(
      this,
    );
  }
}

abstract class _SecurityQuestions implements SecurityQuestions {
  factory _SecurityQuestions({final String? id, final String? question}) =
      _$SecurityQuestionsImpl;

  factory _SecurityQuestions.fromJson(Map<String, dynamic> json) =
      _$SecurityQuestionsImpl.fromJson;

  @override
  String? get id;
  @override
  String? get question;
  @override
  @JsonKey(ignore: true)
  _$$SecurityQuestionsImplCopyWith<_$SecurityQuestionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
