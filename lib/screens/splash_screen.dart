import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/common_widgets.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _barController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this, duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _barController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _barController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF08080f),
              Color(0xFF1a0533),
              Color(0xFF0d1a3d),
              Color(0xFF08080f),
            ],
            stops: [0.0, 0.35, 0.65, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Orb 1
            Positioned(
              top: 80, left: -60,
              child: AnimatedBuilder(
                animation: _pulseController,
                builder: (_, __) => Transform.scale(
                  scale: 1.0 + 0.1 * _pulseController.value,
                  child: Opacity(
                    opacity: 0.7 + 0.3 * _pulseController.value,
                    child: Container(
                      width: 280, height: 280,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(colors: [
                          const Color(0xFF8B5CF6).withOpacity(0.35),
                          Colors.transparent,
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Orb 2
            Positioned(
              bottom: 120, right: -40,
              child: AnimatedBuilder(
                animation: _pulseController,
                builder: (_, __) => Transform.scale(
                  scale: 1.0 + 0.1 * _pulseController.value,
                  child: Container(
                    width: 240, height: 240,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(colors: [
                        AppColors.pink.withOpacity(0.30),
                        Colors.transparent,
                      ]),
                    ),
                  ),
                ),
              ),
            ),
            // Orb 3
            Positioned(
              top: 300, right: 40,
              child: Container(
                width: 160, height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    AppColors.blue.withOpacity(0.25),
                    Colors.transparent,
                  ]),
                ),
              ),
            ),
            // Content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // Logo
                    Container(
                      width: 96, height: 96,
                      decoration: BoxDecoration(
                        gradient: AppColors.gradMixed,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(color: const Color(0xFF8B5CF6).withOpacity(0.5), blurRadius: 40),
                          BoxShadow(color: AppColors.pink.withOpacity(0.3), blurRadius: 80),
                        ],
                      ),
                      child: const Icon(Icons.graphic_eq_rounded, size: 52, color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    // App name
                    GradientText(
                      'MoodWave',
                      gradient: AppColors.titleGradient,
                      style: GoogleFonts.outfit(
                          fontSize: 40, fontWeight: FontWeight.w800, letterSpacing: -0.03 * 40),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Discover music through your mood',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                          fontSize: 16, fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.65)),
                    ),
                    const SizedBox(height: 60),
                    // Animated bars
                    _AnimatedSplashBars(controller: _barController),
                    const SizedBox(height: 60),
                    // Get Started button
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const OnboardingScreen())),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryBtn,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.purpleDark.withOpacity(0.45),
                              blurRadius: 32, offset: const Offset(0, 12),
                            )
                          ],
                        ),
                        child: Text('Get Started',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                                fontSize: 17, fontWeight: FontWeight.w700, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.outfit(fontSize: 14, color: AppColors.text2),
                          children: [
                            const TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              text: 'Sign in',
                              style: GoogleFonts.outfit(
                                  color: AppColors.purpleLight, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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

class _AnimatedSplashBars extends StatelessWidget {
  final AnimationController controller;
  static const List<double> heights = [0.6, 1.0, 0.45, 0.8, 0.35, 0.95, 0.55];
  static const List<double> delays = [0.0, 0.1, 0.2, 0.3, 0.4, 0.1, 0.25];

  const _AnimatedSplashBars({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(7, (i) {
          return AnimatedBuilder(
            animation: controller,
            builder: (_, __) {
              final t = (controller.value + delays[i]) % 1.0;
              final scale = 0.6 + 0.4 * (0.5 - 0.5 * cos(t * 2 * pi));
              return Container(
                width: 4,
                height: 40 * heights[i] * scale,
                margin: const EdgeInsets.symmetric(horizontal: 2.5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.purpleLight, AppColors.pink],
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
