import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  //  Fonction login
  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    //  brancheras le backend plus tard
    await Future.delayed(const Duration(seconds: 1));

    // Simulation : on suppose que l'utilisateur est admin
    const role = "admin";

    isLoading = false;
    notifyListeners();

    // Redirection vers MainLayout si admin
    if (role == "admin") {
      Navigator.pushReplacementNamed(context, '/admin');
    }
  }
}

