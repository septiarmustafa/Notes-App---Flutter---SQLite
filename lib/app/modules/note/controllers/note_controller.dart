import 'package:get/get.dart';
import 'package:notes_app/app/data/model/database_helper.dart';
import 'package:notes_app/app/data/model/note.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

  void loadNotes() async {
    final data = await DatabaseHelper().getNotes();
    notes.assignAll(data);
  }

  void addNote(Note note) async {
    await DatabaseHelper().insertNote(note);
    loadNotes();
  }

  void updateNote(Note note) async {
    await DatabaseHelper().updateNote(note);
    loadNotes();
  }

  void deleteNote(int id) async {
    await DatabaseHelper().deleteNote(id);
    loadNotes();
  }
}
