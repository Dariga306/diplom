import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../settings_screen.dart';
import '../stats_screen.dart';
import '../library_screen.dart';
import '../premium_screen.dart';
import '../notifications_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF2d0a5e), Color(0xFF1a0440), Color(0xFF0a1040)],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 200, height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(colors: [
                              AppColors.purple.withOpacity(0.25),
                              Colors.transparent,
                            ]),
                          ),
                        ),
                      ),
                      // Settings button
                      Positioned(
                        top: 0, right: 20,
                        child: SafeArea(
                          child: Container(
                            width: 40, height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.glass,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: const Icon(Icons.settings_rounded, size: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Avatar & Edit
                Positioned(
                  bottom: -36,
                  left: 0, right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 80, height: 80,
                          decoration: BoxDecoration(
                            gradient: AppColors.gradMixed,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.bg, width: 3),
                            boxShadow: [
                              BoxShadow(color: AppColors.purpleDark.withOpacity(0.4), blurRadius: 24),
                            ],
                          ),
                          child: Center(
                            child: Text('A',
                                style: GoogleFonts.outfit(
                                    fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white)),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                          decoration: BoxDecoration(
                            color: AppColors.glass,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Text('Edit Profile',
                              style: GoogleFonts.outfit(
                                  fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.text)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 44),

            // Name & handle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Aigerim Bekova',
                      style: GoogleFonts.outfit(
                          fontSize: 24, fontWeight: FontWeight.w800,
                          color: AppColors.text, letterSpacing: -0.02 * 24)),
                  const SizedBox(height: 2),
                  Row(children: [
                    Text('@aigerim_music',
                        style: GoogleFonts.outfit(fontSize: 14, color: AppColors.text2)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.purple.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.purple.withOpacity(0.25)),
                      ),
                      child: Text('PRO',
                          style: GoogleFonts.outfit(
                              fontSize: 11, fontWeight: FontWeight.w700,
                              color: AppColors.purpleLight, letterSpacing: 0.04)),
                    ),
                  ]),
                ],
              ),
            ),

            // Stats
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.surface,
                ),
                child: Row(
                  children: [
                    Expanded(child: _StatCell(value: '847', label: 'Songs')),
                    Container(width: 1, height: 60, color: AppColors.border),
                    Expanded(child: _StatCell(value: '124h', label: 'This month')),
                    Container(width: 1, height: 60, color: AppColors.border),
                    Expanded(child: _StatCell(value: '38', label: 'Friends')),
                  ],
                ),
              ),
            ),

            // Quick access
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('My Pages', style: GoogleFonts.outfit(
                  fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.text)),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                _NavRow(icon: '📚', label: 'Library', sub: 'Your playlists & albums',
                    color: AppColors.blue, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LibraryScreen()))),
                _NavRow(icon: '📊', label: 'Stats & Wrapped', sub: '2024 year in review',
                    color: AppColors.purple, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StatsScreen()))),
                _NavRow(icon: '👑', label: 'Go Premium', sub: 'Unlock all features',
                    color: const Color(0xFFf59e0b), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PremiumScreen()))),
                _NavRow(icon: '🔔', label: 'Notifications', sub: 'Matches, friends, music',
                    color: AppColors.pink, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen()))),
                _NavRow(icon: '⚙️', label: 'Settings', sub: 'Account, playback, privacy',
                    color: AppColors.text2, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()))),
              ]),
            ),

            // Genres
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Favorite Genres',
                  style: GoogleFonts.outfit(
                      fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.text)),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 8, runSpacing: 8,
                children: [
                  _GenreBadge(label: 'Indie Rock', color: AppColors.purple),
                  _GenreBadge(label: 'Pop', color: AppColors.pink),
                  _GenreBadge(label: 'Electronic', color: AppColors.blue),
                  _GenreBadge(label: 'Ambient', color: const Color(0xFF14b8a6)),
                  _GenreBadge(label: 'Alt Pop', color: AppColors.purple),
                ],
              ),
            ),

            // Top Artists
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Top Artists',
                  style: GoogleFonts.outfit(
                      fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.text)),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                children: const [
                  _ArtistItem(emoji: '🎸', name: 'The Neighbourhood',
                      gradient: LinearGradient(colors: [Color(0xFF7c3aed), Color(0xFFec4899)])),
                  _ArtistItem(emoji: '🎹', name: 'The 1975',
                      gradient: LinearGradient(colors: [Color(0xFF1e3a8a), Color(0xFF3b82f6)])),
                  _ArtistItem(emoji: '🎤', name: 'NIKI',
                      gradient: LinearGradient(colors: [Color(0xFF065f46), Color(0xFF10b981)])),
                  _ArtistItem(emoji: '🌟', name: 'Taylor Swift',
                      gradient: LinearGradient(colors: [Color(0xFF9d174d), Color(0xFFec4899)])),
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

class _StatCell extends StatelessWidget {
  final String value;
  final String label;
  const _StatCell({required this.value, required this.label});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (b) => const LinearGradient(
              colors: [AppColors.purpleLight, AppColors.pink],
            ).createShader(b),
            child: Text(value,
                style: GoogleFonts.outfit(
                    fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white)),
          ),
          const SizedBox(height: 3),
          Text(label,
              style: GoogleFonts.outfit(fontSize: 11, color: AppColors.text3, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _GenreBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _GenreBadge({required this.label, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Text(label,
          style: GoogleFonts.outfit(
              fontSize: 13, fontWeight: FontWeight.w600, color: color.withOpacity(0.9))),
    );
  }
}

class _ArtistItem extends StatelessWidget {
  final String emoji;
  final String name;
  final LinearGradient gradient;
  const _ArtistItem({required this.emoji, required this.name, required this.gradient});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(
              gradient: gradient,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.border, width: 2),
            ),
            child: Center(child: Text(emoji, style: const TextStyle(fontSize: 24))),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 70,
            child: Text(name,
                textAlign: TextAlign.center,
                maxLines: 1, overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(
                    fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.text)),
          ),
        ],
      ),
    );
  }
}

class _NavRow extends StatelessWidget {
  final String icon, label, sub;
  final Color color;
  final VoidCallback onTap;
  const _NavRow({required this.icon, required this.label, required this.sub,
      required this.color, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(children: [
          Container(width: 38, height: 38,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 18)))),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: GoogleFonts.outfit(
                fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.text)),
            Text(sub, style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
          ])),
          Icon(Icons.chevron_right_rounded, color: AppColors.text3, size: 20),
        ]),
      ),
    );
  }
}