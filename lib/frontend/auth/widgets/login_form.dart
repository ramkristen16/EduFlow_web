import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/login_view_model.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();

    return Column(
      children: [
        inputField(
          icon: Icons.person,
          hint: "Nom utilisateur",
          controller: vm.usernameController,
        ),
        const SizedBox(height: 15),
        inputField(
          icon: Icons.lock,
          hint: "Mot de passe",
          isPassword: true,
          controller: vm.passwordController,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 280,
          height: 42,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: vm.isLoading ? null : () => vm.login(context),
            child: vm.isLoading
                ? const CircularProgressIndicator()
                : const Text("SE CONNECTER"),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 280,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Mot de passe oublié ?",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget inputField({
    required IconData icon,
    required String hint,
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    return SizedBox(
      width: 280,
      child: TextField(
        controller: controller,
        obscureText: isPassword ? _obscurePassword : false,
        onChanged: (_) => setState(() {}),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          suffixIcon: isPassword && controller.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white54,
                    size: 19,
                  ),
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                )
              : null,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.white70),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
