// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class RecordCls extends _RecordCls
    with RealmEntity, RealmObjectBase, RealmObject {
  RecordCls(
    ObjectId id,
    String nameEn,
    String nameMm,
    String time,
    DateTime now,
    String day,
    String month,
    String year,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'nameEn', nameEn);
    RealmObjectBase.set(this, 'nameMm', nameMm);
    RealmObjectBase.set(this, 'time', time);
    RealmObjectBase.set(this, 'now', now);
    RealmObjectBase.set(this, 'day', day);
    RealmObjectBase.set(this, 'month', month);
    RealmObjectBase.set(this, 'year', year);
  }

  RecordCls._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get nameEn => RealmObjectBase.get<String>(this, 'nameEn') as String;
  @override
  set nameEn(String value) => RealmObjectBase.set(this, 'nameEn', value);

  @override
  String get nameMm => RealmObjectBase.get<String>(this, 'nameMm') as String;
  @override
  set nameMm(String value) => RealmObjectBase.set(this, 'nameMm', value);

  @override
  String get time => RealmObjectBase.get<String>(this, 'time') as String;
  @override
  set time(String value) => RealmObjectBase.set(this, 'time', value);

  @override
  DateTime get now => RealmObjectBase.get<DateTime>(this, 'now') as DateTime;
  @override
  set now(DateTime value) => RealmObjectBase.set(this, 'now', value);

  @override
  String get day => RealmObjectBase.get<String>(this, 'day') as String;
  @override
  set day(String value) => RealmObjectBase.set(this, 'day', value);

  @override
  String get month => RealmObjectBase.get<String>(this, 'month') as String;
  @override
  set month(String value) => RealmObjectBase.set(this, 'month', value);

  @override
  String get year => RealmObjectBase.get<String>(this, 'year') as String;
  @override
  set year(String value) => RealmObjectBase.set(this, 'year', value);

  @override
  Stream<RealmObjectChanges<RecordCls>> get changes =>
      RealmObjectBase.getChanges<RecordCls>(this);

  @override
  RecordCls freeze() => RealmObjectBase.freezeObject<RecordCls>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(RecordCls._);
    return const SchemaObject(ObjectType.realmObject, RecordCls, 'RecordCls', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('nameEn', RealmPropertyType.string),
      SchemaProperty('nameMm', RealmPropertyType.string),
      SchemaProperty('time', RealmPropertyType.string),
      SchemaProperty('now', RealmPropertyType.timestamp),
      SchemaProperty('day', RealmPropertyType.string),
      SchemaProperty('month', RealmPropertyType.string),
      SchemaProperty('year', RealmPropertyType.string),
    ]);
  }
}
