// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String ReasonValueKey = 'reason';
const String OthersValueKey = 'others';

final Map<String, TextEditingController> _DeleteViewTextEditingControllers = {};

final Map<String, FocusNode> _DeleteViewFocusNodes = {};

final Map<String, String? Function(String?)?> _DeleteViewTextValidations = {
  ReasonValueKey: null,
  OthersValueKey: null,
};

mixin $DeleteView {
  TextEditingController get reasonController =>
      _getFormTextEditingController(ReasonValueKey);
  TextEditingController get othersController =>
      _getFormTextEditingController(OthersValueKey);

  FocusNode get reasonFocusNode => _getFormFocusNode(ReasonValueKey);
  FocusNode get othersFocusNode => _getFormFocusNode(OthersValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_DeleteViewTextEditingControllers.containsKey(key)) {
      return _DeleteViewTextEditingControllers[key]!;
    }

    _DeleteViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _DeleteViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_DeleteViewFocusNodes.containsKey(key)) {
      return _DeleteViewFocusNodes[key]!;
    }
    _DeleteViewFocusNodes[key] = FocusNode();
    return _DeleteViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    reasonController.addListener(() => _updateFormData(model));
    othersController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    reasonController.addListener(() => _updateFormData(model));
    othersController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ReasonValueKey: reasonController.text,
          OthersValueKey: othersController.text,
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

    for (var controller in _DeleteViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _DeleteViewFocusNodes.values) {
      focusNode.dispose();
    }

    _DeleteViewTextEditingControllers.clear();
    _DeleteViewFocusNodes.clear();
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

  String? get reasonValue => this.formValueMap[ReasonValueKey] as String?;
  String? get othersValue => this.formValueMap[OthersValueKey] as String?;

  set reasonValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ReasonValueKey: value}),
    );

    if (_DeleteViewTextEditingControllers.containsKey(ReasonValueKey)) {
      _DeleteViewTextEditingControllers[ReasonValueKey]?.text = value ?? '';
    }
  }

  set othersValue(String? value) {
    this.setData(
      this.formValueMap..addAll({OthersValueKey: value}),
    );

    if (_DeleteViewTextEditingControllers.containsKey(OthersValueKey)) {
      _DeleteViewTextEditingControllers[OthersValueKey]?.text = value ?? '';
    }
  }

  bool get hasReason =>
      this.formValueMap.containsKey(ReasonValueKey) &&
      (reasonValue?.isNotEmpty ?? false);
  bool get hasOthers =>
      this.formValueMap.containsKey(OthersValueKey) &&
      (othersValue?.isNotEmpty ?? false);

  bool get hasReasonValidationMessage =>
      this.fieldsValidationMessages[ReasonValueKey]?.isNotEmpty ?? false;
  bool get hasOthersValidationMessage =>
      this.fieldsValidationMessages[OthersValueKey]?.isNotEmpty ?? false;

  String? get reasonValidationMessage =>
      this.fieldsValidationMessages[ReasonValueKey];
  String? get othersValidationMessage =>
      this.fieldsValidationMessages[OthersValueKey];
}

extension Methods on FormStateHelper {
  setReasonValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ReasonValueKey] = validationMessage;
  setOthersValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[OthersValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    reasonValue = '';
    othersValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ReasonValueKey: getValidationMessage(ReasonValueKey),
      OthersValueKey: getValidationMessage(OthersValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _DeleteViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _DeleteViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ReasonValueKey: getValidationMessage(ReasonValueKey),
      OthersValueKey: getValidationMessage(OthersValueKey),
    });
