import 'package:realm/realm.dart';
part 'record.g.dart';

@RealmModel()
class _RecordCls {
  @PrimaryKey()
  late ObjectId id;
  late String nameEn;
  late String nameMm;
  late String time;
  late DateTime now;
  late String day;
  late String month;
  late String year;
}
