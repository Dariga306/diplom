import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../../widgets/common_widgets.dart';
import '../player_screen.dart';
import '../weather_screen.dart';
import '../playlist_screen.dart';
import '../extra_screens.dart';
import '../ai_playlist_screen.dart';
import '../artist_screen.dart';
import '../album_screen.dart';
import '../notifications_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
                  colors: [Color(0xE61a063d), Colors.transparent]),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
                  child: Row(children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Good evening, 🌙', style: GoogleFonts.outfit(fontSize: 13, color: AppColors.text2)),
                      const SizedBox(height: 2),
                      RichText(text: TextSpan(
                        style: GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w800, color: AppColors.text),
                        children: [
                          const TextSpan(text: 'Aigerim '),
                          WidgetSpan(child: ShaderMask(
                            shaderCallback: (b) => const LinearGradient(
                              colors: [AppColors.purpleLight, AppColors.pink]).createShader(b),
                            child: Text('✦', style: GoogleFonts.outfit(
                                fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white)))),
                        ],
                      )),
                    ]),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen())),
                      child: const AppIconButton(icon: Icons.notifications_outlined)),
                    const SizedBox(width: 10),
                    Container(width: 40, height: 40,
                      decoration: BoxDecoration(gradient: AppColors.gradMixed, shape: BoxShape.circle,
                          border: Border.all(color: AppColors.border2, width: 2)),
                      child: Center(child: Text('A', style: GoogleFonts.outfit(
                          fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)))),
                  ]),
                ),
              ),
            ),

            // Weather tile — opens WeatherScreen
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WeatherScreen())),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                      colors: [Color(0xFF0d1a3d), Color(0xFF1a1060), Color(0xFF0d2040)]),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.blue.withOpacity(0.25))),
                  child: Row(children: [
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(color: AppColors.blue.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: AppColors.blue.withOpacity(0.25))),
                        child: Text('🌨 Live Weather', style: GoogleFonts.outfit(
                            fontSize: 11, fontWeight: FontWeight.w600, color: const Color(0xFF93c5fd), letterSpacing: 0.05))),
                      const SizedBox(height: 8),
                      Text('−4°', style: GoogleFonts.outfit(fontSize: 36, fontWeight: FontWeight.w800, color: Colors.white, height: 1)),
                      Text('Snow · Astana', style: GoogleFonts.outfit(fontSize: 14, color: const Color(0xFF93c5fd).withOpacity(0.7))),
                      const SizedBox(height: 4),
                      Text('❄️ 28 people listening now', style: GoogleFonts.outfit(fontSize: 12, color: const Color(0xFF93c5fd).withOpacity(0.55))),
                    ])),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(color: AppColors.blue.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.blue.withOpacity(0.3))),
                      child: Text('Play Vibes', style: GoogleFonts.outfit(
                          fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xFF93c5fd)))),
                  ]),
                ),
              ),
            ),

            // Mood tiles
            const SizedBox(height: 20),
            const SectionHeader(title: 'Choose Your Mood', action: 'All →'),
            const SizedBox(height: 12),
            SizedBox(height: 130,
              child: ListView(scrollDirection: Axis.horizontal, padding: const EdgeInsets.only(left: 20),
                children: const [
                  _MoodTile(emoji: '📚', name: 'Study', count: '14 in Astana', gradient: AppColors.gradBlue),
                  _MoodTile(emoji: '🏃', name: 'Sport', count: '31 in Astana',
                      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                          colors: [Color(0xFF7c3d12), Color(0xFFf59e0b)])),
                  _MoodTile(emoji: '🚗', name: 'Drive', count: '22 nearby', gradient: AppColors.gradPurple),
                  _MoodTile(emoji: '😴', name: 'Sleep', count: '8 in city',
                      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight,
                          colors: [Color(0xFF0f172a), Color(0xFF312e81)])),
                  _MoodTile(emoji: '🎉', name: 'Party', count: '46 nearby', gradient: AppColors.gradPink),
                ])),

            // Genres
            const SizedBox(height: 20),
            const SectionHeader(title: 'Genres'),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, padding: const EdgeInsets.only(left: 20),
              child: Row(children: ['Pop', 'Rock', 'K-Pop', 'Hip-Hop', 'Electronic', 'Jazz']
                  .asMap().map((i, g) => MapEntry(i, Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GenrePill(label: g, active: i == 0)))).values.toList())),

            // Daily Mix — opens PlaylistScreen
            const SizedBox(height: 20),
            const SectionHeader(title: 'Your Daily Mix', action: 'See all'),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PlaylistScreen())),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [AppColors.purpleDark.withOpacity(0.15), AppColors.pink.withOpacity(0.1)]),
                    borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.purple.withOpacity(0.2))),
                  child: Row(children: [
                    Container(width: 58, height: 58,
                      decoration: BoxDecoration(gradient: AppColors.gradMixed, borderRadius: BorderRadius.circular(14),
                          boxShadow: [BoxShadow(color: AppColors.purpleDark.withOpacity(0.35), blurRadius: 16)]),
                      child: const Center(child: Text('🎧', style: TextStyle(fontSize: 26)))),
                    const SizedBox(width: 14),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('For You', style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.text)),
                      Text('Based on your week · 32 songs', style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text2)),
                      const SizedBox(height: 8),
                      Row(children: [
                        Expanded(child: Container(height: 3, decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [AppColors.purple, AppColors.pink]),
                          borderRadius: BorderRadius.circular(100)))),
                        const SizedBox(width: 4),
                        Container(width: 60, height: 3, decoration: BoxDecoration(
                            color: AppColors.surface3, borderRadius: BorderRadius.circular(100))),
                      ]),
                    ])),
                    const SizedBox(width: 12),
                    Container(width: 44, height: 44,
                      decoration: BoxDecoration(gradient: AppColors.gradPurple, shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: AppColors.purpleDark.withOpacity(0.4), blurRadius: 14)]),
                      child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 20)),
                  ]),
                ),
              ),
            ),

            // Explore grid
            const SizedBox(height: 20),
            const SectionHeader(title: 'Explore'),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 1.4,
                children: [
                  _ExploreCard('🌍', 'Discover', AppColors.gradBlue, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const DiscoverScreen()))),
                  _ExploreCard('🏙', 'Charts', AppColors.gradPurple, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CityChartsScreen()))),
                  _ExploreCard('📻', 'Radio', AppColors.gradMixed, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RadioScreen()))),
                  _ExploreCard('🎉', 'Party', AppColors.gradPink, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ListeningPartyScreen()))),
                  _ExploreCard('✦', 'AI Mix', AppColors.gradOrange, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AIPlaylistScreen()))),
                  _ExploreCard('🌨', 'Weather', AppColors.gradCyan, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const WeatherScreen()))),
                ],
              ),
            ),

            // Artist & Album
            const SizedBox(height: 20),
            const SectionHeader(title: 'Featured Artist'),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ArtistScreen())),
                child: Container(padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF1a0533), Color(0xFF7c3aed)]),
                    borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Container(width: 60, height: 60,
                      decoration: BoxDecoration(gradient: AppColors.gradMixed, shape: BoxShape.circle,
                          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2)),
                      child: const Center(child: Text('🎸', style: TextStyle(fontSize: 28)))),
                    const SizedBox(width: 14),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('The Neighbourhood', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white)),
                      Text('14.2M monthly listeners', style: GoogleFonts.outfit(fontSize: 12, color: Colors.white.withOpacity(0.6))),
                      const SizedBox(height: 6),
                      Text('View Artist Page →', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.purpleLight)),
                    ])),
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AlbumScreen())),
                child: Container(padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF0f172a), Color(0xFF312e81)]),
                    borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Container(width: 60, height: 60,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [Color(0xFF1a0533), Color(0xFF7c3aed)]),
                        borderRadius: BorderRadius.circular(14)),
                      child: const Center(child: Text('🌧', style: TextStyle(fontSize: 28)))),
                    const SizedBox(width: 14),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('I Love You.', style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white)),
                      Text('The Neighbourhood · 2013', style: GoogleFonts.outfit(fontSize: 12, color: Colors.white.withOpacity(0.6))),
                      const SizedBox(height: 6),
                      Text('View Album →', style: GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.purpleLight)),
                    ])),
                  ]),
                ),
              ),
            ),

            // Top in Astana
            const SizedBox(height: 20),
            SectionHeader(title: 'Top in Astana', action: 'Chart →',
                onAction: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CityChartsScreen()))),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PlayerScreen())),
                  child: _TopItem(rank: '1', rankColor: const Color(0xFFf59e0b), emoji: '🎸',
                      gradient: AppColors.gradMixed, title: 'Sweater Weather', artist: 'The Neighbourhood', isHot: true)),
                _TopItem(rank: '2', rankColor: const Color(0xFF94a3b8), emoji: '🌊',
                    gradient: AppColors.gradBlue, title: 'Midnight Rain', artist: 'Taylor Swift', duration: '3:42'),
                _TopItem(rank: '3', rankColor: const Color(0xFFc2774a), emoji: '🎹',
                    gradient: AppColors.gradTeal, title: 'Snowfall', artist: 'NIKI', duration: '3:18'),
              ]),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _ExploreCard extends StatelessWidget {
  final String emoji, label;
  final LinearGradient gradient;
  final VoidCallback onTap;
  const _ExploreCard(this.emoji, this.label, this.gradient, this.onTap);
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(16)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.outfit(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)),
      ])));
}

