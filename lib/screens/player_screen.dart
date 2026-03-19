import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'lyrics_screen.dart';
import 'queue_screen.dart';
import 'modals.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});
  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> with TickerProviderStateMixin {
  bool _isPlaying = false;
  bool _isLiked = true;
  late AnimationController _floatController;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this, duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController.dispose();
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
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1a0240), Color(0xFF0d0d20), Color(0xFF001230)],
            stops: [0.0, 0.4, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Orbs
            Positioned(top: 60, left: -40,
              child: Container(width: 200, height: 200,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppColors.purple.withOpacity(0.3), Colors.transparent])))),
            Positioned(top: 120, right: -20,
              child: Container(width: 180, height: 180,
                decoration: BoxDecoration(shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppColors.pink.withOpacity(0.25), Colors.transparent])))),
            Positioned(bottom: 100, left: 0, right: 0,
              child: Center(child: Container(width: 300, height: 200,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [AppColors.blue.withOpacity(0.15), Colors.transparent]),
                )))),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    // Status
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Text('9:41', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.text)),
                      const Icon(Icons.battery_full, size: 16, color: AppColors.text),
                    ]),
                    const SizedBox(height: 16),
                    // Top bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Text('Now Playing',
                            style: GoogleFonts.outfit(
                                fontSize: 12, fontWeight: FontWeight.w600,
                                color: AppColors.text3, letterSpacing: 0.1)),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 40, height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(3, (_) => Container(
                                width: 4, height: 4,
                                margin: const EdgeInsets.symmetric(vertical: 1.5),
                                decoration: BoxDecoration(
                                  color: AppColors.text2, shape: BoxShape.circle),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 36),

                    // Cover art with float animation
                    AnimatedBuilder(
                      animation: _floatController,
                      builder: (_, __) => Transform.translate(
                        offset: Offset(0, -8 * _floatController.value),
                        child: Container(
                          width: 280, height: 280,
                          decoration: BoxDecoration(
                            gradient: AppColors.gradMixed,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(color: AppColors.purpleDark.withOpacity(0.4), blurRadius: 60),
                              BoxShadow(color: AppColors.pink.withOpacity(0.2), blurRadius: 120),
                              BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 60, offset: const Offset(0, 30)),
                            ],
                          ),
                          child: const Center(
                            child: Text('🌨', style: TextStyle(fontSize: 100)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Song info + like
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sweater Weather',
                                style: GoogleFonts.outfit(
                                    fontSize: 26, fontWeight: FontWeight.w800,
                                    color: Colors.white, letterSpacing: -0.02 * 26)),
                            Text('The Neighbourhood',
                                style: GoogleFonts.outfit(
                                    fontSize: 16, color: const Color(0xB3C8B4FF))),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => setState(() => _isLiked = !_isLiked),
                              child: Container(
                                width: 44, height: 44,
                                decoration: BoxDecoration(
                                  color: AppColors.glass,
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Icon(
                                  _isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                  color: _isLiked ? AppColors.pink : AppColors.text2,
                                  size: 22,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 44, height: 44,
                              decoration: BoxDecoration(
                                color: AppColors.glass,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColors.border),
                              ),
                              child: const Icon(Icons.add_rounded, color: AppColors.text2, size: 22),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Progress bar
                    Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: 0.38,
                              child: Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [AppColors.purple, AppColors.pink]),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('1:24', style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
                            Text('3:51', style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Shuffle
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shuffle_rounded, size: 22, color: AppColors.purpleLight),
                        ),
                        // Prev
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_previous_rounded, size: 32, color: AppColors.text2),
                        ),
                        // Play/Pause
                        GestureDetector(
                          onTap: () => setState(() => _isPlaying = !_isPlaying),
                          child: Container(
                            width: 72, height: 72,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryBtn,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: AppColors.purpleDark.withOpacity(0.5), blurRadius: 30),
                                BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 8)),
                              ],
                            ),
                            child: Icon(
                              _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                              color: Colors.white, size: 34,
                            ),
                          ),
                        ),
                        // Next
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_next_rounded, size: 32, color: AppColors.text2),
                        ),
                        // Repeat
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.repeat_rounded, size: 22, color: AppColors.text3),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Extra actions
                    Container(
                      padding: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                        border: Border(top: BorderSide(color: AppColors.border)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LyricsScreen())),
                            child: _ExtraBtn(icon: Icons.chat_bubble_outline_rounded, label: 'Lyrics', active: true),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QueueScreen())),
                            child: _ExtraBtn(icon: Icons.queue_music_rounded, label: 'Queue'),
                          ),
                          GestureDetector(
                            onTap: () => showShareTrack(context),
                            child: _ExtraBtn(icon: Icons.share_outlined, label: 'Share'),
                          ),
                          GestureDetector(
                            onTap: () => showAddToPlaylist(context),
                            child: _ExtraBtn(icon: Icons.playlist_play_rounded, label: 'Playlist'),
                          ),
                        ],
                      ),
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

class _ExtraBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  const _ExtraBtn({required this.icon, required this.label, this.active = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 22, color: active ? AppColors.purpleLight : AppColors.text3),
        const SizedBox(height: 4),
        Text(label,
            style: GoogleFonts.outfit(
                fontSize: 11, fontWeight: FontWeight.w500,
                color: active ? AppColors.purpleLight : AppColors.text3)),
      ],
    );
  }
}