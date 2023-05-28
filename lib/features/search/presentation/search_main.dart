import 'package:father_health/common/custom_dropdown.dart';
import 'package:father_health/features/home/presentation/home_main.dart';
import 'package:father_health/features/search/presentation/search_list.dart';
import 'package:father_health/mystorage/provider.dart';
import 'package:father_health/mystorage/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

import '../../home/domain/record.dart';

class SearchMainWidget extends ConsumerStatefulWidget {
  const SearchMainWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchMainWidgetState();
}

class _SearchMainWidgetState extends ConsumerState<SearchMainWidget> {
  Health _selected = Health.all;
  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();
  String? rdoValue;
  List<String> searchHeaths = ["All"];
  RealmResults<RecordCls>? myList;

  @override
  void initState() {
    super.initState();
    ref.read(isLanguageProvider)
        ? searchHeaths.addAll(healths_my)
        : searchHeaths.addAll(healths_en);
    rdoValue = searchHeaths[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(" Search")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 190,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 45),
                itemCount: searchHeaths.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Radio(
                        value: Health.values[index],
                        groupValue: _selected,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {});
                          _selected = value!;
                          rdoValue = searchHeaths[index];
                        }),
                    title: Text(
                      searchHeaths[index],
                      style: const TextStyle(fontSize: 15),
                    ),
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: CustomDropDownWidget(
                  controller: dayController,
                  sugguestionsCallback: (value) {
                    final data = recordList
                        .map((element) => element.day)
                        .toSet()
                        .toList();

                    data.retainWhere((element) =>
                        element.toLowerCase().contains(value.toLowerCase()));
                    return data;
                  },
                  hintText: ref.read(isLanguageProvider)
                      ? "ရက်နဲ့ရှာမည်"
                      : "Find By Day",
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: CustomDropDownWidget(
                  controller: monthController,
                  sugguestionsCallback: (value) {
                    final data = recordList
                        .map((element) => element.month)
                        .toSet()
                        .toList();

                    data.retainWhere((element) =>
                        element.toLowerCase().contains(value.toLowerCase()));
                    return data;
                  },
                  hintText: ref.read(isLanguageProvider)
                      ? "လနဲ့ရှာမည်"
                      : "Find By Month",
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: CustomDropDownWidget(
                  controller: yearController,
                  sugguestionsCallback: (value) {
                    final data = recordList
                        .map((element) => element.year)
                        .toSet()
                        .toList();

                    data.retainWhere((element) =>
                        element.toLowerCase().contains(value.toLowerCase()));
                    return data;
                  },
                  hintText: ref.read(isLanguageProvider)
                      ? "နှစ်နဲ့ရှာမည်"
                      : "Find By Year",
                )),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      myList = null;
                      myList = getList(
                          [dayController, monthController, yearController]);
                      dayController.text = "";
                      monthController.text = "";
                      yearController.text = "";
                    },
                    child: const Text("Search")),
              ),
            ),
            myList != null
                ? Expanded(
                    child: SearchListWidget(
                    myList: myList!,
                  ))
                : const Text("")
          ],
        ),
      ),
    );
  }

  RealmResults<RecordCls>? getList(List<TextEditingController> controller) {
    RealmResults<RecordCls>? alist;
    for (int i = 0; i < searchHeaths.length; i++) {
      if (rdoValue == "All") {
        alist = recordList;
      } else {
        if (rdoValue == searchHeaths[i]) {
          alist = checkQuery(rdoValue!, controller);
        }
      }
    }
    return alist;
  }

  RealmResults<RecordCls>? checkQuery(
      String rdoValue, List<TextEditingController> controller) {
    if (ref.read(isLanguageProvider)) {
      if (controller[0].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameMm == $0 and day == $1 SORT(time DESC)",
            [rdoValue, controller[0].text]);
      } else if (controller[1].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameMm == $0 and month == $1 SORT(time DESC)",
            [rdoValue, controller[1].text]);
      } else if (controller[2].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameMm == $0 and year == $1 SORT(time DESC)",
            [rdoValue, controller[2].text]);
      } else if (controller[0].text.isNotEmpty &&
          controller[1].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameMm == $0 and day == $1 and month == $2 SORT(time DESC)",
            [rdoValue, controller[0].text, controller[1].text]);
      } else if (controller[0].text.isNotEmpty &&
          controller[2].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameMm == $0 and day == $1 and year == $2 SORT(time DESC)",
            [rdoValue, controller[0].text, controller[2].text]);
      } else if (controller[1].text.isNotEmpty &&
          controller[2].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameMm == $0 and month == $1 and year == $2 SORT(time DESC)",
            [rdoValue, controller[0].text, controller[2].text]);
      } else if (controller[0].text.isNotEmpty &&
          controller[1].text.isNotEmpty &&
          controller[2].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameMm == $0 and day == $1 and month == $2 and year == $3 SORT(time DESC)",
            [
              rdoValue,
              controller[0].text,
              controller[1].text,
              controller[2].text
            ]);
      } else {
        return recordList.realm
            .query<RecordCls>(r" name == $0 SORT(time DESC)", [
          rdoValue,
        ]);
      }
    } else {
      if (controller[0].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameEn == $0 and day == $1 SORT(time DESC)",
            [rdoValue, controller[0].text]);
      } else if (controller[1].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameEn == $0 and month == $1 SORT(time DESC)",
            [rdoValue, controller[1].text]);
      } else if (controller[2].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameEn == $0 and year == $1 SORT(time DESC)",
            [rdoValue, controller[2].text]);
      } else if (controller[0].text.isNotEmpty &&
          controller[1].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameEn == $0 and day == $1 and month == $2 SORT(time DESC)",
            [rdoValue, controller[0].text, controller[1].text]);
      } else if (controller[0].text.isNotEmpty &&
          controller[2].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameEn == $0 and day == $1 and year == $2 SORT(time DESC)",
            [rdoValue, controller[0].text, controller[2].text]);
      } else if (controller[1].text.isNotEmpty &&
          controller[2].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameEn == $0 and month == $1 and year == $2 SORT(time DESC)",
            [rdoValue, controller[0].text, controller[2].text]);
      } else if (controller[0].text.isNotEmpty &&
          controller[1].text.isNotEmpty &&
          controller[2].text.isNotEmpty) {
        return recordList.realm.query<RecordCls>(
            r" nameEn == $0 and day == $1 and month == $2 and year == $3 SORT(time DESC)",
            [
              rdoValue,
              controller[0].text,
              controller[1].text,
              controller[2].text
            ]);
      } else {
        return recordList.realm
            .query<RecordCls>(r" name == $0 SORT(time DESC)", [
          rdoValue,
        ]);
      }
    }
  }
}

enum Health {
  all,
  pee,
  excrement,
  medicine,
  eating,
  measuringPressure,
  measuringTemperature,
  drinkingWater
}
