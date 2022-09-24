import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friverpod/dbservices/dbservices.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../models/todo.dart';

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  late NotesDb? notesDb;
  late Future<List<Todo>> futureList;
  @override
  void initState() {
    notesDb = NotesDb();
    super.initState();
  }

  Future<List<Todo>> loadData() async {
    // futureList =
    return notesDb!.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final notesData = ref.watch(notesList);
    return Scaffold(
      body: SlidingUpPanel(
        panel: const Center(
          child: Text("This is the sliding Widget"),
        ),
        body: Center(
          child: notesData.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return Card(
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
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          log(DateFormat.yMEd().add_jms().format(DateTime.now()));
          // ref.read(
          //   notesInsertion(
          //     Todo(
          //         depscription: 'today notes',
          //         authname: 'chandan',
          //         time: DateTime.now().toString()),
          //   ),
          // );

          log('sucess');
        }),
        child: const Text('data'),
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
