// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String AccountValueKey = 'account';

final Map<String, TextEditingController> _UssdViewTextEditingControllers = {};

final Map<String, FocusNode> _UssdViewFocusNodes = {};

final Map<String, String? Function(String?)?> _UssdViewTextValidations = {
  AccountValueKey: null,
};

mixin $UssdView {
  TextEditingController get accountController =>
      _getFormTextEditingController(AccountValueKey);

  FocusNode get accountFocusNode => _getFormFocusNode(AccountValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_UssdViewTextEditingControllers.containsKey(key)) {
      return _UssdViewTextEditingControllers[key]!;
    }

    _UssdViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _UssdViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_UssdViewFocusNodes.containsKey(key)) {
      return _UssdViewFocusNodes[key]!;
    }
    _UssdViewFocusNodes[key] = FocusNode();
    return _UssdViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    accountController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    accountController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AccountValueKey: accountController.text,
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

    for (var controller in _UssdViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _UssdViewFocusNodes.values) {
      focusNode.dispose();
    }

    _UssdViewTextEditingControllers.clear();
    _UssdViewFocusNodes.clear();
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

  String? get accountValue => this.formValueMap[AccountValueKey] as String?;

  set accountValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AccountValueKey: value}),
    );

    if (_UssdViewTextEditingControllers.containsKey(AccountValueKey)) {
      _UssdViewTextEditingControllers[AccountValueKey]?.text = value ?? '';
    }
  }

  bool get hasAccount =>
      this.formValueMap.containsKey(AccountValueKey) &&
      (accountValue?.isNotEmpty ?? false);

  bool get hasAccountValidationMessage =>
      this.fieldsValidationMessages[AccountValueKey]?.isNotEmpty ?? false;

  String? get accountValidationMessage =>
      this.fieldsValidationMessages[AccountValueKey];
}

extension Methods on FormStateHelper {
  setAccountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccountValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    accountValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AccountValueKey: getValidationMessage(AccountValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _UssdViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _UssdViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      AccountValueKey: getValidationMessage(AccountValueKey),
    });
