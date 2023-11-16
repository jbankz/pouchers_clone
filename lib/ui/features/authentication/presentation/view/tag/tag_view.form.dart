// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String TagValueKey = 'tag';

final Map<String, TextEditingController> _TagViewTextEditingControllers = {};

final Map<String, FocusNode> _TagViewFocusNodes = {};

final Map<String, String? Function(String?)?> _TagViewTextValidations = {
  TagValueKey: null,
};

mixin $TagView {
  TextEditingController get tagController =>
      _getFormTextEditingController(TagValueKey);

  FocusNode get tagFocusNode => _getFormFocusNode(TagValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_TagViewTextEditingControllers.containsKey(key)) {
      return _TagViewTextEditingControllers[key]!;
    }

    _TagViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _TagViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_TagViewFocusNodes.containsKey(key)) {
      return _TagViewFocusNodes[key]!;
    }
    _TagViewFocusNodes[key] = FocusNode();
    return _TagViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    tagController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    tagController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          TagValueKey: tagController.text,
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

    for (var controller in _TagViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _TagViewFocusNodes.values) {
      focusNode.dispose();
    }

    _TagViewTextEditingControllers.clear();
    _TagViewFocusNodes.clear();
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

  String? get tagValue => this.formValueMap[TagValueKey] as String?;

  set tagValue(String? value) {
    this.setData(
      this.formValueMap..addAll({TagValueKey: value}),
    );

    if (_TagViewTextEditingControllers.containsKey(TagValueKey)) {
      _TagViewTextEditingControllers[TagValueKey]?.text = value ?? '';
    }
  }

  bool get hasTag =>
      this.formValueMap.containsKey(TagValueKey) &&
      (tagValue?.isNotEmpty ?? false);

  bool get hasTagValidationMessage =>
      this.fieldsValidationMessages[TagValueKey]?.isNotEmpty ?? false;

  String? get tagValidationMessage =>
      this.fieldsValidationMessages[TagValueKey];
}

extension Methods on FormStateHelper {
  setTagValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TagValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    tagValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      TagValueKey: getValidationMessage(TagValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _TagViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _TagViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      TagValueKey: getValidationMessage(TagValueKey),
    });
