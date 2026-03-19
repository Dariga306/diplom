import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'main/main_screen.dart';

class GenreSelectScreen extends StatefulWidget {
  const GenreSelectScreen({super.key});
  @override
  State<GenreSelectScreen> createState() => _GenreSelectScreenState();
}

class _GenreSelectScreenState extends State<GenreSelectScreen> {
  final Set<int> _selected = {0, 2, 3, 6};

  final _genres = const [
    _Genre('🎸', 'Indie Rock', '2.4M fans', LinearGradient(colors: [Color(0xFF4c1d95), Color(0xFF7c3aed)])),
    _Genre('✨', 'K-Pop', '8.1M fans', LinearGradient(colors: [Color(0xFF9d174d), Color(0xFFec4899)])),
    _Genre('🎹', 'Electronic', '5.3M fans', LinearGradient(colors: [Color(0xFF1e3a8a), Color(0xFF3b82f6)])),
    _Genre('🎤', 'Hip-Hop', '9.7M fans', LinearGradient(colors: [Color(0xFF1c1917), Color(0xFF57534e)])),
    _Genre('🌿', 'Ambient', '1.2M fans', LinearGradient(colors: [Color(0xFF064e3b), Color(0xFF10b981)])),
    _Genre('🎺', 'Jazz', '1.8M fans', LinearGradient(colors: [Color(0xFF7c2d12), Color(0xFFea580c)])),
    _Genre('💜', 'Alt Pop', '3.4M fans', LinearGradient(colors: [Color(0xFF3b0764), Color(0xFF7c3aed)])),
    _Genre('🤠', 'Country', '4.6M fans', LinearGradient(colors: [Color(0xFF92400e), Color(0xFFf59e0b)])),
    _Genre('🌙', 'Lo-fi', '2.9M fans', LinearGradient(colors: [Color(0xFF0f172a), Color(0xFF312e81)])),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w800,
                            color: AppColors.text, height: 1.2),
                        children: [
                          const TextSpan(text: 'What music do\n'),
                          WidgetSpan(child: ShaderMask(
                            shaderCallback: (b) => const LinearGradient(
                              colors: [AppColors.purpleLight, AppColors.pink]).createShader(b),
                            child: Text('you love?', style: GoogleFonts.outfit(
                                fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white)),
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Pick at least 3 genres to personalize your feed. You can always change this later.',
                        style: GoogleFonts.outfit(fontSize: 15, color: AppColors.text2, height: 1.55)),
                    const SizedBox(height: 24),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: _genres.length,
                      itemBuilder: (_, i) {
                        final g = _genres[i];
                        final sel = _selected.contains(i);
                        return GestureDetector(
                          onTap: () => setState(() {
                            if (sel) _selected.remove(i); else _selected.add(i);
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              gradient: g.gradient,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: sel ? Colors.white.withOpacity(0.5) : Colors.transparent,
                                width: 2,
                              ),
                              boxShadow: sel ? [BoxShadow(
                                  color: AppColors.purple.withOpacity(0.3), blurRadius: 16)] : null,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(g.emoji, style: const TextStyle(fontSize: 26)),
                                    const SizedBox(height: 6),
                                    Text(g.name, style: GoogleFonts.outfit(
                                        fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
                                        textAlign: TextAlign.center),
                                    const SizedBox(height: 2),
                                    Text(g.count, style: GoogleFonts.outfit(
                                        fontSize: 10, color: Colors.white.withOpacity(0.55))),
                                  ],
                                ),
                                if (sel)
                                  Positioned(top: 0, right: 0,
                                    child: Text('✓', style: GoogleFonts.outfit(
                                        fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white))),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            // Bottom
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.outfit(fontSize: 14, color: AppColors.text2),
                      children: [
                        TextSpan(text: '${_selected.length} genres selected',
                            style: GoogleFonts.outfit(color: AppColors.purpleLight, fontWeight: FontWeight.w700)),
                        const TextSpan(text: ' — great taste!'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const MainScreen()), (_) => false),
                    child: Container(
                      width: double.infinity, padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryBtn,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [BoxShadow(
                            color: AppColors.purpleDark.withOpacity(0.4), blurRadius: 30, offset: const Offset(0, 12))],
                      ),
                      child: Text('Continue →', textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text('Skip for now',
                      style: GoogleFonts.outfit(fontSize: 13, color: AppColors.text3)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Genre {
  final String emoji, name, count;
  final LinearGradient gradient;
  const _Genre(this.emoji, this.name, this.count, this.gradient);
}
