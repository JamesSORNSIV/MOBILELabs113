import 'package:flutter/material.dart';
import '../models/music_idea.dart';

class AddIdeaForm extends StatefulWidget {
  const AddIdeaForm({super.key});

  @override
  State<AddIdeaForm> createState() => _AddIdeaFormState();
}

class _AddIdeaFormState extends State<AddIdeaForm> {
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _artist = '';
  String _notes = '';
  Instrument _instrument = Instrument.guitar;
  String _keySignature = 'C Major';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มเพลงใหม่"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'ชื่อเพลง', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'กรุณาใส่ชื่อเพลง' : null,
                onSaved: (value) => _title = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'ชื่อศิลปิน (ถ้ามี)', border: OutlineInputBorder()),
                onSaved: (value) => _artist = value ?? '',
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'คอร์ด / โน้ต', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'กรุณาใส่คอร์ดหรือโน้ต' : null,
                onSaved: (value) => _notes = value!,
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'คีย์เพลง (เช่น C Major)', border: OutlineInputBorder()),
                initialValue: 'C Major',
                validator: (value) => value!.isEmpty ? 'กรุณาใส่คีย์เพลง' : null,
                onSaved: (value) => _keySignature = value!,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<Instrument>(
                value: _instrument,
                decoration: const InputDecoration(labelText: 'เครื่องดนตรีหลัก', border: OutlineInputBorder()),
                items: Instrument.values.map((instrument) {
                  return DropdownMenuItem(
                    value: instrument,
                    child: Row(
                      children: [
                        Icon(instrument.icon),
                        const SizedBox(width: 10),
                        Text(instrument.name),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _instrument = value!),
              ),
              const SizedBox(height: 30),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newIdea = MusicIdea(
                      title: _title,
                      artist: _artist,
                      notes: _notes,
                      instrument: _instrument,
                      keySignature: _keySignature,
                    );
                    Navigator.pop(context, newIdea);
                  }
                },
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text("บันทึก"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}