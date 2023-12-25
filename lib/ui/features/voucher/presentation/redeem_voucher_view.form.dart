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
    _RedeemVoucherViewTextEditingControllers = {};

final Map<String, FocusNode> _RedeemVoucherViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _RedeemVoucherViewTextValidations = {
  CodeValueKey: null,
};

mixin $RedeemVoucherView {
  TextEditingController get codeController =>
      _getFormTextEditingController(CodeValueKey);

  FocusNode get codeFocusNode => _getFormFocusNode(CodeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_RedeemVoucherViewTextEditingControllers.containsKey(key)) {
      return _RedeemVoucherViewTextEditingControllers[key]!;
    }

    _RedeemVoucherViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _RedeemVoucherViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_RedeemVoucherViewFocusNodes.containsKey(key)) {
      return _RedeemVoucherViewFocusNodes[key]!;
    }
    _RedeemVoucherViewFocusNodes[key] = FocusNode();
    return _RedeemVoucherViewFocusNodes[key]!;
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

    for (var controller in _RedeemVoucherViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _RedeemVoucherViewFocusNodes.values) {
      focusNode.dispose();
    }

    _RedeemVoucherViewTextEditingControllers.clear();
    _RedeemVoucherViewFocusNodes.clear();
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

    if (_RedeemVoucherViewTextEditingControllers.containsKey(CodeValueKey)) {
      _RedeemVoucherViewTextEditingControllers[CodeValueKey]?.text =
          value ?? '';
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
  final validatorForKey = _RedeemVoucherViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _RedeemVoucherViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      CodeValueKey: getValidationMessage(CodeValueKey),
    });
