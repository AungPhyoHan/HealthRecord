import 'package:father_health/features/home/domain/record.dart';
import 'package:father_health/mystorage/storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:realm/realm.dart';

class RecordRepo {
  void addRecord(String nameEn, String nameMm) {
    recordList.realm.write(() {
      recordList.realm.add(RecordCls(
          ObjectId(),
          nameEn,
          nameMm,
          DateFormat.jm().format(DateTime.now()),
          DateTime.now(),
          DateTime.now().day.toString(),
          DateFormat('MMMM').format(DateTime.now()),
          DateTime.now().year.toString()));
    });
  }

  void deleteRecord(RecordCls record) {
    recordList.realm.write(() {
      recordList.realm.delete(record);
    });
  }

  void deleteAll() {
    recordList.realm.write(() {
      recordList.realm.deleteAll<RecordCls>();
    });
  }
}

final recordRepoProvider = Provider<RecordRepo>((ref) => RecordRepo());
