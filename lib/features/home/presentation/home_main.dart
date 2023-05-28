import 'dart:developer';

import 'package:father_health/common/count_widget.dart';
import 'package:father_health/common/page_route.dart';
import 'package:father_health/features/search/presentation/search_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

import '../../../mystorage/storage.dart';
import '../data/record_repo.dart';

final GlobalKey<FormState> _myKey = GlobalKey<FormState>();
List<String> healths = [
  "ဆီး",
  "ဝမ်း",
  "ဆေးသောက်",
  "အစာစား",
  "pressure တိုင်း",
  "အပူချိန်တိုင်း",
  "ရေသောက်"
];

class HomeMainWidget extends ConsumerStatefulWidget {
  const HomeMainWidget({super.key});

  @override
  ConsumerState<HomeMainWidget> createState() => _HomeMainWidgetState();
}

class _HomeMainWidgetState extends ConsumerState<HomeMainWidget> {
  final recordController = TextEditingController();
  int? num;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => pageRouteNormal(context, const SearchMainWidget()),
          ),
          title: const Text(" Health Records"),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          thickness: 7,
          interactive: true,
          radius: const Radius.circular(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50, top: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      key: _myKey,
                      child: Column(children: [
                        TypeAheadFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'အကြောင်းအရာ တစ်ခုခု ရွေးပေးပါ';
                              }
                              return null;
                            },
                            suggestionsBoxDecoration:
                                const SuggestionsBoxDecoration(
                                    color: Colors.grey),
                            textFieldConfiguration: TextFieldConfiguration(
                                controller: recordController,
                                keyboardType: TextInputType.none,
                                decoration: const InputDecoration(
                                    hintText: "Record Type"),
                                onTap: () => recordController.clear()),
                            suggestionsCallback: (value) {
                              List<String> result = [];

                              result.addAll(healths);

                              result.retainWhere((element) => element
                                  .toLowerCase()
                                  .contains(value.toLowerCase()));
                              return result;
                            },
                            itemBuilder: (context, itemData) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 0.5),
                                child: ListTile(
                                  tileColor: Colors.white,
                                  hoverColor: Colors.white,
                                  selectedColor: Colors.white,
                                  title: Text(
                                    itemData,
                                    style: const TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                ),
                              );
                            },
                            onSuggestionSelected: (value) {
                              setState(() {});
                              recordController.text = value;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                  if (_myKey.currentState!.validate()) {
                                    ref
                                        .read(recordRepoProvider)
                                        .addRecord(recordController.text);
                                    recordController.clear();
                                  }
                                },
                                child: const Text("Record")))
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Scrollbar(
                      thumbVisibility: true,
                      thickness: 1,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: CountWidget()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 500,
                      child: StreamBuilder(
                        stream: recordList.changes,
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
                                    padding: const EdgeInsets.all(1.0),
                                    child: Card(
                                      elevation: 1,
                                      child: ListTile(
                                        title: Text(data.results[index].name),
                                        subtitle: Text(
                                            "${DateFormat('MM/dd/yyyy').format(data.results[index].now)} ${data.results[index].time}"),
                                        leading: IconButton(
                                          icon: const Icon(
                                            Icons.delete_forever_sharp,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            setState(() {});
                                            ref
                                                .read(recordRepoProvider)
                                                .deleteRecord(
                                                    data.results[index]);
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    )
                  ]),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 28.0, right: 28),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade800),
              onPressed: () => ref.read(recordRepoProvider).deleteAll(),
              child: const Text(" delete all records "),
            ),
          ),
        ),
      ),
    );
  }
}
