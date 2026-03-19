import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'main/main_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF08080f), Color(0xFF150825), Color(0xFF0d1328)],
            stops: [0.0, 0.4, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Orb
            Positioned(
              top: 60, left: 0, right: 0,
              child: Center(
                child: Container(
                  width: 300, height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      AppColors.purpleDark.withOpacity(0.18),
                      Colors.transparent,
                    ]),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    // Logo
                    Container(
                      width: 72, height: 72,
                      decoration: BoxDecoration(
                        gradient: AppColors.gradMixed,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.purpleDark.withOpacity(0.4),
                            blurRadius: 30,
                          )
                        ],
                      ),
                      child: const Icon(Icons.graphic_eq_rounded, size: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Text('MoodWave',
                        style: GoogleFonts.outfit(
                            fontSize: 22, fontWeight: FontWeight.w800,
                            color: AppColors.text, letterSpacing: -0.02 * 22)),
                    const SizedBox(height: 24),
                    Text('Welcome back',
                        style: GoogleFonts.outfit(
                            fontSize: 28, fontWeight: FontWeight.w800,
                            color: AppColors.text, letterSpacing: -0.02 * 28)),
                    const SizedBox(height: 6),
                    Text('Sign in to your account',
                        style: GoogleFonts.outfit(fontSize: 14, color: AppColors.text2)),
                    const SizedBox(height: 32),
                    // Google button
                    _SocialButton(
                      icon: _googleIcon(),
                      label: 'Continue with Google',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12),
                    // Apple button
                    _SocialButton(
                      icon: const Icon(Icons.apple, size: 22, color: AppColors.text),
                      label: 'Continue with Apple',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    // Divider
                    Row(children: [
                      Expanded(child: Divider(color: AppColors.border)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text('OR',
                            style: GoogleFonts.outfit(
                                fontSize: 12, fontWeight: FontWeight.w500,
                                color: AppColors.text3, letterSpacing: 0.08)),
                      ),
                      Expanded(child: Divider(color: AppColors.border)),
                    ]),
                    const SizedBox(height: 20),
                    // Email input
                    _InputField(
                      label: 'EMAIL',
                      icon: Icons.email_outlined,
                      placeholder: 'your@email.com',
                    ),
                    const SizedBox(height: 14),
                    // Password input
                    _InputField(
                      label: 'PASSWORD',
                      icon: Icons.lock_outline_rounded,
                      placeholder: '••••••••••',
                      trailing: const Icon(Icons.visibility_outlined, size: 18, color: AppColors.text3),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot password?',
                          style: GoogleFonts.outfit(
                              fontSize: 13, color: AppColors.purpleLight)),
                    ),
                    const SizedBox(height: 20),
                    // Sign In button
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const MainScreen())),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryBtn,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.purpleDark.withOpacity(0.4),
                              blurRadius: 30, offset: const Offset(0, 12),
                            )
                          ],
                        ),
                        child: Text('Sign In',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SignUpScreen())),
                      child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.outfit(fontSize: 14, color: AppColors.text2),
                        children: [
                          const TextSpan(text: 'New to MoodWave? '),
                          TextSpan(
                            text: 'Create account',
                            style: GoogleFonts.outfit(
                                color: AppColors.purpleLight, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _googleIcon() {
    return const Icon(Icons.g_mobiledata_rounded, size: 28, color: Colors.white);
  }
}

class _SocialButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;
  const _SocialButton({required this.icon, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.glass2,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 12),
            Text(label,
                style: GoogleFonts.outfit(
                    fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.text)),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String placeholder;
  final Widget? trailing;
  const _InputField({required this.label, required this.icon, required this.placeholder, this.trailing});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: GoogleFonts.outfit(
                fontSize: 12, fontWeight: FontWeight.w600,
                color: AppColors.text3, letterSpacing: 0.06)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: AppColors.text3),
              const SizedBox(width: 10),
              Expanded(
                child: Text(placeholder,
                    style: GoogleFonts.outfit(fontSize: 15, color: AppColors.text3)),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ],
    );
  }
}
