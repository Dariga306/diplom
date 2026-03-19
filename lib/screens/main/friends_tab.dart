import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../../widgets/common_widgets.dart';

class FriendsTab extends StatelessWidget {
  const FriendsTab({super.key});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Friends Activity',
                        style: GoogleFonts.outfit(
                            fontSize: 26, fontWeight: FontWeight.w800,
                            color: AppColors.text, letterSpacing: -0.02 * 26)),
                    const SizedBox(height: 4),
                    Text("See what's playing right now",
                        style: GoogleFonts.outfit(fontSize: 14, color: AppColors.text2)),
                  ],
                ),
              ),
            ),

            // Live now cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _NowPlayingCard(
                    letter: 'M',
                    gradient: AppColors.gradMixed,
                    username: 'Madi is listening',
                    track: 'The 1975 — Somebody Else',
                    meta: '🌧 Rainy night · Almaty',
                    liveLabel: 'LIVE',
                    liveBg: AppColors.pink,
                    barColor1: AppColors.purpleLight,
                    barColor2: AppColors.pink,
                  ),
                  const SizedBox(height: 12),
                  _NowPlayingCard(
                    letter: 'K',
                    gradient: AppColors.gradBlue,
                    username: 'Kuanysh is listening',
                    track: 'Billie Eilish — ocean eyes',
                    meta: '😴 Sleep mode · Astana',
                    liveLabel: 'NOW',
                    liveBg: AppColors.blue,
                    barColor1: AppColors.blueLight,
                    barColor2: AppColors.cyan,
                    borderColor: AppColors.blue.withOpacity(0.2),
                    bgColors: [
                      AppColors.blue.withOpacity(0.12),
                      AppColors.cyan.withOpacity(0.08),
                    ],
                  ),
                ],
              ),
            ),

            // Recently listened
            const SizedBox(height: 16),
            const SectionHeader(title: 'Recently Listened', action: 'All →'),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  _FriendActivity(
                    letter: 'A',
                    gradient: LinearGradient(colors: [Color(0xFF7c3aed), Color(0xFFa855f7)]),
                    name: 'Aizat',
                    track: 'Arctic Monkeys — R U Mine?',
                    mood: 'Sport',
                    moodType: _MoodType.sport,
                    time: '2m ago',
                    online: true,
                  ),
                  _FriendActivity(
                    letter: 'S',
                    gradient: LinearGradient(colors: [Color(0xFF9d174d), Color(0xFFec4899)]),
                    name: 'Saltanat',
                    track: 'Lana Del Rey — Blue Jeans',
                    mood: 'Chill',
                    moodType: _MoodType.chill,
                    time: '5m ago',
                  ),
                  _FriendActivity(
                    letter: 'N',
                    gradient: LinearGradient(colors: [Color(0xFF1c1917), Color(0xFF78350f)]),
                    name: 'Nurlan',
                    track: 'Kendrick Lamar — HUMBLE.',
                    mood: 'Sport',
                    moodType: _MoodType.sport,
                    time: '12m ago',
                  ),
                  _FriendActivity(
                    letter: 'Z',
                    gradient: LinearGradient(colors: [Color(0xFF064e3b), Color(0xFF10b981)]),
                    name: 'Zarina',
                    track: 'Radiohead — Creep',
                    mood: 'Night',
                    moodType: _MoodType.night,
                    time: '18m ago',
                    online: true,
                  ),
                  _FriendActivity(
                    letter: 'T',
                    gradient: LinearGradient(colors: [Color(0xFF1e3a8a), Color(0xFF3b82f6)]),
                    name: 'Timur',
                    track: 'Daft Punk — Get Lucky',
                    mood: 'Party',
                    moodType: _MoodType.sport,
                    time: '24m ago',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _NowPlayingCard extends StatelessWidget {
  final String letter;
  final LinearGradient gradient;
  final String username;
  final String track;
  final String meta;
  final String liveLabel;
  final Color liveBg;
  final Color barColor1;
  final Color barColor2;
  final Color? borderColor;
  final List<Color>? bgColors;

  const _NowPlayingCard({
    required this.letter, required this.gradient, required this.username,
    required this.track, required this.meta, required this.liveLabel,
    required this.liveBg, required this.barColor1, required this.barColor2,
    this.borderColor, this.bgColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: bgColors != null
            ? LinearGradient(colors: bgColors!)
            : LinearGradient(colors: [
                AppColors.purpleDark.withOpacity(0.12),
                AppColors.pink.withOpacity(0.08),
              ]),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: borderColor ?? AppColors.purple.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 52, height: 52,
                decoration: BoxDecoration(gradient: gradient, shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withOpacity(0.1), width: 2)),
                child: Center(child: Text(letter,
                    style: GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white))),
              ),
              Positioned(
                bottom: -3, right: -3,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: liveBg,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(liveLabel,
                      style: GoogleFonts.outfit(
                          fontSize: 8, fontWeight: FontWeight.w800,
                          color: Colors.white, letterSpacing: 0.08)),
                ),
              ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username,
                    style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.text)),
                Text(track,
                    style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.purpleLight),
                    overflow: TextOverflow.ellipsis),
                Text(meta, style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text2)),
              ],
            ),
          ),
          const SizedBox(width: 8),
          AnimatedMusicBars(color1: barColor1, color2: barColor2, maxHeight: 24),
        ],
      ),
    );
  }
}

enum _MoodType { sport, chill, night, study }

class _FriendActivity extends StatelessWidget {
  final String letter;
  final LinearGradient gradient;
  final String name;
  final String track;
  final String mood;
  final _MoodType moodType;
  final String time;
  final bool online;

  const _FriendActivity({
    required this.letter, required this.gradient, required this.name,
    required this.track, required this.mood, required this.moodType,
    required this.time, this.online = false,
  });

  Color get moodColor {
    switch (moodType) {
      case _MoodType.sport: return const Color(0xFFfbbf24);
      case _MoodType.chill: return const Color(0xFF5eead4);
      case _MoodType.night: return AppColors.purpleLight;
      case _MoodType.study: return AppColors.blueLight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0x0AFFFFFF))),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 46, height: 46,
                decoration: BoxDecoration(gradient: gradient, shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border, width: 2)),
                child: Center(child: Text(letter,
                    style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white))),
              ),
              if (online)
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
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.text)),
                Text(track, style: GoogleFonts.outfit(fontSize: 13, color: AppColors.text2),
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: moodColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: moodColor.withOpacity(0.2)),
            ),
            child: Text(mood,
                style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.w600, color: moodColor)),
          ),
          const SizedBox(width: 8),
          Text(time, style: GoogleFonts.outfit(fontSize: 11, color: AppColors.text3)),
        ],
      ),
    );
  }
}
