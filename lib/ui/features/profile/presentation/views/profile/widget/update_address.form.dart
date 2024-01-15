// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String AddressValueKey = 'address';

final Map<String, TextEditingController>
    _UpdateAddressWidgetTextEditingControllers = {};

final Map<String, FocusNode> _UpdateAddressWidgetFocusNodes = {};

final Map<String, String? Function(String?)?>
    _UpdateAddressWidgetTextValidations = {
  AddressValueKey: null,
};

mixin $UpdateAddressWidget {
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);

  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_UpdateAddressWidgetTextEditingControllers.containsKey(key)) {
      return _UpdateAddressWidgetTextEditingControllers[key]!;
    }

    _UpdateAddressWidgetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _UpdateAddressWidgetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_UpdateAddressWidgetFocusNodes.containsKey(key)) {
      return _UpdateAddressWidgetFocusNodes[key]!;
    }
    _UpdateAddressWidgetFocusNodes[key] = FocusNode();
    return _UpdateAddressWidgetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    addressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    addressController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AddressValueKey: addressController.text,
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

    for (var controller in _UpdateAddressWidgetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _UpdateAddressWidgetFocusNodes.values) {
      focusNode.dispose();
    }

    _UpdateAddressWidgetTextEditingControllers.clear();
    _UpdateAddressWidgetFocusNodes.clear();
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

  String? get addressValue => this.formValueMap[AddressValueKey] as String?;

  set addressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AddressValueKey: value}),
    );

    if (_UpdateAddressWidgetTextEditingControllers.containsKey(
        AddressValueKey)) {
      _UpdateAddressWidgetTextEditingControllers[AddressValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);

  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;

  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
}

extension Methods on FormStateHelper {
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    addressValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _UpdateAddressWidgetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _UpdateAddressWidgetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      AddressValueKey: getValidationMessage(AddressValueKey),
    });
