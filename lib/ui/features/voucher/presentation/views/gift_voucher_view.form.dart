// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String CodeValueKey = 'code';
const String BeneficiaryValueKey = 'beneficiary';

final Map<String, TextEditingController>
    _GiftVoucherViewTextEditingControllers = {};

final Map<String, FocusNode> _GiftVoucherViewFocusNodes = {};

final Map<String, String? Function(String?)?> _GiftVoucherViewTextValidations =
    {
  CodeValueKey: null,
  BeneficiaryValueKey: null,
};

mixin $GiftVoucherView {
  TextEditingController get codeController =>
      _getFormTextEditingController(CodeValueKey);
  TextEditingController get beneficiaryController =>
      _getFormTextEditingController(BeneficiaryValueKey);

  FocusNode get codeFocusNode => _getFormFocusNode(CodeValueKey);
  FocusNode get beneficiaryFocusNode => _getFormFocusNode(BeneficiaryValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_GiftVoucherViewTextEditingControllers.containsKey(key)) {
      return _GiftVoucherViewTextEditingControllers[key]!;
    }

    _GiftVoucherViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _GiftVoucherViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_GiftVoucherViewFocusNodes.containsKey(key)) {
      return _GiftVoucherViewFocusNodes[key]!;
    }
    _GiftVoucherViewFocusNodes[key] = FocusNode();
    return _GiftVoucherViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    codeController.addListener(() => _updateFormData(model));
    beneficiaryController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    codeController.addListener(() => _updateFormData(model));
    beneficiaryController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CodeValueKey: codeController.text,
          BeneficiaryValueKey: beneficiaryController.text,
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

    for (var controller in _GiftVoucherViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _GiftVoucherViewFocusNodes.values) {
      focusNode.dispose();
    }

    _GiftVoucherViewTextEditingControllers.clear();
    _GiftVoucherViewFocusNodes.clear();
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

  String? get codeValue => this.formValueMap[CodeValueKey] as String?;
  String? get beneficiaryValue =>
      this.formValueMap[BeneficiaryValueKey] as String?;

  set codeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CodeValueKey: value}),
    );

    if (_GiftVoucherViewTextEditingControllers.containsKey(CodeValueKey)) {
      _GiftVoucherViewTextEditingControllers[CodeValueKey]?.text = value ?? '';
    }
  }

  set beneficiaryValue(String? value) {
    this.setData(
      this.formValueMap..addAll({BeneficiaryValueKey: value}),
    );

    if (_GiftVoucherViewTextEditingControllers.containsKey(
        BeneficiaryValueKey)) {
      _GiftVoucherViewTextEditingControllers[BeneficiaryValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasCode =>
      this.formValueMap.containsKey(CodeValueKey) &&
      (codeValue?.isNotEmpty ?? false);
  bool get hasBeneficiary =>
      this.formValueMap.containsKey(BeneficiaryValueKey) &&
      (beneficiaryValue?.isNotEmpty ?? false);

  bool get hasCodeValidationMessage =>
      this.fieldsValidationMessages[CodeValueKey]?.isNotEmpty ?? false;
  bool get hasBeneficiaryValidationMessage =>
      this.fieldsValidationMessages[BeneficiaryValueKey]?.isNotEmpty ?? false;

  String? get codeValidationMessage =>
      this.fieldsValidationMessages[CodeValueKey];
  String? get beneficiaryValidationMessage =>
      this.fieldsValidationMessages[BeneficiaryValueKey];
}

extension Methods on FormStateHelper {
  setCodeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CodeValueKey] = validationMessage;
  setBeneficiaryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[BeneficiaryValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    codeValue = '';
    beneficiaryValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      CodeValueKey: getValidationMessage(CodeValueKey),
      BeneficiaryValueKey: getValidationMessage(BeneficiaryValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _GiftVoucherViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _GiftVoucherViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      CodeValueKey: getValidationMessage(CodeValueKey),
      BeneficiaryValueKey: getValidationMessage(BeneficiaryValueKey),
    });
