import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController idController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  String selectedRole = 'Student';

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (idController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your ID and password.')),
      );
      return;
    }

    if (selectedRole == 'Student') {
      Navigator.pushReplacementNamed(context, '/student-home');
    } else if (selectedRole == 'Faculty') {
      Navigator.pushReplacementNamed(context, '/faculty-home');
    } else {
      Navigator.pushReplacementNamed(context, '/admin-home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              // Logo
              Center(
                child: Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4F46E5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Center(
                child: Text(
                  'Welcome to CampusConnect',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
                ),
              ),

              const SizedBox(height: 8),

              Center(
                child: Text(
                  'Everything on Campus, One Place.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                'Login as',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  _roleButton('Student', Icons.school),
                  const SizedBox(width: 8),
                  _roleButton('Faculty', Icons.person),
                  const SizedBox(width: 8),
                  _roleButton('Admin', Icons.admin_panel_settings),
                ],
              ),

              const SizedBox(height: 28),

              const Text(
                'ID / Email',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: idController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Enter your ID or email',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),

              const SizedBox(height: 8),

              TextField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    _showForgotPassword();
                  },
                  child: const Text('Forgot password?'),
                ),
              ),

              const SizedBox(height: 15),

              FilledButton.icon(
                onPressed: login,
                icon: const Icon(Icons.login_rounded),
                label: const Text(
                  'Login to CampusConnect',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),

              const SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, color: Color(0xFF4F46E5)),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Demo mode: Any non-empty ID and password can be used.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF3730A3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: Text(
                  'CampusConnect • SVECW',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleButton(String role, IconData icon) {
    final selected = selectedRole == role;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedRole = role;
          });
        },
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 5),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF4F46E5) : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected ? const Color(0xFF4F46E5) : Colors.grey.shade300,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 22,
                color: selected ? Colors.white : Colors.grey.shade700,
              ),
              const SizedBox(height: 5),
              Text(
                role,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: selected ? Colors.white : Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showForgotPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Forgot Password?'),
          content: const Text(
            'Password recovery will be connected to the college authentication system in the backend phase.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
