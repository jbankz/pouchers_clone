// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String PhoneValueKey = 'phone';
const String AmountValueKey = 'amount';
const String FrequencyValueKey = 'frequency';

final Map<String, TextEditingController>
    _ScheduleDataViewTextEditingControllers = {};

final Map<String, FocusNode> _ScheduleDataViewFocusNodes = {};

final Map<String, String? Function(String?)?> _ScheduleDataViewTextValidations =
    {
  PhoneValueKey: null,
  AmountValueKey: null,
  FrequencyValueKey: null,
};

mixin $ScheduleDataView {
  TextEditingController get phoneController =>
      _getFormTextEditingController(PhoneValueKey);
  TextEditingController get amountController =>
      _getFormTextEditingController(AmountValueKey);
  TextEditingController get frequencyController =>
      _getFormTextEditingController(FrequencyValueKey);

  FocusNode get phoneFocusNode => _getFormFocusNode(PhoneValueKey);
  FocusNode get amountFocusNode => _getFormFocusNode(AmountValueKey);
  FocusNode get frequencyFocusNode => _getFormFocusNode(FrequencyValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ScheduleDataViewTextEditingControllers.containsKey(key)) {
      return _ScheduleDataViewTextEditingControllers[key]!;
    }

    _ScheduleDataViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ScheduleDataViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ScheduleDataViewFocusNodes.containsKey(key)) {
      return _ScheduleDataViewFocusNodes[key]!;
    }
    _ScheduleDataViewFocusNodes[key] = FocusNode();
    return _ScheduleDataViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    phoneController.addListener(() => _updateFormData(model));
    amountController.addListener(() => _updateFormData(model));
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
    phoneController.addListener(() => _updateFormData(model));
    amountController.addListener(() => _updateFormData(model));
    frequencyController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PhoneValueKey: phoneController.text,
          AmountValueKey: amountController.text,
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

    for (var controller in _ScheduleDataViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ScheduleDataViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ScheduleDataViewTextEditingControllers.clear();
    _ScheduleDataViewFocusNodes.clear();
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

  String? get phoneValue => this.formValueMap[PhoneValueKey] as String?;
  String? get amountValue => this.formValueMap[AmountValueKey] as String?;
  String? get frequencyValue => this.formValueMap[FrequencyValueKey] as String?;

  set phoneValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneValueKey: value}),
    );

    if (_ScheduleDataViewTextEditingControllers.containsKey(PhoneValueKey)) {
      _ScheduleDataViewTextEditingControllers[PhoneValueKey]?.text =
          value ?? '';
    }
  }

  set amountValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AmountValueKey: value}),
    );

    if (_ScheduleDataViewTextEditingControllers.containsKey(AmountValueKey)) {
      _ScheduleDataViewTextEditingControllers[AmountValueKey]?.text =
          value ?? '';
    }
  }

  set frequencyValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FrequencyValueKey: value}),
    );

    if (_ScheduleDataViewTextEditingControllers.containsKey(
        FrequencyValueKey)) {
      _ScheduleDataViewTextEditingControllers[FrequencyValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasPhone =>
      this.formValueMap.containsKey(PhoneValueKey) &&
      (phoneValue?.isNotEmpty ?? false);
  bool get hasAmount =>
      this.formValueMap.containsKey(AmountValueKey) &&
      (amountValue?.isNotEmpty ?? false);
  bool get hasFrequency =>
      this.formValueMap.containsKey(FrequencyValueKey) &&
      (frequencyValue?.isNotEmpty ?? false);

  bool get hasPhoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey]?.isNotEmpty ?? false;
  bool get hasAmountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey]?.isNotEmpty ?? false;
  bool get hasFrequencyValidationMessage =>
      this.fieldsValidationMessages[FrequencyValueKey]?.isNotEmpty ?? false;

  String? get phoneValidationMessage =>
      this.fieldsValidationMessages[PhoneValueKey];
  String? get amountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey];
  String? get frequencyValidationMessage =>
      this.fieldsValidationMessages[FrequencyValueKey];
}

extension Methods on FormStateHelper {
  setPhoneValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneValueKey] = validationMessage;
  setAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmountValueKey] = validationMessage;
  setFrequencyValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FrequencyValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    phoneValue = '';
    amountValue = '';
    frequencyValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      AmountValueKey: getValidationMessage(AmountValueKey),
      FrequencyValueKey: getValidationMessage(FrequencyValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ScheduleDataViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ScheduleDataViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      PhoneValueKey: getValidationMessage(PhoneValueKey),
      AmountValueKey: getValidationMessage(AmountValueKey),
      FrequencyValueKey: getValidationMessage(FrequencyValueKey),
    });
