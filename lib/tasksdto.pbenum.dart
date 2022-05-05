///
//  Generated code. Do not modify.
//  source: tasksdto.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TaskResponse_STATUS extends $pb.ProtobufEnum {
  static const TaskResponse_STATUS UNKNOWN = TaskResponse_STATUS._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const TaskResponse_STATUS NEW = TaskResponse_STATUS._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NEW');
  static const TaskResponse_STATUS ACTIVE = TaskResponse_STATUS._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACTIVE');
  static const TaskResponse_STATUS DONE = TaskResponse_STATUS._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DONE');
  static const TaskResponse_STATUS CANCELLED = TaskResponse_STATUS._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CANCELLED');

  static const $core.List<TaskResponse_STATUS> values = <TaskResponse_STATUS> [
    UNKNOWN,
    NEW,
    ACTIVE,
    DONE,
    CANCELLED,
  ];

  static final $core.Map<$core.int, TaskResponse_STATUS> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TaskResponse_STATUS? valueOf($core.int value) => _byValue[value];

  const TaskResponse_STATUS._($core.int v, $core.String n) : super(v, n);
}

