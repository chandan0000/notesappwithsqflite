import 'package:flutter/material.dart';
import 'package:friverpod/dbservices/dbservices.dart';
import 'package:friverpod/models/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SportsScreen extends HookConsumerWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NotesDb notes = NotesDb();
    Future<List<Todo>> getData() async {
      return await notes.getUserDetails();
    }

    return Scaffold(
        body: RefreshIndicator(
      onRefresh: (() => getData()),
      child: const Text('dat'),
    ));
  }
}
