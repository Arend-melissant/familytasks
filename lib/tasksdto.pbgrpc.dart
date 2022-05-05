///
//  Generated code. Do not modify.
//  source: tasksdto.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tasksdto.pb.dart' as $0;
export 'tasksdto.pb.dart';

class TasksServiceClient extends $grpc.Client {
  static final _$listTasks =
      $grpc.ClientMethod<$0.ListTasksRequest, $0.ListTasksResponse>(
          '/TasksService/ListTasks',
          ($0.ListTasksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ListTasksResponse.fromBuffer(value));
  static final _$saveTask =
      $grpc.ClientMethod<$0.TaskResponse, $0.TaskResponse>(
          '/TasksService/SaveTask',
          ($0.TaskResponse value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.TaskResponse.fromBuffer(value));

  TasksServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.ListTasksResponse> listTasks(
      $0.ListTasksRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTasks, request, options: options);
  }

  $grpc.ResponseFuture<$0.TaskResponse> saveTask($0.TaskResponse request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$saveTask, request, options: options);
  }
}

abstract class TasksServiceBase extends $grpc.Service {
  $core.String get $name => 'TasksService';

  TasksServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ListTasksRequest, $0.ListTasksResponse>(
        'ListTasks',
        listTasks_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListTasksRequest.fromBuffer(value),
        ($0.ListTasksResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TaskResponse, $0.TaskResponse>(
        'SaveTask',
        saveTask_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TaskResponse.fromBuffer(value),
        ($0.TaskResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ListTasksResponse> listTasks_Pre($grpc.ServiceCall call,
      $async.Future<$0.ListTasksRequest> request) async {
    return listTasks(call, await request);
  }

  $async.Future<$0.TaskResponse> saveTask_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TaskResponse> request) async {
    return saveTask(call, await request);
  }

  $async.Future<$0.ListTasksResponse> listTasks(
      $grpc.ServiceCall call, $0.ListTasksRequest request);
  $async.Future<$0.TaskResponse> saveTask(
      $grpc.ServiceCall call, $0.TaskResponse request);
}
