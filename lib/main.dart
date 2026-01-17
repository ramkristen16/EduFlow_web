import 'package:apk_web_eduflow/frontend/auth/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Login
import 'frontend/auth/view/login_view.dart';
import 'frontend/auth/widgets/login_form.dart';
import 'frontend/auth/view_model/login_view_model.dart';

// Admin
import 'frontend/Administrateur/layout/main_layout.dart';
import 'frontend/Administrateur/core/navigation_view_model.dart';
import 'frontend/Administrateur/pages/Cours/view_models/cours_view_model.dart';
import 'frontend/Administrateur/pages/edt/view_model/edt_view_model.dart';
import 'frontend/Administrateur/pages/Dashboard/view_model/dashboard_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Login
        ChangeNotifierProvider(create: (_) => LoginViewModel()),

        // Admin
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
        ChangeNotifierProvider(create: (_) => CoursViewModel()),
        ChangeNotifierProvider(create: (_) => EdtViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
      ],
      child: const EduFlowApp(),
    ),
  );
}

class EduFlowApp extends StatelessWidget {
  const EduFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginView(),
        '/admin': (context) => const MainLayout(),
      },
    );
  }
}
