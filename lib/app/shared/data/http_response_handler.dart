// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:blockchain_app/app/shared/data/api_exceptions.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

/// Handles your http requests and returns a response as [T].
Future<T> responseHandler<T>({
  T Function(Map<String, dynamic> data)? builder,
  T Function(List<dynamic> data)? builderOnList,
  Future<Response>? httpRequest,
}) async {
  final logger = Logger();

  try {
    final response = await httpRequest;
    assert(
      builder != null || builderOnList != null,
      'You can only make use of one builder type',
    );

    switch (response?.statusCode) {
      case 200 || 201:
        var data;

        logger.log(Level.info, response!.body);

        if (builder != null) {
          data = jsonDecode(response.body);
          return builder(data as Map<String, dynamic>);
        } else {
          data = jsonDecode(response.body);
          // print(data);
          return builderOnList!(data as List<dynamic>);
        }

      case 400 || 401 || 404 || 409:
        logger.log(Level.error, response!.body);
        throw Exception(
          jsonDecode(response.body) as Map<String, dynamic>,
        );

      default:
        logger.log(Level.error, response!.body);
        throw Exception(
          jsonDecode(response.body) as Map<String, dynamic>,
        );
    }
  } on SocketException catch (_) {
    throw NoInternetConnectionException();
  }
}

// String _extractErrorMessage(Map<String, dynamic> response) {
//   // if (response == null || response is! Map) {
//   //   return 'Unknown error occurred.'; // Handle unexpected response format
//   // }

//   final statusCode = response['status'];
//   final message = response['message'];

//   if (response.containsKey('data')) {
//     final data = response['data'];

//     if (data is Map) {
//       if (data.containsKey('message')) {
//         return data['message'] as String;
//       } else {
//         return message.toString();
//       }
//     }
//     if (data is List) {
//       // ignore: avoid_dynamic_calls
//       final constraintsData = data[0]['constraints'];
//       final errorMessageBuffer = StringBuffer();

//       // Prioritize message if available
//       if (message != null) {
//         errorMessageBuffer.write(message);
//       } else if (statusCode != null) {
//         errorMessageBuffer.write('Error: Status code $statusCode');
//       } else {
//         errorMessageBuffer.write('Error: Unknown error details.');
//       }

//       // Add constraints if available
//       if (constraintsData != null) {
//         if (constraintsData is List) {
//           errorMessageBuffer.write('\nConstraints:\n');
//           for (final constraint in constraintsData) {
//             if (constraint is String) {
//               errorMessageBuffer.write('- $constraint\n');
//             } else {
//               // Handle unexpected constraint format (optional)
//               errorMessageBuffer.write('- (Invalid constraint format)\n');
//             }
//           }
//         } else {
//           // Handle unexpected constraints data format (optional)
//           errorMessageBuffer.write('\nConstraints: (Invalid format)');
//         }
//       }

//       return errorMessageBuffer.toString();
//     } else {
//       return data.toString();
//     }
//   } else {
//     return message as String;
//   }
// }
