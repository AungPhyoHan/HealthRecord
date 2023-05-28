import 'package:father_health/features/home/presentation/home_main.dart';
import 'package:father_health/mystorage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../mystorage/provider.dart';

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
                (element) => element.nameMm == healths_my[0],
              )
              .toList();
          final result2 = data.results
              .where(
                (element) => element.nameMm == healths_my[1],
              )
              .toList();
          final result3 = data.results
              .where(
                (element) => element.nameMm == healths_my[2],
              )
              .toList();
          final result4 = data.results
              .where(
                (element) => element.nameMm == healths_my[3],
              )
              .toList();
          final result5 = data.results
              .where(
                (element) => element.nameMm == healths_my[4],
              )
              .toList();
          final result6 = data.results
              .where(
                (element) => element.nameMm == healths_my[5],
              )
              .toList();
          final result7 = data.results
              .where(
                (element) => element.nameMm == healths_my[6],
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
                  Text(
                      ref.watch(isLanguageProvider)
                          ? healths_my[0]
                          : healths_en[0],
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
                    ref.watch(isLanguageProvider)
                        ? healths_my[1]
                        : healths_en[1],
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
                  Text(
                      ref.watch(isLanguageProvider)
                          ? healths_my[2]
                          : healths_en[2],
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
                  Text(
                      ref.watch(isLanguageProvider)
                          ? healths_my[3]
                          : healths_en[3],
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
                  Text(
                      ref.watch(isLanguageProvider)
                          ? healths_my[4]
                          : healths_en[4],
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
                  Text(
                      ref.watch(isLanguageProvider)
                          ? healths_my[5]
                          : healths_en[5],
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
                  Text(
                      ref.watch(isLanguageProvider)
                          ? healths_my[6]
                          : healths_en[6],
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
