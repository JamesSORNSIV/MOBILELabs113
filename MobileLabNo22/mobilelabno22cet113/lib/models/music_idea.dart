import 'package:flutter/material.dart';

enum Instrument {
  guitar(name: "กีตาร์", icon: Icons.music_note),
  piano(name: "เปียโน", icon: Icons.piano),
  vocals(name: "เสียงร้อง", icon: Icons.mic),
  other(name: "อื่นๆ", icon: Icons.more_horiz);

  const Instrument({required this.name, required this.icon});
  final String name;
  final IconData icon;
}

class MusicIdea {
  final String title;
  final String artist;
  final String notes;
  final Instrument instrument;
  final String keySignature;

  MusicIdea({
    required this.title,
    required this.artist,
    required this.notes,
    required this.instrument,
    required this.keySignature,
  });
}