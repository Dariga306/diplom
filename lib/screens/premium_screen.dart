import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFF08080f), Color(0xFF1a0533), Color(0xFF0a0f24)],
            stops: [0.0, 0.45, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Positioned(top: 100, right: -40,
              child: Container(width: 200, height: 200,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppColors.pink.withOpacity(0.2), Colors.transparent])))),
            Positioned(top: 250, left: -30,
              child: Container(width: 160, height: 160,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppColors.purpleDark.withOpacity(0.2), Colors.transparent])))),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    // Hero
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                      child: Column(children: [
                        const Text('👑', style: TextStyle(fontSize: 48)),
                        const SizedBox(height: 12),
                        ShaderMask(
                          shaderCallback: (b) => const LinearGradient(
                            colors: [AppColors.purpleLight, AppColors.pink, Color(0xFFfbbf24)],
                          ).createShader(b),
                          child: Text('Go Premium', style: GoogleFonts.outfit(
                              fontSize: 30, fontWeight: FontWeight.w900,
                              color: Colors.white, letterSpacing: -0.03 * 30)),
                        ),
                        const SizedBox(height: 6),
                        Text('Unlock the full MoodWave experience',
                            style: GoogleFonts.outfit(fontSize: 14, color: AppColors.text2)),
                      ]),
                    ),
                    // Free plan
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.surface,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text('Free', style: GoogleFonts.outfit(
                              fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.text2)),
                          const SizedBox(height: 4),
                          RichText(text: TextSpan(
                            style: GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.w900,
                                color: AppColors.text2, letterSpacing: -0.03 * 36, height: 1),
                            children: [
                              const TextSpan(text: '₸0 '),
                              TextSpan(text: '/ month', style: GoogleFonts.outfit(
                                  fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.text3)),
                            ],
                          )),
                          const SizedBox(height: 14),
                          _Feature('Basic recommendations', true),
                          _Feature('Music Match (3/day)', true),
                          _Feature('Offline listening', false),
                          _Feature('320kbps audio', false),
                          _Feature('AI Playlist Generator', false),
                        ]),
                      ),
                    ),
                    // Pro plan
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            AppColors.purpleDark.withOpacity(0.15),
                            AppColors.pink.withOpacity(0.1),
                          ]),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: AppColors.purple.withOpacity(0.6), width: 2),
                          boxShadow: [BoxShadow(
                              color: AppColors.purpleDark.withOpacity(0.3), blurRadius: 40)],
                        ),
                        child: Stack(children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text('Pro', style: GoogleFonts.outfit(
                                fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.text)),
                            const SizedBox(height: 4),
                            RichText(text: TextSpan(
                              style: GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.w900,
                                  color: AppColors.text, letterSpacing: -0.03 * 36, height: 1),
                              children: [
                                const TextSpan(text: '₸1 990 '),
                                TextSpan(text: '/ month', style: GoogleFonts.outfit(
                                    fontSize: 14, fontWeight: FontWeight.w500,
                                    color: Colors.white.withOpacity(0.6))),
                              ],
                            )),
                            const SizedBox(height: 6),
                            Text("Everything you need, nothing you don't",
                                style: GoogleFonts.outfit(fontSize: 13, color: AppColors.text2)),
                            const SizedBox(height: 14),
                            _Feature('AI recommendations', true),
                            _Feature('Unlimited Music Matches', true),
                            _Feature('Offline listening', true),
                            _Feature('320 kbps audio', true),
                            _Feature('AI Playlist Generator', true),
                            _Feature('Listening Party Host', true),
                          ]),
                          Positioned(
                            top: -20, right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                              decoration: const BoxDecoration(
                                gradient: AppColors.gradPink,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                              ),
                              child: Text('Most Popular', style: GoogleFonts.outfit(
                                  fontSize: 11, fontWeight: FontWeight.w800,
                                  color: Colors.white, letterSpacing: 0.06)),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    // CTA
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        Container(
                          width: double.infinity, padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryBtn,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [BoxShadow(
                                color: AppColors.purpleDark.withOpacity(0.4),
                                blurRadius: 30, offset: const Offset(0, 12))],
                          ),
                          child: Text('Start 30-Day Free Trial →', textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                  fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                        ),
                        const SizedBox(height: 10),
                        Text('Then ₸1 990/month. Cancel anytime.',
                            style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
                        const SizedBox(height: 14),
                        Text('Compare all plans ↓', style: GoogleFonts.outfit(
                            fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.purpleLight)),
                      ]),
                    ),
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

class _Feature extends StatelessWidget {
  final String label;
  final bool enabled;
  const _Feature(this.label, this.enabled);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(children: [
        Container(
          width: 18, height: 18,
          decoration: BoxDecoration(
            color: enabled ? const Color(0xFF22c55e).withOpacity(0.2)
                : const Color(0xFFef4444).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(child: Text(enabled ? '✓' : '✕', style: TextStyle(
              fontSize: 10, color: enabled ? const Color(0xFF22c55e) : const Color(0xFFf87171)))),
        ),
        const SizedBox(width: 8),
        Text(label, style: GoogleFonts.outfit(
            fontSize: 13, fontWeight: FontWeight.w500,
            color: enabled ? Colors.white.withOpacity(0.85) : AppColors.text3)),
      ]),
    );
  }
}
