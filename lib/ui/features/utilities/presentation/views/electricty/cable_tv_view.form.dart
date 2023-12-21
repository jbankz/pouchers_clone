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

final Map<String, TextEditingController> _CableTvViewTextEditingControllers =
    {};

final Map<String, FocusNode> _CableTvViewFocusNodes = {};

final Map<String, String? Function(String?)?> _CableTvViewTextValidations = {
  ProviderValueKey: null,
  NumberValueKey: null,
  SubscriptionTypeValueKey: null,
};

mixin $CableTvView {
  TextEditingController get providerController =>
      _getFormTextEditingController(ProviderValueKey);
  TextEditingController get numberController =>
      _getFormTextEditingController(NumberValueKey);
  TextEditingController get subscriptionTypeController =>
      _getFormTextEditingController(SubscriptionTypeValueKey);

  FocusNode get providerFocusNode => _getFormFocusNode(ProviderValueKey);
  FocusNode get numberFocusNode => _getFormFocusNode(NumberValueKey);
  FocusNode get subscriptionTypeFocusNode =>
      _getFormFocusNode(SubscriptionTypeValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_CableTvViewTextEditingControllers.containsKey(key)) {
      return _CableTvViewTextEditingControllers[key]!;
    }

    _CableTvViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CableTvViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CableTvViewFocusNodes.containsKey(key)) {
      return _CableTvViewFocusNodes[key]!;
    }
    _CableTvViewFocusNodes[key] = FocusNode();
    return _CableTvViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    providerController.addListener(() => _updateFormData(model));
    numberController.addListener(() => _updateFormData(model));
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

    for (var controller in _CableTvViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CableTvViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CableTvViewTextEditingControllers.clear();
    _CableTvViewFocusNodes.clear();
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

  set providerValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ProviderValueKey: value}),
    );

    if (_CableTvViewTextEditingControllers.containsKey(ProviderValueKey)) {
      _CableTvViewTextEditingControllers[ProviderValueKey]?.text = value ?? '';
    }
  }

  set numberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NumberValueKey: value}),
    );

    if (_CableTvViewTextEditingControllers.containsKey(NumberValueKey)) {
      _CableTvViewTextEditingControllers[NumberValueKey]?.text = value ?? '';
    }
  }

  set subscriptionTypeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({SubscriptionTypeValueKey: value}),
    );

    if (_CableTvViewTextEditingControllers.containsKey(
        SubscriptionTypeValueKey)) {
      _CableTvViewTextEditingControllers[SubscriptionTypeValueKey]?.text =
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

  bool get hasProviderValidationMessage =>
      this.fieldsValidationMessages[ProviderValueKey]?.isNotEmpty ?? false;
  bool get hasNumberValidationMessage =>
      this.fieldsValidationMessages[NumberValueKey]?.isNotEmpty ?? false;
  bool get hasSubscriptionTypeValidationMessage =>
      this.fieldsValidationMessages[SubscriptionTypeValueKey]?.isNotEmpty ??
      false;

  String? get providerValidationMessage =>
      this.fieldsValidationMessages[ProviderValueKey];
  String? get numberValidationMessage =>
      this.fieldsValidationMessages[NumberValueKey];
  String? get subscriptionTypeValidationMessage =>
      this.fieldsValidationMessages[SubscriptionTypeValueKey];
}

extension Methods on FormStateHelper {
  setProviderValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ProviderValueKey] = validationMessage;
  setNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NumberValueKey] = validationMessage;
  setSubscriptionTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SubscriptionTypeValueKey] =
          validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    providerValue = '';
    numberValue = '';
    subscriptionTypeValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ProviderValueKey: getValidationMessage(ProviderValueKey),
      NumberValueKey: getValidationMessage(NumberValueKey),
      SubscriptionTypeValueKey: getValidationMessage(SubscriptionTypeValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _CableTvViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _CableTvViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ProviderValueKey: getValidationMessage(ProviderValueKey),
      NumberValueKey: getValidationMessage(NumberValueKey),
      SubscriptionTypeValueKey: getValidationMessage(SubscriptionTypeValueKey),
    });
