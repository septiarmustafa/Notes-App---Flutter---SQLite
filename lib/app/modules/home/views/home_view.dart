import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/app/modules/note/controllers/note_controller.dart';
import 'package:notes_app/app/modules/note/views/note_view.dart';

class HomeView extends StatelessWidget {
  final NoteController controller = Get.put(NoteController());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 131),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 8),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      note.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(note.content),
                  ),
                  onTap: () => Get.to(() => NoteView(note: note)),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () => controller.deleteNote(note.id!),
                  ),
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 0, 131),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Get.to(() => NoteView(note: null)),
      ),
    );
  }
}
