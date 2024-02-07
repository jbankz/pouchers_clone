// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String BankValueKey = 'bank';
const String AccountNumberValueKey = 'accountNumber';

final Map<String, TextEditingController>
    _TransferMoneySheetTextEditingControllers = {};

final Map<String, FocusNode> _TransferMoneySheetFocusNodes = {};

final Map<String, String? Function(String?)?>
    _TransferMoneySheetTextValidations = {
  BankValueKey: null,
  AccountNumberValueKey: null,
};

mixin $TransferMoneySheet {
  TextEditingController get bankController =>
      _getFormTextEditingController(BankValueKey);
  TextEditingController get accountNumberController =>
      _getFormTextEditingController(AccountNumberValueKey);

  FocusNode get bankFocusNode => _getFormFocusNode(BankValueKey);
  FocusNode get accountNumberFocusNode =>
      _getFormFocusNode(AccountNumberValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_TransferMoneySheetTextEditingControllers.containsKey(key)) {
      return _TransferMoneySheetTextEditingControllers[key]!;
    }

    _TransferMoneySheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TransferMoneySheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TransferMoneySheetFocusNodes.containsKey(key)) {
      return _TransferMoneySheetFocusNodes[key]!;
    }
    _TransferMoneySheetFocusNodes[key] = FocusNode();
    return _TransferMoneySheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    bankController.addListener(() => _updateFormData(model));
    accountNumberController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    bankController.addListener(() => _updateFormData(model));
    accountNumberController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          BankValueKey: bankController.text,
          AccountNumberValueKey: accountNumberController.text,
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

    for (var controller in _TransferMoneySheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TransferMoneySheetFocusNodes.values) {
      focusNode.dispose();
    }

    _TransferMoneySheetTextEditingControllers.clear();
    _TransferMoneySheetFocusNodes.clear();
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

  String? get bankValue => this.formValueMap[BankValueKey] as String?;
  String? get accountNumberValue =>
      this.formValueMap[AccountNumberValueKey] as String?;

  set bankValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BankValueKey: value}),
    );

    if (_TransferMoneySheetTextEditingControllers.containsKey(BankValueKey)) {
      _TransferMoneySheetTextEditingControllers[BankValueKey]?.text =
          value ?? '';
    }
  }

  set accountNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AccountNumberValueKey: value}),
    );

    if (_TransferMoneySheetTextEditingControllers.containsKey(
        AccountNumberValueKey)) {
      _TransferMoneySheetTextEditingControllers[AccountNumberValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasBank =>
      this.formValueMap.containsKey(BankValueKey) &&
      (bankValue?.isNotEmpty ?? false);
  bool get hasAccountNumber =>
      this.formValueMap.containsKey(AccountNumberValueKey) &&
      (accountNumberValue?.isNotEmpty ?? false);

  bool get hasBankValidationMessage =>
      this.fieldsValidationMessages[BankValueKey]?.isNotEmpty ?? false;
  bool get hasAccountNumberValidationMessage =>
      this.fieldsValidationMessages[AccountNumberValueKey]?.isNotEmpty ?? false;

  String? get bankValidationMessage =>
      this.fieldsValidationMessages[BankValueKey];
  String? get accountNumberValidationMessage =>
      this.fieldsValidationMessages[AccountNumberValueKey];
}

extension Methods on FormStateHelper {
  setBankValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BankValueKey] = validationMessage;
  setAccountNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccountNumberValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    bankValue = '';
    accountNumberValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      BankValueKey: getValidationMessage(BankValueKey),
      AccountNumberValueKey: getValidationMessage(AccountNumberValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _TransferMoneySheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _TransferMoneySheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      BankValueKey: getValidationMessage(BankValueKey),
      AccountNumberValueKey: getValidationMessage(AccountNumberValueKey),
    });
