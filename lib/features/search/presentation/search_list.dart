import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:realm/realm.dart';

import '../../home/data/record_repo.dart';
import '../../home/domain/record.dart';

class SearchListWidget extends ConsumerStatefulWidget {
  SearchListWidget({super.key, required this.myList});
  RealmResults<RecordCls> myList;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchListWidgetState();
}

class _SearchListWidgetState extends ConsumerState<SearchListWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.myList.changes,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          log(data!.results.toString());
          return SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: data.results.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 1,
                    child: ListTile(
                      title: Text(data.results[index].name),
                      subtitle: Text(
                          "${DateFormat('MM/dd/yyyy').format(data.results[index].now)} ${data.results[index].time}"),
                      leading: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {});
                          ref
                              .read(recordRepoProvider)
                              .deleteRecord(data.results[index]);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Text("");
        }
      },
    );
  }
}
