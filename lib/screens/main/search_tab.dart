import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../../widgets/common_widgets.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

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
                    Text('Search',
                        style: GoogleFonts.outfit(
                            fontSize: 26, fontWeight: FontWeight.w800,
                            color: AppColors.text, letterSpacing: -0.02 * 26)),
                    const SizedBox(height: 16),
                    // Search bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search_rounded, size: 20, color: AppColors.text3),
                          const SizedBox(width: 10),
                          Text('Artists, songs, podcasts...',
                              style: GoogleFonts.outfit(fontSize: 15, color: AppColors.text3)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Trending
            const SectionHeader(title: 'Trending Now', action: 'See all'),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _TrendItem(icon: '🔥', gradient: AppColors.gradMixed,
                      name: 'Sweater Weather', type: 'Song · The Neighbourhood'),
                  _TrendItem(icon: '🎤', gradient: AppColors.gradBlue,
                      name: 'The 1975', type: 'Artist · 12.4M followers'),
                  _TrendItem(icon: '💿', gradient: AppColors.gradTeal,
                      name: 'Chill Evening Mix', type: 'Playlist · 2.1K listeners'),
                  _TrendItem(icon: '🎵', gradient: AppColors.gradOrange,
                      name: 'Snow Vibes', type: 'Playlist · Weather mix'),
                ],
              ),
            ),

            // Browse Genres
            const SizedBox(height: 20),
            const SectionHeader(title: 'Browse Genres'),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.2,
                children: const [
                  _GenreCard(emoji: '🎤', name: 'Pop',
                      gradient: LinearGradient(colors: [Color(0xFF7c3aed), Color(0xFFa855f7)])),
                  _GenreCard(emoji: '🎸', name: 'Rock',
                      gradient: LinearGradient(colors: [Color(0xFF1e3a8a), Color(0xFF3b82f6)])),
                  _GenreCard(emoji: '✨', name: 'K-Pop',
                      gradient: LinearGradient(colors: [Color(0xFF9d174d), Color(0xFFec4899)])),
                  _GenreCard(emoji: '🎤', name: 'Hip-Hop',
                      gradient: LinearGradient(colors: [Color(0xFF1c1917), Color(0xFF57534e)])),
                  _GenreCard(emoji: '🎹', name: 'Electronic',
                      gradient: LinearGradient(colors: [Color(0xFF164e63), Color(0xFF06b6d4)])),
                  _GenreCard(emoji: '🌙', name: 'Ambient',
                      gradient: LinearGradient(colors: [Color(0xFF3b0764), Color(0xFF7c3aed)])),
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

class _TrendItem extends StatelessWidget {
  final String icon;
  final LinearGradient gradient;
  final String name;
  final String type;
  const _TrendItem({required this.icon, required this.gradient, required this.name, required this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0x0AFFFFFF))),
      ),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 18))),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.text)),
              Text(type, style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
            ],
          )),
          Text('›', style: GoogleFonts.outfit(fontSize: 18, color: AppColors.text3)),
        ],
      ),
    );
  }
}

class _GenreCard extends StatelessWidget {
  final String emoji;
  final String name;
  final LinearGradient gradient;
  const _GenreCard({required this.emoji, required this.name, required this.gradient});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Text(name,
              style: GoogleFonts.outfit(
                  fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
        ],
      ),
    );
  }
}
