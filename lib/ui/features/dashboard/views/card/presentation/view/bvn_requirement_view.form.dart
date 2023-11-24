// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String CountryValueKey = 'country';
const String BvnValueKey = 'bvn';

final Map<String, TextEditingController> _RequestBVNViewTextEditingControllers =
    {};

final Map<String, FocusNode> _RequestBVNViewFocusNodes = {};

final Map<String, String? Function(String?)?> _RequestBVNViewTextValidations = {
  CountryValueKey: null,
  BvnValueKey: null,
};

mixin $RequestBVNView {
  TextEditingController get countryController =>
      _getFormTextEditingController(CountryValueKey);
  TextEditingController get bvnController =>
      _getFormTextEditingController(BvnValueKey);

  FocusNode get countryFocusNode => _getFormFocusNode(CountryValueKey);
  FocusNode get bvnFocusNode => _getFormFocusNode(BvnValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_RequestBVNViewTextEditingControllers.containsKey(key)) {
      return _RequestBVNViewTextEditingControllers[key]!;
    }

    _RequestBVNViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _RequestBVNViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_RequestBVNViewFocusNodes.containsKey(key)) {
      return _RequestBVNViewFocusNodes[key]!;
    }
    _RequestBVNViewFocusNodes[key] = FocusNode();
    return _RequestBVNViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    countryController.addListener(() => _updateFormData(model));
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
    countryController.addListener(() => _updateFormData(model));
    bvnController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CountryValueKey: countryController.text,
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

    for (var controller in _RequestBVNViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _RequestBVNViewFocusNodes.values) {
      focusNode.dispose();
    }

    _RequestBVNViewTextEditingControllers.clear();
    _RequestBVNViewFocusNodes.clear();
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

  String? get countryValue => this.formValueMap[CountryValueKey] as String?;
  String? get bvnValue => this.formValueMap[BvnValueKey] as String?;

  set countryValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CountryValueKey: value}),
    );

    if (_RequestBVNViewTextEditingControllers.containsKey(CountryValueKey)) {
      _RequestBVNViewTextEditingControllers[CountryValueKey]?.text =
          value ?? '';
    }
  }

  set bvnValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BvnValueKey: value}),
    );

    if (_RequestBVNViewTextEditingControllers.containsKey(BvnValueKey)) {
      _RequestBVNViewTextEditingControllers[BvnValueKey]?.text = value ?? '';
    }
  }

  bool get hasCountry =>
      this.formValueMap.containsKey(CountryValueKey) &&
      (countryValue?.isNotEmpty ?? false);
  bool get hasBvn =>
      this.formValueMap.containsKey(BvnValueKey) &&
      (bvnValue?.isNotEmpty ?? false);

  bool get hasCountryValidationMessage =>
      this.fieldsValidationMessages[CountryValueKey]?.isNotEmpty ?? false;
  bool get hasBvnValidationMessage =>
      this.fieldsValidationMessages[BvnValueKey]?.isNotEmpty ?? false;

  String? get countryValidationMessage =>
      this.fieldsValidationMessages[CountryValueKey];
  String? get bvnValidationMessage =>
      this.fieldsValidationMessages[BvnValueKey];
}

extension Methods on FormStateHelper {
  setCountryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CountryValueKey] = validationMessage;
  setBvnValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BvnValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    countryValue = '';
    bvnValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      CountryValueKey: getValidationMessage(CountryValueKey),
      BvnValueKey: getValidationMessage(BvnValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _RequestBVNViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _RequestBVNViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      CountryValueKey: getValidationMessage(CountryValueKey),
      BvnValueKey: getValidationMessage(BvnValueKey),
    });
