// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String BvnValueKey = 'bvn';

final Map<String, TextEditingController> _BvnViewTextEditingControllers = {};

final Map<String, FocusNode> _BvnViewFocusNodes = {};

final Map<String, String? Function(String?)?> _BvnViewTextValidations = {
  BvnValueKey: null,
};

mixin $BvnView {
  TextEditingController get bvnController =>
      _getFormTextEditingController(BvnValueKey);

  FocusNode get bvnFocusNode => _getFormFocusNode(BvnValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_BvnViewTextEditingControllers.containsKey(key)) {
      return _BvnViewTextEditingControllers[key]!;
    }

    _BvnViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _BvnViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_BvnViewFocusNodes.containsKey(key)) {
      return _BvnViewFocusNodes[key]!;
    }
    _BvnViewFocusNodes[key] = FocusNode();
    return _BvnViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    bvnController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    bvnController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          BvnValueKey: bvnController.text,
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

    for (var controller in _BvnViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _BvnViewFocusNodes.values) {
      focusNode.dispose();
    }

    _BvnViewTextEditingControllers.clear();
    _BvnViewFocusNodes.clear();
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

  String? get bvnValue => this.formValueMap[BvnValueKey] as String?;

  set bvnValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BvnValueKey: value}),
    );

    if (_BvnViewTextEditingControllers.containsKey(BvnValueKey)) {
      _BvnViewTextEditingControllers[BvnValueKey]?.text = value ?? '';
    }
  }

  bool get hasBvn =>
      this.formValueMap.containsKey(BvnValueKey) &&
      (bvnValue?.isNotEmpty ?? false);

  bool get hasBvnValidationMessage =>
      this.fieldsValidationMessages[BvnValueKey]?.isNotEmpty ?? false;

  String? get bvnValidationMessage =>
      this.fieldsValidationMessages[BvnValueKey];
}

extension Methods on FormStateHelper {
  setBvnValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BvnValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    bvnValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      BvnValueKey: getValidationMessage(BvnValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _BvnViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _BvnViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      BvnValueKey: getValidationMessage(BvnValueKey),
    });
