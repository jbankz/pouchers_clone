// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String ProviderValueKey = 'provider';
const String NumberValueKey = 'number';
const String AmountValueKey = 'amount';
const String SubscriptionTypeValueKey = 'subscriptionType';

final Map<String, TextEditingController> _BettingViewTextEditingControllers =
    {};

final Map<String, FocusNode> _BettingViewFocusNodes = {};

final Map<String, String? Function(String?)?> _BettingViewTextValidations = {
  ProviderValueKey: null,
  NumberValueKey: null,
  AmountValueKey: null,
  SubscriptionTypeValueKey: null,
};

mixin $BettingView {
  TextEditingController get providerController =>
      _getFormTextEditingController(ProviderValueKey);
  TextEditingController get numberController =>
      _getFormTextEditingController(NumberValueKey);
  TextEditingController get amountController =>
      _getFormTextEditingController(AmountValueKey);
  TextEditingController get subscriptionTypeController =>
      _getFormTextEditingController(SubscriptionTypeValueKey);

  FocusNode get providerFocusNode => _getFormFocusNode(ProviderValueKey);
  FocusNode get numberFocusNode => _getFormFocusNode(NumberValueKey);
  FocusNode get amountFocusNode => _getFormFocusNode(AmountValueKey);
  FocusNode get subscriptionTypeFocusNode =>
      _getFormFocusNode(SubscriptionTypeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_BettingViewTextEditingControllers.containsKey(key)) {
      return _BettingViewTextEditingControllers[key]!;
    }

    _BettingViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _BettingViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_BettingViewFocusNodes.containsKey(key)) {
      return _BettingViewFocusNodes[key]!;
    }
    _BettingViewFocusNodes[key] = FocusNode();
    return _BettingViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    providerController.addListener(() => _updateFormData(model));
    numberController.addListener(() => _updateFormData(model));
    amountController.addListener(() => _updateFormData(model));
    subscriptionTypeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    providerController.addListener(() => _updateFormData(model));
    numberController.addListener(() => _updateFormData(model));
    amountController.addListener(() => _updateFormData(model));
    subscriptionTypeController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ProviderValueKey: providerController.text,
          NumberValueKey: numberController.text,
          AmountValueKey: amountController.text,
          SubscriptionTypeValueKey: subscriptionTypeController.text,
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

    for (var controller in _BettingViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _BettingViewFocusNodes.values) {
      focusNode.dispose();
    }

    _BettingViewTextEditingControllers.clear();
    _BettingViewFocusNodes.clear();
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

  String? get providerValue => this.formValueMap[ProviderValueKey] as String?;
  String? get numberValue => this.formValueMap[NumberValueKey] as String?;
  String? get amountValue => this.formValueMap[AmountValueKey] as String?;
  String? get subscriptionTypeValue =>
      this.formValueMap[SubscriptionTypeValueKey] as String?;

  set providerValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ProviderValueKey: value}),
    );

    if (_BettingViewTextEditingControllers.containsKey(ProviderValueKey)) {
      _BettingViewTextEditingControllers[ProviderValueKey]?.text = value ?? '';
    }
  }

  set numberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NumberValueKey: value}),
    );

    if (_BettingViewTextEditingControllers.containsKey(NumberValueKey)) {
      _BettingViewTextEditingControllers[NumberValueKey]?.text = value ?? '';
    }
  }

  set amountValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AmountValueKey: value}),
    );

    if (_BettingViewTextEditingControllers.containsKey(AmountValueKey)) {
      _BettingViewTextEditingControllers[AmountValueKey]?.text = value ?? '';
    }
  }

  set subscriptionTypeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SubscriptionTypeValueKey: value}),
    );

    if (_BettingViewTextEditingControllers.containsKey(
        SubscriptionTypeValueKey)) {
      _BettingViewTextEditingControllers[SubscriptionTypeValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasProvider =>
      this.formValueMap.containsKey(ProviderValueKey) &&
      (providerValue?.isNotEmpty ?? false);
  bool get hasNumber =>
      this.formValueMap.containsKey(NumberValueKey) &&
      (numberValue?.isNotEmpty ?? false);
  bool get hasAmount =>
      this.formValueMap.containsKey(AmountValueKey) &&
      (amountValue?.isNotEmpty ?? false);
  bool get hasSubscriptionType =>
      this.formValueMap.containsKey(SubscriptionTypeValueKey) &&
      (subscriptionTypeValue?.isNotEmpty ?? false);

  bool get hasProviderValidationMessage =>
      this.fieldsValidationMessages[ProviderValueKey]?.isNotEmpty ?? false;
  bool get hasNumberValidationMessage =>
      this.fieldsValidationMessages[NumberValueKey]?.isNotEmpty ?? false;
  bool get hasAmountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey]?.isNotEmpty ?? false;
  bool get hasSubscriptionTypeValidationMessage =>
      this.fieldsValidationMessages[SubscriptionTypeValueKey]?.isNotEmpty ??
      false;

  String? get providerValidationMessage =>
      this.fieldsValidationMessages[ProviderValueKey];
  String? get numberValidationMessage =>
      this.fieldsValidationMessages[NumberValueKey];
  String? get amountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey];
  String? get subscriptionTypeValidationMessage =>
      this.fieldsValidationMessages[SubscriptionTypeValueKey];
}

extension Methods on FormStateHelper {
  setProviderValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ProviderValueKey] = validationMessage;
  setNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NumberValueKey] = validationMessage;
  setAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmountValueKey] = validationMessage;
  setSubscriptionTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SubscriptionTypeValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    providerValue = '';
    numberValue = '';
    amountValue = '';
    subscriptionTypeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ProviderValueKey: getValidationMessage(ProviderValueKey),
      NumberValueKey: getValidationMessage(NumberValueKey),
      AmountValueKey: getValidationMessage(AmountValueKey),
      SubscriptionTypeValueKey: getValidationMessage(SubscriptionTypeValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _BettingViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _BettingViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ProviderValueKey: getValidationMessage(ProviderValueKey),
      NumberValueKey: getValidationMessage(NumberValueKey),
      AmountValueKey: getValidationMessage(AmountValueKey),
      SubscriptionTypeValueKey: getValidationMessage(SubscriptionTypeValueKey),
    });
