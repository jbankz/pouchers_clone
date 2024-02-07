// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String AnswerValueKey = 'answer';

final Map<String, TextEditingController>
    _SelectedQuestionViewTextEditingControllers = {};

final Map<String, FocusNode> _SelectedQuestionViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _SelectedQuestionViewTextValidations = {
  AnswerValueKey: null,
};

mixin $SelectedQuestionView {
  TextEditingController get answerController =>
      _getFormTextEditingController(AnswerValueKey);

  FocusNode get answerFocusNode => _getFormFocusNode(AnswerValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SelectedQuestionViewTextEditingControllers.containsKey(key)) {
      return _SelectedQuestionViewTextEditingControllers[key]!;
    }

    _SelectedQuestionViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SelectedQuestionViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SelectedQuestionViewFocusNodes.containsKey(key)) {
      return _SelectedQuestionViewFocusNodes[key]!;
    }
    _SelectedQuestionViewFocusNodes[key] = FocusNode();
    return _SelectedQuestionViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
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
    answerController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
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

    for (var controller in _SelectedQuestionViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SelectedQuestionViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SelectedQuestionViewTextEditingControllers.clear();
    _SelectedQuestionViewFocusNodes.clear();
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

  String? get answerValue => this.formValueMap[AnswerValueKey] as String?;

  set answerValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AnswerValueKey: value}),
    );

    if (_SelectedQuestionViewTextEditingControllers.containsKey(
        AnswerValueKey)) {
      _SelectedQuestionViewTextEditingControllers[AnswerValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasAnswer =>
      this.formValueMap.containsKey(AnswerValueKey) &&
      (answerValue?.isNotEmpty ?? false);

  bool get hasAnswerValidationMessage =>
      this.fieldsValidationMessages[AnswerValueKey]?.isNotEmpty ?? false;

  String? get answerValidationMessage =>
      this.fieldsValidationMessages[AnswerValueKey];
}

extension Methods on FormStateHelper {
  setAnswerValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AnswerValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    answerValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AnswerValueKey: getValidationMessage(AnswerValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SelectedQuestionViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SelectedQuestionViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      AnswerValueKey: getValidationMessage(AnswerValueKey),
    });
