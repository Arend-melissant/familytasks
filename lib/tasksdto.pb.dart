///
//  Generated code. Do not modify.
//  source: tasksdto.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;

import 'tasksdto.pbenum.dart';

export 'tasksdto.pbenum.dart';

class ListTasksRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListTasksRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..hasRequiredFields = false
  ;

  ListTasksRequest._() : super();
  factory ListTasksRequest({
    $core.int? iD,
  }) {
    final _result = create();
    if (iD != null) {
      _result.iD = iD;
    }
    return _result;
  }
  factory ListTasksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTasksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTasksRequest clone() => ListTasksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTasksRequest copyWith(void Function(ListTasksRequest) updates) => super.copyWith((message) => updates(message as ListTasksRequest)) as ListTasksRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListTasksRequest create() => ListTasksRequest._();
  ListTasksRequest createEmptyInstance() => create();
  static $pb.PbList<ListTasksRequest> createRepeated() => $pb.PbList<ListTasksRequest>();
  @$core.pragma('dart2js:noInline')
  static ListTasksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTasksRequest>(create);
  static ListTasksRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(1)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(1)
  void clearID() => clearField(1);
}

class TaskResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TaskResponse', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ID', $pb.PbFieldType.O3, protoName: 'ID')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'task')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'detail')
    ..e<TaskResponse_STATUS>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: TaskResponse_STATUS.UNKNOWN, valueOf: TaskResponse_STATUS.valueOf, enumValues: TaskResponse_STATUS.values)
    ..aOM<$1.Timestamp>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'at', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'due', subBuilder: $1.Timestamp.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'executor')
    ..hasRequiredFields = false
  ;

  TaskResponse._() : super();
  factory TaskResponse({
    $core.int? iD,
    $core.String? task,
    $core.String? detail,
    TaskResponse_STATUS? status,
    $1.Timestamp? at,
    $1.Timestamp? due,
    $core.String? owner,
    $core.String? executor,
  }) {
    final _result = create();
    if (iD != null) {
      _result.iD = iD;
    }
    if (task != null) {
      _result.task = task;
    }
    if (detail != null) {
      _result.detail = detail;
    }
    if (status != null) {
      _result.status = status;
    }
    if (at != null) {
      _result.at = at;
    }
    if (due != null) {
      _result.due = due;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (executor != null) {
      _result.executor = executor;
    }
    return _result;
  }
  factory TaskResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TaskResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TaskResponse clone() => TaskResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TaskResponse copyWith(void Function(TaskResponse) updates) => super.copyWith((message) => updates(message as TaskResponse)) as TaskResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TaskResponse create() => TaskResponse._();
  TaskResponse createEmptyInstance() => create();
  static $pb.PbList<TaskResponse> createRepeated() => $pb.PbList<TaskResponse>();
  @$core.pragma('dart2js:noInline')
  static TaskResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TaskResponse>(create);
  static TaskResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get iD => $_getIZ(0);
  @$pb.TagNumber(1)
  set iD($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasID() => $_has(0);
  @$pb.TagNumber(1)
  void clearID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get task => $_getSZ(1);
  @$pb.TagNumber(2)
  set task($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTask() => $_has(1);
  @$pb.TagNumber(2)
  void clearTask() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get detail => $_getSZ(2);
  @$pb.TagNumber(3)
  set detail($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDetail() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetail() => clearField(3);

  @$pb.TagNumber(4)
  TaskResponse_STATUS get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(TaskResponse_STATUS v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get at => $_getN(4);
  @$pb.TagNumber(5)
  set at($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearAt() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get due => $_getN(5);
  @$pb.TagNumber(6)
  set due($1.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDue() => $_has(5);
  @$pb.TagNumber(6)
  void clearDue() => clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureDue() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get owner => $_getSZ(6);
  @$pb.TagNumber(7)
  set owner($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOwner() => $_has(6);
  @$pb.TagNumber(7)
  void clearOwner() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get executor => $_getSZ(7);
  @$pb.TagNumber(8)
  set executor($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasExecutor() => $_has(7);
  @$pb.TagNumber(8)
  void clearExecutor() => clearField(8);
}

class ListTasksResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListTasksResponse', createEmptyInstance: create)
    ..pc<TaskResponse>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tasks', $pb.PbFieldType.PM, subBuilder: TaskResponse.create)
    ..hasRequiredFields = false
  ;

  ListTasksResponse._() : super();
  factory ListTasksResponse({
    $core.Iterable<TaskResponse>? tasks,
  }) {
    final _result = create();
    if (tasks != null) {
      _result.tasks.addAll(tasks);
    }
    return _result;
  }
  factory ListTasksResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListTasksResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListTasksResponse clone() => ListTasksResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListTasksResponse copyWith(void Function(ListTasksResponse) updates) => super.copyWith((message) => updates(message as ListTasksResponse)) as ListTasksResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListTasksResponse create() => ListTasksResponse._();
  ListTasksResponse createEmptyInstance() => create();
  static $pb.PbList<ListTasksResponse> createRepeated() => $pb.PbList<ListTasksResponse>();
  @$core.pragma('dart2js:noInline')
  static ListTasksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListTasksResponse>(create);
  static ListTasksResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TaskResponse> get tasks => $_getList(0);
}

