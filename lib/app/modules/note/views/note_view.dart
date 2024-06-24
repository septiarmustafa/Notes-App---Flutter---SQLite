import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/app/data/model/note.dart';
import 'package:notes_app/app/modules/note/controllers/note_controller.dart';

class NoteView extends StatelessWidget {
  final NoteController controller = Get.find();
  final Note? note;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  NoteView({Key? key, this.note}) : super(key: key) {
    if (note != null) {
      titleController.text = note!.title;
      contentController.text = note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 131),
        title: Text(
          note == null ? 'Add Note' : 'Edit Note',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    labelText: 'Title',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: contentController,
                  maxLines: 10,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Content",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Color.fromARGB(255, 0, 0, 131))),
              onPressed: () {
                if (note == null) {
                  controller.addNote(
                    Note(
                      title: titleController.text,
                      content: contentController.text,
                    ),
                  );
                } else {
                  controller.updateNote(
                    Note(
                      id: note!.id,
                      title: titleController.text,
                      content: contentController.text,
                    ),
                  );
                }
                Get.back();
              },
              child: Text(
                note == null ? 'Add' : 'Update',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
