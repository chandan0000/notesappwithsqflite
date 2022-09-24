import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friverpod/dbservices/dbservices.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/todo.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  late TextEditingController _descController;
  late TextEditingController _authController;
  ScrollController controller = ScrollController();
  late NotesDb? notesDb;
  late Future<List<Todo>> futureList;
  @override
  void initState() {
    notesDb = NotesDb();
    _authController = TextEditingController();
    _descController = TextEditingController();
    super.initState();
  }

  Future<List<Todo>> loadData() async {
    // futureList =
    return notesDb!.getUserDetails();
  }

  @override
  void dispose() {
    _descController.dispose();
    _authController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = const BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    final notesData = ref.watch(notesList);
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 40.0,
        borderRadius: radius,
        panel: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Spacer(),
                VxTextField(
                  controller: _descController,
                  maxLine: 2,
                  labelText: 'Enter  your notes',
                  borderType: VxTextFieldBorderType.roundLine,
                ),
                const SizedBox(
                  height: 20,
                ),
                VxTextField(
                  height: 60,
                  controller: _authController,
                  labelText: 'Enter author name',
                  borderType: VxTextFieldBorderType.roundLine,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      String date =
                          DateFormat.yMEd().add_jms().format(DateTime.now());
                      ref.read(
                        notesInsertion(
                          Todo(
                            depscription: _descController.text,
                            authname: _authController.text,
                            time: date,
                          ),
                        ),
                      );
                      await ref.refresh(notesList.future);
                    },
                    child: 'TODO LIST'.text.make()),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      notesDb!.deleteTableContent();
                    },
                    icon: const Icon(Icons.clear),
                    label: 'Clear TOdO List'.text.make(),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        body: Center(
          child: notesData.when(
            data: (data) {
              return RefreshIndicator(
                onRefresh: () async {
                  return await ref.refresh(notesList.future);
                },
                child: ListView.builder(
                  controller: controller,
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Colors
                          .primaries[Random().nextInt(Colors.primaries.length)],
                      child: Column(
                        children: [
                          Text(data[index].depscription),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("${data[index].id}"),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(data[index].time.toString()),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    );
                  }),
                ),
              );
            },
            error: (error, s) {
              return Center(child: Text(error.toString()));
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}

// FutureBuilder<List<Todo>>(
//             initialData: const [],
//             future: loadData(),
//             builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data![0].authname ?? 'no data');
//               }
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             })


