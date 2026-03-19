import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../chat_screen.dart';

class MatchTab extends StatelessWidget {
  const MatchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Music Match',
                            style: GoogleFonts.outfit(
                                fontSize: 26, fontWeight: FontWeight.w800,
                                color: AppColors.text, letterSpacing: -0.02 * 26)),
                        const SizedBox(height: 2),
                        Text('3 new matches nearby',
                            style: GoogleFonts.outfit(fontSize: 14, color: AppColors.text2)),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.glass,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.tune_rounded, size: 16, color: AppColors.text2),
                          const SizedBox(width: 6),
                          Text('Filter',
                              style: GoogleFonts.outfit(
                                  fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.text2)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Match card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.border),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 40, offset: const Offset(0, 20)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Card background
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF1a0533), Color(0xFF0d1a3d), Color(0xFF1a0533)],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Orb
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(28),
                                  topRight: Radius.circular(28),
                                ),
                                gradient: RadialGradient(
                                  center: Alignment.center,
                                  colors: [AppColors.purpleDark.withOpacity(0.2), Colors.transparent],
                                ),
                              ),
                            ),
                          ),
                          // Online badge
                          Positioned(
                            top: 16, right: 16,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(color: Colors.white.withOpacity(0.15)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 6, height: 6,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF22c55e),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text('Astana',
                                      style: GoogleFonts.outfit(
                                          fontSize: 12, fontWeight: FontWeight.w600,
                                          color: Colors.white.withOpacity(0.8))),
                                ],
                              ),
                            ),
                          ),
                          // Avatar
                          Center(
                            child: Container(
                              width: 90, height: 90,
                              decoration: BoxDecoration(
                                gradient: AppColors.gradMixed,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white.withOpacity(0.15), width: 3),
                                boxShadow: [
                                  BoxShadow(color: AppColors.purpleDark.withOpacity(0.4), blurRadius: 30),
                                ],
                              ),
                              child: Center(
                                child: Text('D',
                                    style: GoogleFonts.outfit(
                                        fontSize: 36, fontWeight: FontWeight.w800, color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Card body
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Daniyar',
                                      style: GoogleFonts.outfit(
                                          fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.text)),
                                  Row(children: [
                                    const Icon(Icons.location_on_rounded, size: 14, color: AppColors.text2),
                                    const SizedBox(width: 4),
                                    Text('Astana · 2.3 km away',
                                        style: GoogleFonts.outfit(fontSize: 13, color: AppColors.text2)),
                                  ]),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ShaderMask(
                                    shaderCallback: (b) => const LinearGradient(
                                        colors: [AppColors.purpleLight, AppColors.pink]).createShader(b),
                                    child: Text('92%',
                                        style: GoogleFonts.outfit(
                                            fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
                                  ),
                                  Text('match',
                                      style: GoogleFonts.outfit(fontSize: 11, color: AppColors.text3)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Ice breaker
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.04),
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.outfit(
                                    fontSize: 13, height: 1.55, color: AppColors.text2),
                                children: [
                                  TextSpan(
                                    text: 'You both listen to ',
                                    style: GoogleFonts.outfit(color: AppColors.purpleLight, fontWeight: FontWeight.w600),
                                  ),
                                  const TextSpan(
                                    text: 'The Neighbourhood in rainy weather ☂️ — and both replay ',
                                  ),
                                  const TextSpan(
                                    text: 'Sweater Weather',
                                    style: TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                  const TextSpan(text: ' late at night.'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          // Genre tags
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _genreTag('Alt Rock', AppColors.purple),
                              _genreTag('Indie', AppColors.blue),
                              _genreTag('Chill', AppColors.pink),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Action buttons
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => const ChatScreen())),
                                  child: Container(
                                    padding: const EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      gradient: AppColors.gradPurple,
                                      borderRadius: BorderRadius.circular(14),
                                      boxShadow: [
                                        BoxShadow(color: AppColors.purpleDark.withOpacity(0.35), blurRadius: 16)
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.chat_bubble_rounded, size: 18, color: Colors.white),
                                        const SizedBox(width: 8),
                                        Text('Start Chat',
                                            style: GoogleFonts.outfit(
                                                fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: AppColors.glass,
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: AppColors.border),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.person_add_rounded, size: 18, color: AppColors.text),
                                      const SizedBox(width: 8),
                                      Text('Add Friend',
                                          style: GoogleFonts.outfit(
                                              fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.text)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Swipe hints
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _swipeHint('✕', false),
                  const SizedBox(width: 20),
                  Text('Swipe to decide',
                      style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
                  const SizedBox(width: 20),
                  _swipeHint('♥', true),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text('2 more people waiting...',
                  style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _genreTag(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(label,
          style: GoogleFonts.outfit(
              fontSize: 11, fontWeight: FontWeight.w600,
              color: color.withOpacity(0.9))),
    );
  }

  Widget _swipeHint(String symbol, bool isLike) {
    final color = isLike ? const Color(0xFF22c55e) : const Color(0xFFef4444);
    return Row(
      children: [
        if (!isLike) ...[
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: Center(child: Text(symbol, style: TextStyle(fontSize: 14, color: color))),
          ),
          const SizedBox(width: 6),
          Text('Pass', style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
        ] else ...[
          Text('Like', style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
          const SizedBox(width: 6),
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: Center(child: Text(symbol, style: TextStyle(fontSize: 14, color: color))),
          ),
        ],
      ],
    );
  }
}
