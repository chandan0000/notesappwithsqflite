import 'package:flutter/material.dart';
import 'package:friverpod/screens/notes.dart';
import 'package:friverpod/screens/sports.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Tab> myTab = <Tab>[
      const Tab(
        text: "Notes",
      ),
      const Tab(
        text: 'Sports',
      )
    ];

    return DefaultTabController(
      length: myTab.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Welcome'),
          bottom: TabBar(
            tabs: myTab,
          ),
        ),
        body: const TabBarView(
          children: [
            NotesScreen(),
            SportsScreen(),
          ],
        ),
      ),
    );
  }
}
