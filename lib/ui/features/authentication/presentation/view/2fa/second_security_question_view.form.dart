// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String QuestionValueKey = 'question';
const String AnswerValueKey = 'answer';

final Map<String, TextEditingController>
    _SecondSecurityQuestionViewTextEditingControllers = {};

final Map<String, FocusNode> _SecondSecurityQuestionViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _SecondSecurityQuestionViewTextValidations = {
  QuestionValueKey: null,
  AnswerValueKey: null,
};

mixin $SecondSecurityQuestionView {
  TextEditingController get questionController =>
      _getFormTextEditingController(QuestionValueKey);
  TextEditingController get answerController =>
      _getFormTextEditingController(AnswerValueKey);

  FocusNode get questionFocusNode => _getFormFocusNode(QuestionValueKey);
  FocusNode get answerFocusNode => _getFormFocusNode(AnswerValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SecondSecurityQuestionViewTextEditingControllers.containsKey(key)) {
      return _SecondSecurityQuestionViewTextEditingControllers[key]!;
    }

    _SecondSecurityQuestionViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SecondSecurityQuestionViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SecondSecurityQuestionViewFocusNodes.containsKey(key)) {
      return _SecondSecurityQuestionViewFocusNodes[key]!;
    }
    _SecondSecurityQuestionViewFocusNodes[key] = FocusNode();
    return _SecondSecurityQuestionViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    questionController.addListener(() => _updateFormData(model));
    answerController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    questionController.addListener(() => _updateFormData(model));
    answerController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          QuestionValueKey: questionController.text,
          AnswerValueKey: answerController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _SecondSecurityQuestionViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SecondSecurityQuestionViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SecondSecurityQuestionViewTextEditingControllers.clear();
    _SecondSecurityQuestionViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get questionValue => this.formValueMap[QuestionValueKey] as String?;
  String? get answerValue => this.formValueMap[AnswerValueKey] as String?;

  set questionValue(String? value) {
    this.setData(
      this.formValueMap..addAll({QuestionValueKey: value}),
    );

    if (_SecondSecurityQuestionViewTextEditingControllers.containsKey(
        QuestionValueKey)) {
      _SecondSecurityQuestionViewTextEditingControllers[QuestionValueKey]
          ?.text = value ?? '';
    }
  }

  set answerValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AnswerValueKey: value}),
    );

    if (_SecondSecurityQuestionViewTextEditingControllers.containsKey(
        AnswerValueKey)) {
      _SecondSecurityQuestionViewTextEditingControllers[AnswerValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasQuestion =>
      this.formValueMap.containsKey(QuestionValueKey) &&
      (questionValue?.isNotEmpty ?? false);
  bool get hasAnswer =>
      this.formValueMap.containsKey(AnswerValueKey) &&
      (answerValue?.isNotEmpty ?? false);

  bool get hasQuestionValidationMessage =>
      this.fieldsValidationMessages[QuestionValueKey]?.isNotEmpty ?? false;
  bool get hasAnswerValidationMessage =>
      this.fieldsValidationMessages[AnswerValueKey]?.isNotEmpty ?? false;

  String? get questionValidationMessage =>
      this.fieldsValidationMessages[QuestionValueKey];
  String? get answerValidationMessage =>
      this.fieldsValidationMessages[AnswerValueKey];
}

extension Methods on FormStateHelper {
  setQuestionValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[QuestionValueKey] = validationMessage;
  setAnswerValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AnswerValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    questionValue = '';
    answerValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      QuestionValueKey: getValidationMessage(QuestionValueKey),
      AnswerValueKey: getValidationMessage(AnswerValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SecondSecurityQuestionViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SecondSecurityQuestionViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      QuestionValueKey: getValidationMessage(QuestionValueKey),
      AnswerValueKey: getValidationMessage(AnswerValueKey),
    });
