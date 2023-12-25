// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String AmountValueKey = 'amount';

final Map<String, TextEditingController> _BuyVoucherViewTextEditingControllers =
    {};

final Map<String, FocusNode> _BuyVoucherViewFocusNodes = {};

final Map<String, String? Function(String?)?> _BuyVoucherViewTextValidations = {
  AmountValueKey: null,
};

mixin $BuyVoucherView {
  TextEditingController get amountController =>
      _getFormTextEditingController(AmountValueKey);

  FocusNode get amountFocusNode => _getFormFocusNode(AmountValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_BuyVoucherViewTextEditingControllers.containsKey(key)) {
      return _BuyVoucherViewTextEditingControllers[key]!;
    }

    _BuyVoucherViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _BuyVoucherViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_BuyVoucherViewFocusNodes.containsKey(key)) {
      return _BuyVoucherViewFocusNodes[key]!;
    }
    _BuyVoucherViewFocusNodes[key] = FocusNode();
    return _BuyVoucherViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    amountController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    amountController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AmountValueKey: amountController.text,
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

    for (var controller in _BuyVoucherViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _BuyVoucherViewFocusNodes.values) {
      focusNode.dispose();
    }

    _BuyVoucherViewTextEditingControllers.clear();
    _BuyVoucherViewFocusNodes.clear();
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

  String? get amountValue => this.formValueMap[AmountValueKey] as String?;

  set amountValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AmountValueKey: value}),
    );

    if (_BuyVoucherViewTextEditingControllers.containsKey(AmountValueKey)) {
      _BuyVoucherViewTextEditingControllers[AmountValueKey]?.text = value ?? '';
    }
  }

  bool get hasAmount =>
      this.formValueMap.containsKey(AmountValueKey) &&
      (amountValue?.isNotEmpty ?? false);

  bool get hasAmountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey]?.isNotEmpty ?? false;

  String? get amountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey];
}

extension Methods on FormStateHelper {
  setAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmountValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    amountValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AmountValueKey: getValidationMessage(AmountValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _BuyVoucherViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _BuyVoucherViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      AmountValueKey: getValidationMessage(AmountValueKey),
    });