class _MoodTile extends StatelessWidget {
  final String emoji, name, count;
  final LinearGradient gradient;
  const _MoodTile({required this.emoji, required this.name, required this.count, required this.gradient});
  @override
  Widget build(BuildContext context) => Container(
    width: 120, margin: const EdgeInsets.only(right: 12), padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(20)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(emoji, style: const TextStyle(fontSize: 30)),
      const Spacer(),
      Text(name, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white)),
      const SizedBox(height: 2),
      Text(count, style: GoogleFonts.outfit(fontSize: 11, color: Colors.white.withOpacity(0.65))),
    ]));
}

class _TopItem extends StatelessWidget {
  final String rank, emoji, title, artist;
  final Color rankColor;
  final LinearGradient gradient;
  final String? duration;
  final bool isHot;
  const _TopItem({required this.rank, required this.rankColor, required this.emoji,
      required this.gradient, required this.title, required this.artist, this.duration, this.isHot = false});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0x0AFFFFFF)))),
    child: Row(children: [
      SizedBox(width: 22, child: Text(rank, textAlign: TextAlign.center,
          style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w700, color: rankColor))),
      const SizedBox(width: 14),
      Container(width: 48, height: 48,
        decoration: BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(12)),
        child: Center(child: Text(emoji, style: const TextStyle(fontSize: 22)))),
      const SizedBox(width: 14),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.text)),
        Text(artist, style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text2)),
      ])),
      if (isHot) Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(color: AppColors.pink.withOpacity(0.15),
            borderRadius: BorderRadius.circular(100), border: Border.all(color: AppColors.pink.withOpacity(0.25))),
        child: Text('HOT', style: GoogleFonts.outfit(fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.pink, letterSpacing: 0.05)))
      else if (duration != null)
        Text(duration!, style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
    ]));
}