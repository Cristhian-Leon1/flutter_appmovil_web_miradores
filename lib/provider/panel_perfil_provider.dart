import 'package:flutter/material.dart';

class PerfilProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController letraController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode telefonoFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode letraFocusNode = FocusNode();

  int _selectedOption = 0;

  int get selectedOption => _selectedOption;

  void updateSelectedOption(int option) {
    _selectedOption = option;
    notifyListeners();
  }
}