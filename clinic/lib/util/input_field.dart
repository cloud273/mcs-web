import 'package:clinic/util/localization.dart';
import 'package:flutter/material.dart';

class InputField {
  static TextFormField username({
    required ValueChanged<String> onChanged,
    required FormFieldValidator<String> validator,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    String? initialValue,
  }) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      keyboardAppearance: Brightness.light,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        labelText: "Username".localized,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
    );
  }

  static TextFormField password({
    required bool showPassword,
    required ValueChanged<String> onChanged,
    required FormFieldValidator<String> validator,
    required VoidCallback onPressed,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    String? initialValue,
  }) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      keyboardAppearance: Brightness.light,
      obscureText: !showPassword,
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        suffixIcon: IconButton(
          icon: Icon(Icons.remove_red_eye),
          color: showPassword ? Colors.blue : Colors.grey,
          onPressed: onPressed,
        ),
        labelText: "Password".localized,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
    );
  }

  static TextFormField retypePassword({
    required bool showPassword,
    required ValueChanged<String> onChanged,
    required FormFieldValidator<String> validator,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    String? initialValue,
  }) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      keyboardAppearance: Brightness.light,
      obscureText: !showPassword,
      decoration: InputDecoration(
        icon: Icon(Icons.security),
        labelText: "Retype password".localized,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
    );
  }

  static TextFormField confirmedCode({
    required ValueChanged<String> onChanged,
    required FormFieldValidator<String> validator,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    String? initialValue,
  }) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      keyboardAppearance: Brightness.light,
      decoration: InputDecoration(
        icon: Icon(Icons.code),
        labelText: "Confirm code".localized,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
    );
  }

  static TextFormField freeText({
    required ValueChanged<String> onChanged,
    required FormFieldValidator<String> validator,
    IconData? icon,
    String? placeHolder,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    String? initialValue,
  }) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      keyboardAppearance: Brightness.light,
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: placeHolder,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
