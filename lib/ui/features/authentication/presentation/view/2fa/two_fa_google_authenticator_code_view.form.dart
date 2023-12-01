// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String CodeValueKey = 'code';

final Map<String, TextEditingController>
    _TwoFaGoogleAuthenticatorCodeViewTextEditingControllers = {};

final Map<String, FocusNode> _TwoFaGoogleAuthenticatorCodeViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _TwoFaGoogleAuthenticatorCodeViewTextValidations = {
  CodeValueKey: null,
};

mixin $TwoFaGoogleAuthenticatorCodeView {
  TextEditingController get codeController =>
      _getFormTextEditingController(CodeValueKey);

  FocusNode get codeFocusNode => _getFormFocusNode(CodeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_TwoFaGoogleAuthenticatorCodeViewTextEditingControllers.containsKey(
        key)) {
      return _TwoFaGoogleAuthenticatorCodeViewTextEditingControllers[key]!;
    }

    _TwoFaGoogleAuthenticatorCodeViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TwoFaGoogleAuthenticatorCodeViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TwoFaGoogleAuthenticatorCodeViewFocusNodes.containsKey(key)) {
      return _TwoFaGoogleAuthenticatorCodeViewFocusNodes[key]!;
    }
    _TwoFaGoogleAuthenticatorCodeViewFocusNodes[key] = FocusNode();
    return _TwoFaGoogleAuthenticatorCodeViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    codeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    codeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CodeValueKey: codeController.text,
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
        in _TwoFaGoogleAuthenticatorCodeViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TwoFaGoogleAuthenticatorCodeViewFocusNodes.values) {
      focusNode.dispose();
    }

    _TwoFaGoogleAuthenticatorCodeViewTextEditingControllers.clear();
    _TwoFaGoogleAuthenticatorCodeViewFocusNodes.clear();
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

  String? get codeValue => this.formValueMap[CodeValueKey] as String?;

  set codeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CodeValueKey: value}),
    );

    if (_TwoFaGoogleAuthenticatorCodeViewTextEditingControllers.containsKey(
        CodeValueKey)) {
      _TwoFaGoogleAuthenticatorCodeViewTextEditingControllers[CodeValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasCode =>
      this.formValueMap.containsKey(CodeValueKey) &&
      (codeValue?.isNotEmpty ?? false);

  bool get hasCodeValidationMessage =>
      this.fieldsValidationMessages[CodeValueKey]?.isNotEmpty ?? false;

  String? get codeValidationMessage =>
      this.fieldsValidationMessages[CodeValueKey];
}

extension Methods on FormStateHelper {
  setCodeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CodeValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    codeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      CodeValueKey: getValidationMessage(CodeValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _TwoFaGoogleAuthenticatorCodeViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _TwoFaGoogleAuthenticatorCodeViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      CodeValueKey: getValidationMessage(CodeValueKey),
    });
