import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'equalizer_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _crossfade = true;
  bool _location = true;
  bool _weather = true;
  bool _activity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Text('Settings', style: GoogleFonts.outfit(
                    fontSize: 26, fontWeight: FontWeight.w800,
                    color: AppColors.text, letterSpacing: -0.02 * 26)),
              ),
              // User card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.purpleDark.withOpacity(0.1),
                      AppColors.pink.withOpacity(0.07),
                    ]),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.purple.withOpacity(0.2)),
                  ),
                  child: Row(children: [
                    Container(width: 56, height: 56,
                      decoration: BoxDecoration(gradient: AppColors.gradMixed, shape: BoxShape.circle),
                      child: Center(child: Text('A', style: GoogleFonts.outfit(
                          fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white)))),
                    const SizedBox(width: 14),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('Aigerim Bekova', style: GoogleFonts.outfit(
                          fontSize: 16, fontWeight: FontWeight.w800, color: AppColors.text)),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            AppColors.purpleDark.withOpacity(0.25),
                            AppColors.pink.withOpacity(0.2),
                          ]),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          const Icon(Icons.star_rounded, size: 10, color: AppColors.purpleLight),
                          const SizedBox(width: 4),
                          Text('MoodWave Pro', style: GoogleFonts.outfit(
                              fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.purpleLight)),
                        ]),
                      ),
                    ])),
                    const Icon(Icons.chevron_right_rounded, color: AppColors.text3),
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              _SettingsGroup(label: 'Account', children: [
                _SettingRow(emoji: '👤', bg: AppColors.purple.withOpacity(0.15),
                    name: 'Edit Profile', sub: 'Photo, name, username'),
                _SettingRow(emoji: '🔔', bg: AppColors.blue.withOpacity(0.15),
                    name: 'Notifications', sub: 'Matches, friends, music'),
                _SettingRow(emoji: '🔒', bg: const Color(0xFF22c55e).withOpacity(0.15),
                    name: 'Privacy', sub: 'Who can see your activity'),
              ]),
              _SettingsGroup(label: 'Playback', children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const EqualizerScreen())),
                  child: _SettingRow(emoji: '🎚', bg: AppColors.purple.withOpacity(0.15),
                      name: 'Equalizer', sub: 'Custom EQ · Bass Boost on',
                      trailing: Row(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.purple.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: AppColors.purple.withOpacity(0.2)),
                          ),
                          child: Text('Custom', style: GoogleFonts.outfit(
                              fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.purpleLight)),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.chevron_right_rounded, color: AppColors.text3, size: 16),
                      ])),
                ),
                _SettingRow(emoji: '📶', bg: AppColors.cyan.withOpacity(0.15),
                    name: 'Streaming Quality', sub: '320 kbps · High',
                    trailing: Row(children: [
                      Text('High', style: GoogleFonts.outfit(fontSize: 13, color: AppColors.text3)),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right_rounded, color: AppColors.text3, size: 16),
                    ])),
                _SettingRow(emoji: '📥', bg: const Color(0xFFf59e0b).withOpacity(0.15),
                    name: 'Download Quality',
                    trailing: Row(children: [
                      Text('Very High', style: GoogleFonts.outfit(fontSize: 13, color: AppColors.text3)),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right_rounded, color: AppColors.text3, size: 16),
                    ])),
                _SettingRow(emoji: '🔀', bg: AppColors.pink.withOpacity(0.15),
                    name: 'Crossfade', sub: 'Between songs',
                    trailing: _Toggle(value: _crossfade, onChanged: (v) => setState(() => _crossfade = v))),
              ]),
              _SettingsGroup(label: 'Discovery', children: [
                _SettingRow(emoji: '📍', bg: AppColors.purple.withOpacity(0.15),
                    name: 'Location for Matching', sub: 'Astana, KZ',
                    trailing: _Toggle(value: _location, onChanged: (v) => setState(() => _location = v))),
                _SettingRow(emoji: '☁️', bg: AppColors.blue.withOpacity(0.15),
                    name: 'Weather Integration',
                    trailing: _Toggle(value: _weather, onChanged: (v) => setState(() => _weather = v))),
                _SettingRow(emoji: '👁', bg: const Color(0xFF22c55e).withOpacity(0.15),
                    name: 'Show My Activity', sub: 'Friends can see what you play',
                    trailing: _Toggle(value: _activity, onChanged: (v) => setState(() => _activity = v))),
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
                child: Container(
                  width: double.infinity, padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFef4444).withOpacity(0.08),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFef4444).withOpacity(0.2)),
                  ),
                  child: Text('Sign Out', textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w700,
                          color: const Color(0xFFef4444))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  final String label;
  final List<Widget> children;
  const _SettingsGroup({required this.label, required this.children});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label.toUpperCase(), style: GoogleFonts.outfit(
            fontSize: 11, fontWeight: FontWeight.w700,
            color: AppColors.text3, letterSpacing: 0.1)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              color: AppColors.surface, borderRadius: BorderRadius.circular(18)),
          child: Column(children: children),
        ),
        const SizedBox(height: 8),
      ]),
    );
  }
}

class _SettingRow extends StatelessWidget {
  final String emoji, name;
  final Color bg;
  final String? sub;
  final Widget? trailing;
  const _SettingRow({required this.emoji, required this.bg, required this.name, this.sub, this.trailing});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0x0AFFFFFF)))),
      child: Row(children: [
        Container(width: 36, height: 36,
          decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text(emoji, style: const TextStyle(fontSize: 17)))),
        const SizedBox(width: 14),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: GoogleFonts.outfit(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.text)),
          if (sub != null) Text(sub!, style: GoogleFonts.outfit(fontSize: 12, color: AppColors.text3)),
        ])),
        trailing ?? const Icon(Icons.chevron_right_rounded, color: AppColors.text3, size: 16),
      ]),
    );
  }
}

class _Toggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const _Toggle({required this.value, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 44, height: 26,
        decoration: BoxDecoration(
          gradient: value ? const LinearGradient(colors: [AppColors.purpleDark, AppColors.purple]) : null,
          color: value ? null : AppColors.surface3,
          borderRadius: BorderRadius.circular(100),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(3),
            width: 20, height: 20,
            decoration: BoxDecoration(
              color: Colors.white, shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4)],
            ),
          ),
        ),
      ),
    );
  }
}
