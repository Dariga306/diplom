import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          // Header
          Container(
            color: AppColors.bg2,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            width: 36, height: 36,
                            child: const Icon(Icons.arrow_back_rounded, color: AppColors.text, size: 20),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Avatar
                        Stack(
                          children: [
                            Container(
                              width: 42, height: 42,
                              decoration: BoxDecoration(
                                gradient: AppColors.gradMixed,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white.withOpacity(0.1), width: 2),
                              ),
                              child: Center(
                                child: Text('D',
                                    style: GoogleFonts.outfit(
                                        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                              ),
                            ),
                            Positioned(
                              bottom: 1, right: 1,
                              child: Container(
                                width: 10, height: 10,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF22c55e),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.bg, width: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Daniyar',
                                  style: GoogleFonts.outfit(
                                      fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.text)),
                              Text('● Listening now',
                                  style: GoogleFonts.outfit(
                                      fontSize: 12, fontWeight: FontWeight.w500,
                                      color: const Color(0xFF22c55e))),
                            ],
                          ),
                        ),
                        const Icon(Icons.call_outlined, size: 22, color: AppColors.text2),
                        const SizedBox(width: 8),
                        const Icon(Icons.queue_music_rounded, size: 22, color: AppColors.purpleLight),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(height: 1, color: AppColors.border),

          // Shared playlist banner
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.purpleDark.withOpacity(0.15),
                  AppColors.pink.withOpacity(0.1),
                ]),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.purple.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  const Text('🎧', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Our Shared Playlist',
                            style: GoogleFonts.outfit(
                                fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.text)),
                        Text('14 songs · Tap to listen together',
                            style: GoogleFonts.outfit(fontSize: 12, color: AppColors.purpleLight)),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded, color: AppColors.purpleLight, size: 18),
                ],
              ),
            ),
          ),

          // Messages
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // Them
                _ThemMessage(
                  letter: 'D',
                  text: 'yo have you heard the new Neighbourhood track?',
                  time: '2:14 PM',
                ),
                const SizedBox(height: 12),
                // Me
                _MeMessage(text: 'omg yes!! sending it rn 🎵'),
                const SizedBox(height: 12),
                // Music message
                _MusicMessage(),
                const SizedBox(height: 12),
                // Them
                _ThemMessage(
                  letter: 'D',
                  text: "this is EXACTLY my vibe when it snows 🌨 we should add it to our playlist",
                  time: '2:16 PM',
                ),
                const SizedBox(height: 12),
                // Me
                _MeMessage(text: 'yes!! adding it now ✨', time: '2:16 PM'),
                const SizedBox(height: 12),
              ],
            ),
          ),

          // Input
          Container(
            color: AppColors.bg2,
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('Send a message...',
                              style: GoogleFonts.outfit(fontSize: 15, color: AppColors.text3)),
                        ),
                        const Text('😊', style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 8),
                        const Icon(Icons.queue_music_rounded, size: 22, color: AppColors.purpleLight),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 46, height: 46,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradPurple,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: AppColors.purpleDark.withOpacity(0.4), blurRadius: 12)],
                  ),
                  child: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemMessage extends StatelessWidget {
  final String letter;
  final String text;
  final String? time;
  const _ThemMessage({required this.letter, required this.text, this.time});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 32, height: 32,
          decoration: BoxDecoration(gradient: AppColors.gradMixed, shape: BoxShape.circle),
          child: Center(child: Text(letter,
              style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white))),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.surface2,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18), topRight: Radius.circular(18),
                    bottomRight: Radius.circular(18), bottomLeft: Radius.circular(6),
                  ),
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(text,
                    style: GoogleFonts.outfit(fontSize: 14, height: 1.55, color: AppColors.text)),
              ),
              if (time != null) ...[
                const SizedBox(height: 4),
                Text(time!, style: GoogleFonts.outfit(fontSize: 10, color: AppColors.text3)),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _MeMessage extends StatelessWidget {
  final String text;
  final String? time;
  const _MeMessage({required this.text, this.time});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              gradient: AppColors.gradPurple,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18), bottomRight: Radius.circular(6),
              ),
            ),
            child: Text(text,
                style: GoogleFonts.outfit(fontSize: 14, height: 1.55, color: Colors.white)),
          ),
          if (time != null) ...[
            const SizedBox(height: 4),
            Text(time!, style: GoogleFonts.outfit(fontSize: 10, color: AppColors.text3)),
          ],
        ],
      ),
    );
  }
}

class _MusicMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48, height: 48,
              decoration: BoxDecoration(
                gradient: AppColors.gradMixed,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(child: Text('🌨', style: TextStyle(fontSize: 22))),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sweater Weather',
                    style: GoogleFonts.outfit(
                        fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.text)),
                Text('The Neighbourhood',
                    style: GoogleFonts.outfit(fontSize: 11, color: AppColors.text2)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: 80, height: 3,
                      decoration: BoxDecoration(
                        color: AppColors.surface3,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: FractionallySizedBox(
                        widthFactor: 0.45,
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.purple,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text('3:51',
                        style: GoogleFonts.outfit(fontSize: 10, color: AppColors.text3)),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 8),
            Container(
              width: 28, height: 28,
              decoration: const BoxDecoration(color: AppColors.purple, shape: BoxShape.circle),
              child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 16),
            ),
          ],
        ),
      ),
    );
  }
}
