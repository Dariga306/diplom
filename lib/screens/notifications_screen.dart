import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _filter = 0;
  final _filters = ['All', 'Matches', 'Friends', 'Music', 'System'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Notifications', style: GoogleFonts.outfit(
                      fontSize: 26, fontWeight: FontWeight.w800,
                      color: AppColors.text, letterSpacing: -0.02 * 26)),
                  Text('Mark all read', style: GoogleFonts.outfit(
                      fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.purpleLight)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Filter pills
            SizedBox(
              height: 36,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemCount: _filters.length,
                itemBuilder: (_, i) => GestureDetector(
                  onTap: () => setState(() => _filter = i),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    decoration: BoxDecoration(
                      gradient: _filter == i ? AppColors.gradPurple : null,
                      color: _filter == i ? null : AppColors.glass,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: _filter == i ? AppColors.purple : AppColors.border),
                    ),
                    child: Text(_filters[i], style: GoogleFonts.outfit(
                        fontSize: 13, fontWeight: FontWeight.w600,
                        color: _filter == i ? Colors.white : AppColors.text2)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _GroupLabel('Today'),
                    _NotifItem(
                      letter: 'D', gradient: AppColors.gradMixed,
                      badgeIcon: '♥', badgeColor: AppColors.pink, unread: true,
                      text: 'Daniyar liked your playlist ',
                      highlight: 'Winter Nights',
                      trackEmoji: '❄️',
                      trackGradient: const LinearGradient(colors: [Color(0xFF1a0533), Color(0xFF7c3aed)]),
                      trackName: 'Winter Nights', trackSub: '18 songs · Collab',
                      time: '2 min ago',
                    ),
                    _NotifItem(
                      letter: '✦', gradient: AppColors.gradPink,
                      badgeIcon: '🎵', badgeColor: AppColors.purple, unread: true,
                      text: '92% match found — meet ',
                      highlight: 'Arman from Almaty',
                      textSuffix: ' who also loves The Neighbourhood',
                      time: '18 min ago',
                    ),
                    _NotifItem(
                      letter: 'M',
                      gradient: const LinearGradient(colors: [Color(0xFF1e3a8a), Color(0xFF3b82f6)]),
                      badgeIcon: '💬', badgeColor: AppColors.blue, unread: true,
                      text: 'Madi sent you a track in chat',
                      trackEmoji: '🌙',
                      trackGradient: const LinearGradient(colors: [Color(0xFF0f172a), Color(0xFF312e81)]),
                      trackName: 'Somebody Else', trackSub: 'The 1975',
                      time: '34 min ago',
                    ),
                    _GroupLabel('Yesterday'),
                    _NotifItem(
                      letter: '🎵',
                      gradient: const LinearGradient(colors: [Color(0xFF065f46), Color(0xFF10b981)]),
                      badgeIcon: '★', badgeColor: const Color(0xFF22c55e),
                      text: 'Sweater Weather hit 100 plays — it\'s your #1 song this month!',
                      time: 'Yesterday · 9:14 PM',
                    ),
                    _FriendRequestNotif(),
                    _NotifItem(
                      letter: '🌨',
                      gradient: const LinearGradient(colors: [Color(0xFF4c1d95), Color(0xFF7c3aed)]),
                      badgeIcon: '☁', badgeColor: AppColors.cyan,
                      text: 'It\'s snowing in Astana right now — ',
                      highlight: '28 people',
                      textSuffix: ' are listening to Snow Day playlist',
                      time: 'Yesterday · 1:05 PM',
                    ),
                    const SizedBox(height: 16),
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

class _GroupLabel extends StatelessWidget {
  final String label;
  const _GroupLabel(this.label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
      child: Text(label.toUpperCase(), style: GoogleFonts.outfit(
          fontSize: 12, fontWeight: FontWeight.w700,
          color: AppColors.text3, letterSpacing: 0.1)),
    );
  }
}

class _NotifItem extends StatelessWidget {
  final String letter, text, time;
  final LinearGradient gradient;
  final String badgeIcon;
  final Color badgeColor;
  final bool unread;
  final String? highlight, textSuffix;
  final String? trackEmoji, trackName, trackSub;
  final LinearGradient? trackGradient;

  const _NotifItem({
    required this.letter, required this.gradient, required this.badgeIcon,
    required this.badgeColor, required this.text, required this.time,
    this.unread = false, this.highlight, this.textSuffix,
    this.trackEmoji, this.trackName, this.trackSub, this.trackGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      color: unread ? AppColors.purple.withOpacity(0.04) : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (unread)
            Padding(padding: const EdgeInsets.only(top: 6, right: 6),
              child: Container(width: 6, height: 6, decoration: const BoxDecoration(
                  color: AppColors.purple, shape: BoxShape.circle))),
          Stack(children: [
            Container(width: 46, height: 46, decoration: BoxDecoration(gradient: gradient, shape: BoxShape.circle),
              child: Center(child: Text(letter, style: GoogleFonts.outfit(
                  fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)))),
            Positioned(bottom: -2, right: -2,
              child: Container(width: 20, height: 20,
                decoration: BoxDecoration(color: badgeColor, shape: BoxShape.circle,
                    border: Border.all(color: AppColors.bg, width: 2)),
                child: Center(child: Text(badgeIcon, style: const TextStyle(fontSize: 9))))),
          ]),
          const SizedBox(width: 14),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RichText(text: TextSpan(
              style: GoogleFonts.outfit(fontSize: 14, height: 1.5, color: AppColors.text),
              children: [
                TextSpan(text: text),
                if (highlight != null) TextSpan(text: highlight,
                    style: GoogleFonts.outfit(color: AppColors.purpleLight, fontWeight: FontWeight.w600)),
                if (textSuffix != null) TextSpan(text: textSuffix),
              ],
            )),
            if (trackName != null) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(12)),
                child: Row(children: [
                  Container(width: 36, height: 36,
                    decoration: BoxDecoration(gradient: trackGradient, borderRadius: BorderRadius.circular(8)),
                    child: Center(child: Text(trackEmoji!, style: const TextStyle(fontSize: 16)))),
                  const SizedBox(width: 10),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(trackName!, style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.text)),
                    Text(trackSub!, style: GoogleFonts.outfit(fontSize: 11, color: AppColors.text2)),
                  ]),
                ]),
              ),
            ],
            const SizedBox(height: 4),
            Text(time, style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
          ])),
        ],
      ),
    );
  }
}

class _FriendRequestNotif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(children: [
          Container(width: 46, height: 46,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF92400e), Color(0xFFf59e0b)]),
              shape: BoxShape.circle),
            child: Center(child: Text('A', style: GoogleFonts.outfit(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)))),
          Positioned(bottom: -2, right: -2,
            child: Container(width: 20, height: 20,
              decoration: BoxDecoration(color: const Color(0xFFf59e0b), shape: BoxShape.circle,
                  border: Border.all(color: AppColors.bg, width: 2)),
              child: const Center(child: Text('+', style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold))))),
        ]),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Aizat added you as a friend',
              style: GoogleFonts.outfit(fontSize: 14, height: 1.5, color: AppColors.text)),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(gradient: AppColors.gradPurple, borderRadius: BorderRadius.circular(10)),
              child: Text('Accept', textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white)))),
            const SizedBox(width: 8),
            Expanded(child: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(color: AppColors.glass, borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.border)),
              child: Text('Decline', textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.text)))),
          ]),
          const SizedBox(height: 4),
          Text('Yesterday · 3:42 PM', style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
        ])),
      ]),
    );
  }
}
