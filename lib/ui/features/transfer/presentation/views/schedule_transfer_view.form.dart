// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FrequencyValueKey = 'frequency';

final Map<String, TextEditingController>
    _ScheduleTransferMoneyViewTextEditingControllers = {};

final Map<String, FocusNode> _ScheduleTransferMoneyViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ScheduleTransferMoneyViewTextValidations = {
  FrequencyValueKey: null,
};

mixin $ScheduleTransferMoneyView {
  TextEditingController get frequencyController =>
      _getFormTextEditingController(FrequencyValueKey);

  FocusNode get frequencyFocusNode => _getFormFocusNode(FrequencyValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ScheduleTransferMoneyViewTextEditingControllers.containsKey(key)) {
      return _ScheduleTransferMoneyViewTextEditingControllers[key]!;
    }

    _ScheduleTransferMoneyViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ScheduleTransferMoneyViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ScheduleTransferMoneyViewFocusNodes.containsKey(key)) {
      return _ScheduleTransferMoneyViewFocusNodes[key]!;
    }
    _ScheduleTransferMoneyViewFocusNodes[key] = FocusNode();
    return _ScheduleTransferMoneyViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
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
    frequencyController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
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

    for (var controller
        in _ScheduleTransferMoneyViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ScheduleTransferMoneyViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ScheduleTransferMoneyViewTextEditingControllers.clear();
    _ScheduleTransferMoneyViewFocusNodes.clear();
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

  String? get frequencyValue => this.formValueMap[FrequencyValueKey] as String?;

  set frequencyValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FrequencyValueKey: value}),
    );

    if (_ScheduleTransferMoneyViewTextEditingControllers.containsKey(
        FrequencyValueKey)) {
      _ScheduleTransferMoneyViewTextEditingControllers[FrequencyValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasFrequency =>
      this.formValueMap.containsKey(FrequencyValueKey) &&
      (frequencyValue?.isNotEmpty ?? false);

  bool get hasFrequencyValidationMessage =>
      this.fieldsValidationMessages[FrequencyValueKey]?.isNotEmpty ?? false;

  String? get frequencyValidationMessage =>
      this.fieldsValidationMessages[FrequencyValueKey];
}

extension Methods on FormStateHelper {
  setFrequencyValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FrequencyValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    frequencyValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FrequencyValueKey: getValidationMessage(FrequencyValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ScheduleTransferMoneyViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ScheduleTransferMoneyViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FrequencyValueKey: getValidationMessage(FrequencyValueKey),
    });
