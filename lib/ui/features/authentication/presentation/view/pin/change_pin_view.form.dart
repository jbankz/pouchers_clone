// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String OldPinValueKey = 'oldPin';
const String NewPinValueKey = 'newPin';
const String ConfirmNewPinValueKey = 'confirmNewPin';

final Map<String, TextEditingController> _ChangePinViewTextEditingControllers =
    {};

final Map<String, FocusNode> _ChangePinViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ChangePinViewTextValidations = {
  OldPinValueKey: null,
  NewPinValueKey: null,
  ConfirmNewPinValueKey: null,
};

mixin $ChangePinView {
  TextEditingController get oldPinController =>
      _getFormTextEditingController(OldPinValueKey);
  TextEditingController get newPinController =>
      _getFormTextEditingController(NewPinValueKey);
  TextEditingController get confirmNewPinController =>
      _getFormTextEditingController(ConfirmNewPinValueKey);

  FocusNode get oldPinFocusNode => _getFormFocusNode(OldPinValueKey);
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
    oldPinController.addListener(() => _updateFormData(model));
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
    oldPinController.addListener(() => _updateFormData(model));
    newPinController.addListener(() => _updateFormData(model));
    confirmNewPinController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          OldPinValueKey: oldPinController.text,
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

  String? get oldPinValue => this.formValueMap[OldPinValueKey] as String?;
  String? get newPinValue => this.formValueMap[NewPinValueKey] as String?;
  String? get confirmNewPinValue =>
      this.formValueMap[ConfirmNewPinValueKey] as String?;

  set oldPinValue(String? value) {
    this.setData(
      this.formValueMap..addAll({OldPinValueKey: value}),
    );

    if (_ChangePinViewTextEditingControllers.containsKey(OldPinValueKey)) {
      _ChangePinViewTextEditingControllers[OldPinValueKey]?.text = value ?? '';
    }
  }

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

  bool get hasOldPin =>
      this.formValueMap.containsKey(OldPinValueKey) &&
      (oldPinValue?.isNotEmpty ?? false);
  bool get hasNewPin =>
      this.formValueMap.containsKey(NewPinValueKey) &&
      (newPinValue?.isNotEmpty ?? false);
  bool get hasConfirmNewPin =>
      this.formValueMap.containsKey(ConfirmNewPinValueKey) &&
      (confirmNewPinValue?.isNotEmpty ?? false);

  bool get hasOldPinValidationMessage =>
      this.fieldsValidationMessages[OldPinValueKey]?.isNotEmpty ?? false;
  bool get hasNewPinValidationMessage =>
      this.fieldsValidationMessages[NewPinValueKey]?.isNotEmpty ?? false;
  bool get hasConfirmNewPinValidationMessage =>
      this.fieldsValidationMessages[ConfirmNewPinValueKey]?.isNotEmpty ?? false;

  String? get oldPinValidationMessage =>
      this.fieldsValidationMessages[OldPinValueKey];
  String? get newPinValidationMessage =>
      this.fieldsValidationMessages[NewPinValueKey];
  String? get confirmNewPinValidationMessage =>
      this.fieldsValidationMessages[ConfirmNewPinValueKey];
}

extension Methods on FormStateHelper {
  setOldPinValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OldPinValueKey] = validationMessage;
  setNewPinValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NewPinValueKey] = validationMessage;
  setConfirmNewPinValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ConfirmNewPinValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    oldPinValue = '';
    newPinValue = '';
    confirmNewPinValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      OldPinValueKey: getValidationMessage(OldPinValueKey),
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
      OldPinValueKey: getValidationMessage(OldPinValueKey),
      NewPinValueKey: getValidationMessage(NewPinValueKey),
      ConfirmNewPinValueKey: getValidationMessage(ConfirmNewPinValueKey),
    });
