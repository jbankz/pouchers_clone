// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String CardNumberValueKey = 'cardNumber';
const String ExpiryValueKey = 'expiry';
const String CvvValueKey = 'cvv';

final Map<String, TextEditingController> _DebitCardViewTextEditingControllers =
    {};

final Map<String, FocusNode> _DebitCardViewFocusNodes = {};

final Map<String, String? Function(String?)?> _DebitCardViewTextValidations = {
  CardNumberValueKey: null,
  ExpiryValueKey: null,
  CvvValueKey: null,
};

mixin $DebitCardView {
  TextEditingController get cardNumberController =>
      _getFormTextEditingController(CardNumberValueKey);
  TextEditingController get expiryController =>
      _getFormTextEditingController(ExpiryValueKey);
  TextEditingController get cvvController =>
      _getFormTextEditingController(CvvValueKey);

  FocusNode get cardNumberFocusNode => _getFormFocusNode(CardNumberValueKey);
  FocusNode get expiryFocusNode => _getFormFocusNode(ExpiryValueKey);
  FocusNode get cvvFocusNode => _getFormFocusNode(CvvValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_DebitCardViewTextEditingControllers.containsKey(key)) {
      return _DebitCardViewTextEditingControllers[key]!;
    }

    _DebitCardViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _DebitCardViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_DebitCardViewFocusNodes.containsKey(key)) {
      return _DebitCardViewFocusNodes[key]!;
    }
    _DebitCardViewFocusNodes[key] = FocusNode();
    return _DebitCardViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    cardNumberController.addListener(() => _updateFormData(model));
    expiryController.addListener(() => _updateFormData(model));
    cvvController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    cardNumberController.addListener(() => _updateFormData(model));
    expiryController.addListener(() => _updateFormData(model));
    cvvController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          CardNumberValueKey: cardNumberController.text,
          ExpiryValueKey: expiryController.text,
          CvvValueKey: cvvController.text,
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

    for (var controller in _DebitCardViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _DebitCardViewFocusNodes.values) {
      focusNode.dispose();
    }

    _DebitCardViewTextEditingControllers.clear();
    _DebitCardViewFocusNodes.clear();
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

  String? get cardNumberValue =>
      this.formValueMap[CardNumberValueKey] as String?;
  String? get expiryValue => this.formValueMap[ExpiryValueKey] as String?;
  String? get cvvValue => this.formValueMap[CvvValueKey] as String?;

  set cardNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CardNumberValueKey: value}),
    );

    if (_DebitCardViewTextEditingControllers.containsKey(CardNumberValueKey)) {
      _DebitCardViewTextEditingControllers[CardNumberValueKey]?.text =
          value ?? '';
    }
  }

  set expiryValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ExpiryValueKey: value}),
    );

    if (_DebitCardViewTextEditingControllers.containsKey(ExpiryValueKey)) {
      _DebitCardViewTextEditingControllers[ExpiryValueKey]?.text = value ?? '';
    }
  }

  set cvvValue(String? value) {
    this.setData(
      this.formValueMap..addAll({CvvValueKey: value}),
    );

    if (_DebitCardViewTextEditingControllers.containsKey(CvvValueKey)) {
      _DebitCardViewTextEditingControllers[CvvValueKey]?.text = value ?? '';
    }
  }

  bool get hasCardNumber =>
      this.formValueMap.containsKey(CardNumberValueKey) &&
      (cardNumberValue?.isNotEmpty ?? false);
  bool get hasExpiry =>
      this.formValueMap.containsKey(ExpiryValueKey) &&
      (expiryValue?.isNotEmpty ?? false);
  bool get hasCvv =>
      this.formValueMap.containsKey(CvvValueKey) &&
      (cvvValue?.isNotEmpty ?? false);

  bool get hasCardNumberValidationMessage =>
      this.fieldsValidationMessages[CardNumberValueKey]?.isNotEmpty ?? false;
  bool get hasExpiryValidationMessage =>
      this.fieldsValidationMessages[ExpiryValueKey]?.isNotEmpty ?? false;
  bool get hasCvvValidationMessage =>
      this.fieldsValidationMessages[CvvValueKey]?.isNotEmpty ?? false;

  String? get cardNumberValidationMessage =>
      this.fieldsValidationMessages[CardNumberValueKey];
  String? get expiryValidationMessage =>
      this.fieldsValidationMessages[ExpiryValueKey];
  String? get cvvValidationMessage =>
      this.fieldsValidationMessages[CvvValueKey];
}

extension Methods on FormStateHelper {
  setCardNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CardNumberValueKey] = validationMessage;
  setExpiryValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ExpiryValueKey] = validationMessage;
  setCvvValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CvvValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    cardNumberValue = '';
    expiryValue = '';
    cvvValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      CardNumberValueKey: getValidationMessage(CardNumberValueKey),
      ExpiryValueKey: getValidationMessage(ExpiryValueKey),
      CvvValueKey: getValidationMessage(CvvValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _DebitCardViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _DebitCardViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      CardNumberValueKey: getValidationMessage(CardNumberValueKey),
      ExpiryValueKey: getValidationMessage(ExpiryValueKey),
      CvvValueKey: getValidationMessage(CvvValueKey),
    });
