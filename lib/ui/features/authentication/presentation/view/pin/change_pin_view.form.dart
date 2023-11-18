// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NewPinValueKey = 'newPin';
const String ConfirmNewPinValueKey = 'confirmNewPin';

final Map<String, TextEditingController> _ChangePinViewTextEditingControllers =
    {};

final Map<String, FocusNode> _ChangePinViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ChangePinViewTextValidations = {
  NewPinValueKey: null,
  ConfirmNewPinValueKey: null,
};

mixin $ChangePinView {
  TextEditingController get newPinController =>
      _getFormTextEditingController(NewPinValueKey);
  TextEditingController get confirmNewPinController =>
      _getFormTextEditingController(ConfirmNewPinValueKey);

  FocusNode get newPinFocusNode => _getFormFocusNode(NewPinValueKey);
  FocusNode get confirmNewPinFocusNode =>
      _getFormFocusNode(ConfirmNewPinValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ChangePinViewTextEditingControllers.containsKey(key)) {
      return _ChangePinViewTextEditingControllers[key]!;
    }

    _ChangePinViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ChangePinViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ChangePinViewFocusNodes.containsKey(key)) {
      return _ChangePinViewFocusNodes[key]!;
    }
    _ChangePinViewFocusNodes[key] = FocusNode();
    return _ChangePinViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    newPinController.addListener(() => _updateFormData(model));
    confirmNewPinController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    newPinController.addListener(() => _updateFormData(model));
    confirmNewPinController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NewPinValueKey: newPinController.text,
          ConfirmNewPinValueKey: confirmNewPinController.text,
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

    for (var controller in _ChangePinViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ChangePinViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ChangePinViewTextEditingControllers.clear();
    _ChangePinViewFocusNodes.clear();
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

  String? get newPinValue => this.formValueMap[NewPinValueKey] as String?;
  String? get confirmNewPinValue =>
      this.formValueMap[ConfirmNewPinValueKey] as String?;

  set newPinValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NewPinValueKey: value}),
    );

    if (_ChangePinViewTextEditingControllers.containsKey(NewPinValueKey)) {
      _ChangePinViewTextEditingControllers[NewPinValueKey]?.text = value ?? '';
    }
  }

  set confirmNewPinValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ConfirmNewPinValueKey: value}),
    );

    if (_ChangePinViewTextEditingControllers.containsKey(
        ConfirmNewPinValueKey)) {
      _ChangePinViewTextEditingControllers[ConfirmNewPinValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasNewPin =>
      this.formValueMap.containsKey(NewPinValueKey) &&
      (newPinValue?.isNotEmpty ?? false);
  bool get hasConfirmNewPin =>
      this.formValueMap.containsKey(ConfirmNewPinValueKey) &&
      (confirmNewPinValue?.isNotEmpty ?? false);

  bool get hasNewPinValidationMessage =>
      this.fieldsValidationMessages[NewPinValueKey]?.isNotEmpty ?? false;
  bool get hasConfirmNewPinValidationMessage =>
      this.fieldsValidationMessages[ConfirmNewPinValueKey]?.isNotEmpty ?? false;

  String? get newPinValidationMessage =>
      this.fieldsValidationMessages[NewPinValueKey];
  String? get confirmNewPinValidationMessage =>
      this.fieldsValidationMessages[ConfirmNewPinValueKey];
}

extension Methods on FormStateHelper {
  setNewPinValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NewPinValueKey] = validationMessage;
  setConfirmNewPinValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ConfirmNewPinValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    newPinValue = '';
    confirmNewPinValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NewPinValueKey: getValidationMessage(NewPinValueKey),
      ConfirmNewPinValueKey: getValidationMessage(ConfirmNewPinValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ChangePinViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ChangePinViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NewPinValueKey: getValidationMessage(NewPinValueKey),
      ConfirmNewPinValueKey: getValidationMessage(ConfirmNewPinValueKey),
    });
