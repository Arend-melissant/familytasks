///
//  Generated code. Do not modify.
//  source: tasksdto.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use listTasksRequestDescriptor instead')
const ListTasksRequest$json = const {
  '1': 'ListTasksRequest',
  '2': const [
    const {'1': 'ID', '3': 1, '4': 1, '5': 5, '10': 'ID'},
  ],
};

/// Descriptor for `ListTasksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTasksRequestDescriptor = $convert.base64Decode('ChBMaXN0VGFza3NSZXF1ZXN0Eg4KAklEGAEgASgFUgJJRA==');
@$core.Deprecated('Use taskResponseDescriptor instead')
const TaskResponse$json = const {
  '1': 'TaskResponse',
  '2': const [
    const {'1': 'ID', '3': 1, '4': 1, '5': 5, '10': 'ID'},
    const {'1': 'task', '3': 2, '4': 1, '5': 9, '10': 'task'},
    const {'1': 'detail', '3': 3, '4': 1, '5': 9, '10': 'detail'},
    const {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.TaskResponse.STATUS', '10': 'status'},
    const {'1': 'at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'at'},
    const {'1': 'due', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'due'},
    const {'1': 'owner', '3': 7, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'executor', '3': 8, '4': 1, '5': 9, '10': 'executor'},
  ],
  '4': const [TaskResponse_STATUS$json],
};

@$core.Deprecated('Use taskResponseDescriptor instead')
const TaskResponse_STATUS$json = const {
  '1': 'STATUS',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'NEW', '2': 1},
    const {'1': 'ACTIVE', '2': 2},
    const {'1': 'DONE', '2': 3},
    const {'1': 'CANCELLED', '2': 4},
  ],
};

/// Descriptor for `TaskResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List taskResponseDescriptor = $convert.base64Decode('CgxUYXNrUmVzcG9uc2USDgoCSUQYASABKAVSAklEEhIKBHRhc2sYAiABKAlSBHRhc2sSFgoGZGV0YWlsGAMgASgJUgZkZXRhaWwSLAoGc3RhdHVzGAQgASgOMhQuVGFza1Jlc3BvbnNlLlNUQVRVU1IGc3RhdHVzEioKAmF0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFICYXQSLAoDZHVlGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIDZHVlEhQKBW93bmVyGAcgASgJUgVvd25lchIaCghleGVjdXRvchgIIAEoCVIIZXhlY3V0b3IiQwoGU1RBVFVTEgsKB1VOS05PV04QABIHCgNORVcQARIKCgZBQ1RJVkUQAhIICgRET05FEAMSDQoJQ0FOQ0VMTEVEEAQ=');
@$core.Deprecated('Use listTasksResponseDescriptor instead')
const ListTasksResponse$json = const {
  '1': 'ListTasksResponse',
  '2': const [
    const {'1': 'tasks', '3': 1, '4': 3, '5': 11, '6': '.TaskResponse', '10': 'tasks'},
  ],
};

/// Descriptor for `ListTasksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listTasksResponseDescriptor = $convert.base64Decode('ChFMaXN0VGFza3NSZXNwb25zZRIjCgV0YXNrcxgBIAMoCzINLlRhc2tSZXNwb25zZVIFdGFza3M=');
