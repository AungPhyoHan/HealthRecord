import 'package:realm/realm.dart';
part 'record.g.dart';

@RealmModel()
class _RecordCls {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String time;
  late DateTime now;
  late String day;
  late String month;
  late String year;
}
