// import 'dart:async';
// import 'dart:io';
//
// import 'package:chat_app/core/utils/short_message.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

/// Utility class for handling errors across the application.
class ErrorUtil {
  /// Handles common API errors by displaying appropriate error messages to the user.
  ///
  /// This method catches and handles [TimeoutException], [SocketException], and
  /// [FirebaseException]. For all other error types, a generic error message is shown.
  ///

  // static Future<void> handleDatabaseErrors(dynamic error) async {
  //   if (error is TimeoutException) {
  //     ShortMessageUtils.showError("Request timed out. Please try again.");
  //   } else if (error is SocketException) {
  //     ShortMessageUtils.showError(
  //         "Network error. Please check your internet connection.");
  //   } else if (error is FirebaseException) {
  //     // Handle Firebase-specific errors
  //     _handleFirebaseError(error);
  //   } else {
  //     print("Unexpected Error---- $error");
  //     ShortMessageUtils.showError(
  //         "An unexpected error occurred. Please try again later.");
  //   }
  // }

  /// Handles Firebase-specific errors.
  // static void _handleFirebaseError(FirebaseException error) {
  //   // Customize the message based on error codes
  //   String errorMessage = "An error occurred. Please try again later.";
  //   switch (error.code) {
  //     case "permission-denied":
  //       errorMessage = "You don't have permission to access this resource.";
  //       break;
  //     case "not-found":
  //       errorMessage = "The requested document was not found.";
  //       break;
  //     case "quota-exceeded":
  //       errorMessage = "You have exceeded your quota.";
  //       break;
  //     // Add more cases as needed
  //   }
  //
  //   ShortMessageUtils.showError(errorMessage);
  //   print(
  //       "FirebaseException Code---- ${error.code}, Message---- ${error.message}");
  // }
}
