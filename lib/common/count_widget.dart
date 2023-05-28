import 'package:father_health/features/home/presentation/home_main.dart';
import 'package:father_health/mystorage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountWidget extends ConsumerWidget {
  const CountWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: recordList.changes,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          final result1 = data.results
              .where(
                (element) => element.name == healths[0],
              )
              .toList();
          final result2 = data.results
              .where(
                (element) => element.name == healths[1],
              )
              .toList();
          final result3 = data.results
              .where(
                (element) => element.name == healths[2],
              )
              .toList();
          final result4 = data.results
              .where(
                (element) => element.name == healths[3],
              )
              .toList();
          final result5 = data.results
              .where(
                (element) => element.name == healths[4],
              )
              .toList();
          final result6 = data.results
              .where(
                (element) => element.name == healths[5],
              )
              .toList();
          final result7 = data.results
              .where(
                (element) => element.name == healths[6],
              )
              .toList();
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Text(healths[0],
                      style: TextStyle(color: Colors.blue.shade800)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${result1.length} ခါ"),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Text(
                    healths[1],
                    style: TextStyle(color: Colors.blue.shade800),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${result2.length} ခါ"),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Text(healths[2],
                      style: TextStyle(color: Colors.blue.shade800)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${result3.length} ခါ"),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Text(healths[3],
                      style: TextStyle(color: Colors.blue.shade800)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${result4.length} ခါ"),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Text(healths[4],
                      style: TextStyle(color: Colors.blue.shade800)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${result5.length} ခါ"),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Text(healths[5],
                      style: TextStyle(color: Colors.blue.shade800)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${result6.length} ခါ"),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Row(
                children: [
                  Text(healths[6],
                      style: TextStyle(color: Colors.blue.shade800)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${result7.length} ခါ"),
                ],
              )
            ],
          );
        } else {
          return const Text("");
        }
      },
    );
  }
}
