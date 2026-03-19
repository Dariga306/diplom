import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'genre_select_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF08080f), Color(0xFF150825), Color(0xFF08080f)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Positioned(top: 80, right: -40,
              child: Container(width: 220, height: 220,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppColors.purple.withOpacity(0.15), Colors.transparent])))),
            Positioned(bottom: 150, left: -30,
              child: Container(width: 180, height: 180,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppColors.pink.withOpacity(0.12), Colors.transparent])))),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Row(children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 40, height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.glass,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: const Icon(Icons.arrow_back_rounded, size: 18, color: Colors.white),
                        ),
                      ),
                    ]),
                    const SizedBox(height: 4),
                    // Step dots
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      _StepDot(state: _DotState.done),
                      const SizedBox(width: 6),
                      _StepDot(state: _DotState.active),
                      const SizedBox(width: 6),
                      _StepDot(state: _DotState.inactive),
                    ]),
                    const SizedBox(height: 28),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w800,
                            color: AppColors.text, height: 1.2),
                        children: [
                          const TextSpan(text: 'Create your\n'),
                          WidgetSpan(child: ShaderMask(
                            shaderCallback: (b) => const LinearGradient(
                              colors: [AppColors.purpleLight, AppColors.pink]).createShader(b),
                            child: Text('account', style: GoogleFonts.outfit(
                                fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white)),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('Step 2 of 3 — Personal details',
                        style: GoogleFonts.outfit(fontSize: 14, color: AppColors.text2)),
                    const SizedBox(height: 24),
                    // Name row
                    Row(children: [
                      Expanded(child: _InputField(label: 'FIRST NAME',
                          child: Text('Aigerim', style: GoogleFonts.outfit(fontSize: 15, color: AppColors.text)),
                          highlighted: true)),
                      const SizedBox(width: 10),
                      Expanded(child: _InputField(label: 'LAST NAME',
                          child: Text('Bekova', style: GoogleFonts.outfit(fontSize: 15, color: AppColors.text2)))),
                    ]),
                    const SizedBox(height: 14),
                    _InputField(
                      label: 'USERNAME',
                      child: Row(children: [
                        const Icon(Icons.person_rounded, size: 16, color: AppColors.purpleLight),
                        const SizedBox(width: 8),
                        Text('@aigerim_music', style: GoogleFonts.outfit(fontSize: 15, color: AppColors.text2)),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFF22c55e).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: const Color(0xFF22c55e).withOpacity(0.2)),
                          ),
                          child: Text('Available', style: GoogleFonts.outfit(
                              fontSize: 10, fontWeight: FontWeight.w700, color: const Color(0xFF22c55e))),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 14),
                    _InputField(
                      label: 'DATE OF BIRTH',
                      child: Row(children: [
                        const Icon(Icons.calendar_today_rounded, size: 16, color: AppColors.text3),
                        const SizedBox(width: 8),
                        Text('Oct 15, 2001', style: GoogleFonts.outfit(fontSize: 15, color: AppColors.text)),
                        const Spacer(),
                        const Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: AppColors.text3),
                      ]),
                    ),
                    const SizedBox(height: 14),
                    _InputField(
                      label: 'PASSWORD',
                      child: Row(children: [
                        const Icon(Icons.lock_outline_rounded, size: 16, color: AppColors.text3),
                        const SizedBox(width: 8),
                        Text('••••••••••••', style: GoogleFonts.outfit(fontSize: 15, color: AppColors.text)),
                        const Spacer(),
                        const Icon(Icons.visibility_off_outlined, size: 16, color: AppColors.text3),
                      ]),
                      footer: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(children: List.generate(4, (i) => Expanded(
                            child: Container(
                              height: 3,
                              margin: EdgeInsets.only(right: i < 3 ? 4 : 0),
                              decoration: BoxDecoration(
                                color: i < 3 ? const Color(0xFF22c55e) : const Color(0xFFf59e0b),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ))),
                          const SizedBox(height: 5),
                          Text('Strong password ✓',
                              style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.w600,
                                  color: const Color(0xFF22c55e))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3, height: 1.6),
                        children: [
                          const TextSpan(text: 'By signing up you agree to our '),
                          TextSpan(text: 'Terms of Service',
                              style: GoogleFonts.outfit(color: AppColors.purpleLight)),
                          const TextSpan(text: ' and '),
                          TextSpan(text: 'Privacy Policy',
                              style: GoogleFonts.outfit(color: AppColors.purpleLight)),
                          const TextSpan(text: ". You also confirm you're at least 13 years old."),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const GenreSelectScreen())),
                      child: Container(
                        width: double.infinity, padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryBtn,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [BoxShadow(
                              color: AppColors.purpleDark.withOpacity(0.4), blurRadius: 30, offset: const Offset(0, 12))],
                        ),
                        child: Text('Create Account →', textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(children: [
                      Expanded(child: Divider(color: AppColors.border)),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text('OR', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600,
                            color: AppColors.text3, letterSpacing: 0.08))),
                      Expanded(child: Divider(color: AppColors.border)),
                    ]),
                    const SizedBox(height: 18),
                    Row(children: [
                      Expanded(child: _SocialMini(icon: Icons.g_mobiledata_rounded, label: 'Google')),
                      const SizedBox(width: 10),
                      Expanded(child: _SocialMini(icon: Icons.apple_rounded, label: 'Apple')),
                    ]),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _DotState { done, active, inactive }

class _StepDot extends StatelessWidget {
  final _DotState state;
  const _StepDot({required this.state});
  @override
  Widget build(BuildContext context) {
    double width = state == _DotState.done ? 20 : state == _DotState.active ? 14 : 7;
    Color color = state == _DotState.inactive ? AppColors.surface3
        : state == _DotState.active ? AppColors.purpleLight : AppColors.purple;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width, height: 7,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final Widget child;
  final bool highlighted;
  final Widget? footer;
  const _InputField({required this.label, required this.child, this.highlighted = false, this.footer});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.w700,
            color: AppColors.text3, letterSpacing: 0.08)),
        const SizedBox(height: 7),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          decoration: BoxDecoration(
            color: highlighted ? AppColors.purpleDark.withOpacity(0.08) : AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: highlighted ? AppColors.purple.withOpacity(0.4) : AppColors.border),
          ),
          child: child,
        ),
        if (footer != null) footer!,
      ],
    );
  }
}

class _SocialMini extends StatelessWidget {
  final IconData icon;
  final String label;
  const _SocialMini({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: AppColors.glass2,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border2),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, size: 18, color: AppColors.text),
        const SizedBox(width: 8),
        Text(label, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.text)),
      ]),
    );
  }
}
