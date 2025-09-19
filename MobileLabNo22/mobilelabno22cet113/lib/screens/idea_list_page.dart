import 'package:flutter/material.dart';
import '../models/music_idea.dart';
import 'add_idea_form.dart';

class IdeaListPage extends StatefulWidget {
  const IdeaListPage({super.key});

  @override
  State<IdeaListPage> createState() => _IdeaListPageState();
}

class _IdeaListPageState extends State<IdeaListPage> {
  final List<MusicIdea> musicIdeas = [
    MusicIdea(title: "จะมอบความรัก", artist: "YEW", notes: "E, A, ,C#m, B, F#m, G#m, E7, F#", instrument: Instrument.guitar, keySignature: "E Major"),
    MusicIdea(title: "Never Gonna Give You Up", artist: "Rick Astley", notes: "G, C, D, Em", instrument: Instrument.piano, keySignature: "G Major"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChordPad"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: musicIdeas.length,
        itemBuilder: (context, index) {
          final idea = musicIdeas[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: Icon(idea.instrument.icon, color: Theme.of(context).primaryColor, size: 40),
              title: Text(idea.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(
                  "ศิลปิน: ${idea.artist.isNotEmpty ? idea.artist : '-'}\nคอร์ด: ${idea.notes}\nคีย์: ${idea.keySignature}"),
              isThreeLine: true,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final newIdea = await Navigator.push<MusicIdea>(
            context,
            MaterialPageRoute(builder: (context) => const AddIdeaForm()),
          );
          if (newIdea != null) {
            setState(() {
              musicIdeas.add(newIdea);
            });
          }
        },
      ),
    );
  }
}