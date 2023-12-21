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
const String SubscriptionTypeValueKey = 'subscriptionType';
const String FrequencyValueKey = 'frequency';

final Map<String, TextEditingController>
    _ScheduleCableTvViewTextEditingControllers = {};

final Map<String, FocusNode> _ScheduleCableTvViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ScheduleCableTvViewTextValidations = {
  ProviderValueKey: null,
  NumberValueKey: null,
  SubscriptionTypeValueKey: null,
  FrequencyValueKey: null,
};

mixin $ScheduleCableTvView {
  TextEditingController get providerController =>
      _getFormTextEditingController(ProviderValueKey);
  TextEditingController get numberController =>
      _getFormTextEditingController(NumberValueKey);
  TextEditingController get subscriptionTypeController =>
      _getFormTextEditingController(SubscriptionTypeValueKey);
  TextEditingController get frequencyController =>
      _getFormTextEditingController(FrequencyValueKey);

  FocusNode get providerFocusNode => _getFormFocusNode(ProviderValueKey);
  FocusNode get numberFocusNode => _getFormFocusNode(NumberValueKey);
  FocusNode get subscriptionTypeFocusNode =>
      _getFormFocusNode(SubscriptionTypeValueKey);
  FocusNode get frequencyFocusNode => _getFormFocusNode(FrequencyValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ScheduleCableTvViewTextEditingControllers.containsKey(key)) {
      return _ScheduleCableTvViewTextEditingControllers[key]!;
    }

    _ScheduleCableTvViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ScheduleCableTvViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ScheduleCableTvViewFocusNodes.containsKey(key)) {
      return _ScheduleCableTvViewFocusNodes[key]!;
    }
    _ScheduleCableTvViewFocusNodes[key] = FocusNode();
    return _ScheduleCableTvViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    providerController.addListener(() => _updateFormData(model));
    numberController.addListener(() => _updateFormData(model));
    subscriptionTypeController.addListener(() => _updateFormData(model));
    frequencyController.addListener(() => _updateFormData(model));

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
    subscriptionTypeController.addListener(() => _updateFormData(model));
    frequencyController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ProviderValueKey: providerController.text,
          NumberValueKey: numberController.text,
          SubscriptionTypeValueKey: subscriptionTypeController.text,
          FrequencyValueKey: frequencyController.text,
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

    for (var controller in _ScheduleCableTvViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ScheduleCableTvViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ScheduleCableTvViewTextEditingControllers.clear();
    _ScheduleCableTvViewFocusNodes.clear();
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
  String? get subscriptionTypeValue =>
      this.formValueMap[SubscriptionTypeValueKey] as String?;
  String? get frequencyValue => this.formValueMap[FrequencyValueKey] as String?;

  set providerValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ProviderValueKey: value}),
    );

    if (_ScheduleCableTvViewTextEditingControllers.containsKey(
        ProviderValueKey)) {
      _ScheduleCableTvViewTextEditingControllers[ProviderValueKey]?.text =
          value ?? '';
    }
  }

  set numberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NumberValueKey: value}),
    );

    if (_ScheduleCableTvViewTextEditingControllers.containsKey(
        NumberValueKey)) {
      _ScheduleCableTvViewTextEditingControllers[NumberValueKey]?.text =
          value ?? '';
    }
  }

  set subscriptionTypeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SubscriptionTypeValueKey: value}),
    );

    if (_ScheduleCableTvViewTextEditingControllers.containsKey(
        SubscriptionTypeValueKey)) {
      _ScheduleCableTvViewTextEditingControllers[SubscriptionTypeValueKey]
          ?.text = value ?? '';
    }
  }

  set frequencyValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FrequencyValueKey: value}),
    );

    if (_ScheduleCableTvViewTextEditingControllers.containsKey(
        FrequencyValueKey)) {
      _ScheduleCableTvViewTextEditingControllers[FrequencyValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasProvider =>
      this.formValueMap.containsKey(ProviderValueKey) &&
      (providerValue?.isNotEmpty ?? false);
  bool get hasNumber =>
      this.formValueMap.containsKey(NumberValueKey) &&
      (numberValue?.isNotEmpty ?? false);
  bool get hasSubscriptionType =>
      this.formValueMap.containsKey(SubscriptionTypeValueKey) &&
      (subscriptionTypeValue?.isNotEmpty ?? false);
  bool get hasFrequency =>
      this.formValueMap.containsKey(FrequencyValueKey) &&
      (frequencyValue?.isNotEmpty ?? false);

  bool get hasProviderValidationMessage =>
      this.fieldsValidationMessages[ProviderValueKey]?.isNotEmpty ?? false;
  bool get hasNumberValidationMessage =>
      this.fieldsValidationMessages[NumberValueKey]?.isNotEmpty ?? false;
  bool get hasSubscriptionTypeValidationMessage =>
      this.fieldsValidationMessages[SubscriptionTypeValueKey]?.isNotEmpty ??
      false;
  bool get hasFrequencyValidationMessage =>
      this.fieldsValidationMessages[FrequencyValueKey]?.isNotEmpty ?? false;

  String? get providerValidationMessage =>
      this.fieldsValidationMessages[ProviderValueKey];
  String? get numberValidationMessage =>
      this.fieldsValidationMessages[NumberValueKey];
  String? get subscriptionTypeValidationMessage =>
      this.fieldsValidationMessages[SubscriptionTypeValueKey];
  String? get frequencyValidationMessage =>
      this.fieldsValidationMessages[FrequencyValueKey];
}

extension Methods on FormStateHelper {
  setProviderValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ProviderValueKey] = validationMessage;
  setNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NumberValueKey] = validationMessage;
  setSubscriptionTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SubscriptionTypeValueKey] =
          validationMessage;
  setFrequencyValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FrequencyValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    providerValue = '';
    numberValue = '';
    subscriptionTypeValue = '';
    frequencyValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ProviderValueKey: getValidationMessage(ProviderValueKey),
      NumberValueKey: getValidationMessage(NumberValueKey),
      SubscriptionTypeValueKey: getValidationMessage(SubscriptionTypeValueKey),
      FrequencyValueKey: getValidationMessage(FrequencyValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ScheduleCableTvViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ScheduleCableTvViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ProviderValueKey: getValidationMessage(ProviderValueKey),
      NumberValueKey: getValidationMessage(NumberValueKey),
      SubscriptionTypeValueKey: getValidationMessage(SubscriptionTypeValueKey),
      FrequencyValueKey: getValidationMessage(FrequencyValueKey),
    });
