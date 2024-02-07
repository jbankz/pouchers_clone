// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String TypeValueKey = 'type';
const String IdValueKey = 'id';

final Map<String, TextEditingController> _IdViewTextEditingControllers = {};

final Map<String, FocusNode> _IdViewFocusNodes = {};

final Map<String, String? Function(String?)?> _IdViewTextValidations = {
  TypeValueKey: null,
  IdValueKey: null,
};

mixin $IdView {
  TextEditingController get typeController =>
      _getFormTextEditingController(TypeValueKey);
  TextEditingController get idController =>
      _getFormTextEditingController(IdValueKey);

  FocusNode get typeFocusNode => _getFormFocusNode(TypeValueKey);
  FocusNode get idFocusNode => _getFormFocusNode(IdValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_IdViewTextEditingControllers.containsKey(key)) {
      return _IdViewTextEditingControllers[key]!;
    }

    _IdViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _IdViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_IdViewFocusNodes.containsKey(key)) {
      return _IdViewFocusNodes[key]!;
    }
    _IdViewFocusNodes[key] = FocusNode();
    return _IdViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    typeController.addListener(() => _updateFormData(model));
    idController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    typeController.addListener(() => _updateFormData(model));
    idController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TypeValueKey: typeController.text,
          IdValueKey: idController.text,
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

    for (var controller in _IdViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _IdViewFocusNodes.values) {
      focusNode.dispose();
    }

    _IdViewTextEditingControllers.clear();
    _IdViewFocusNodes.clear();
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

  String? get typeValue => this.formValueMap[TypeValueKey] as String?;
  String? get idValue => this.formValueMap[IdValueKey] as String?;

  set typeValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TypeValueKey: value}),
    );

    if (_IdViewTextEditingControllers.containsKey(TypeValueKey)) {
      _IdViewTextEditingControllers[TypeValueKey]?.text = value ?? '';
    }
  }

  set idValue(String? value) {
    this.setData(
      this.formValueMap..addAll({IdValueKey: value}),
    );

    if (_IdViewTextEditingControllers.containsKey(IdValueKey)) {
      _IdViewTextEditingControllers[IdValueKey]?.text = value ?? '';
    }
  }

  bool get hasType =>
      this.formValueMap.containsKey(TypeValueKey) &&
      (typeValue?.isNotEmpty ?? false);
  bool get hasId =>
      this.formValueMap.containsKey(IdValueKey) &&
      (idValue?.isNotEmpty ?? false);

  bool get hasTypeValidationMessage =>
      this.fieldsValidationMessages[TypeValueKey]?.isNotEmpty ?? false;
  bool get hasIdValidationMessage =>
      this.fieldsValidationMessages[IdValueKey]?.isNotEmpty ?? false;

  String? get typeValidationMessage =>
      this.fieldsValidationMessages[TypeValueKey];
  String? get idValidationMessage => this.fieldsValidationMessages[IdValueKey];
}

extension Methods on FormStateHelper {
  setTypeValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TypeValueKey] = validationMessage;
  setIdValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[IdValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    typeValue = '';
    idValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      TypeValueKey: getValidationMessage(TypeValueKey),
      IdValueKey: getValidationMessage(IdValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _IdViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _IdViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      TypeValueKey: getValidationMessage(TypeValueKey),
      IdValueKey: getValidationMessage(IdValueKey),
    });
