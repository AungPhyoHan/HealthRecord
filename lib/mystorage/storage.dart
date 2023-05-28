import 'package:father_health/features/home/domain/record.dart';
import 'package:realm/realm.dart';

final config = Configuration.local([RecordCls.schema]);
final realm = Realm(config);
RealmResults<RecordCls> recordList = realm.all<RecordCls>();
