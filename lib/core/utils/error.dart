import 'dart:async';
import 'dart:io';

import 'package:chat_app/core/utils/short_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Utility class for handling errors across the application.
class ErrorUtil {
  /// Handles common API and Firebase errors by displaying appropriate error messages to the user.
  static Future<void> handleError(dynamic error) async {
    if (error is TimeoutException) {
      _handleTimeoutError();
    } else if (error is SocketException) {
      _handleSocketError();
    } else if (error is FirebaseAuthException) {
      _handleAuthError(error);
    } else if (error is FirebaseException) {
      _handleFirebaseError(error);
    } else {
      _handleUnexpectedError(error);
    }
  }

  /// Handles timeout errors.
  static void _handleTimeoutError() {
    ShortMessageUtils.showError("Request timed out. Please try again.");
    print("Error: TimeoutException");
  }

  /// Handles network-related errors.
  static void _handleSocketError() {
    ShortMessageUtils.showError(
        "Network error. Please check your internet connection.");
    print("Error: SocketException");
  }

  /// Handles Firebase Authentication errors.
  static void _handleAuthError(FirebaseAuthException error) {
    String errorMessage = "Authentication failed. Please try again.";
    switch (error.code) {
      case "invalid-email":
        errorMessage = "The email address is not valid.";
        break;
      case "user-disabled":
        errorMessage = "This user account has been disabled.";
        break;
      case "user-not-found":
        errorMessage = "No user found with this email.";
        break;
      case "wrong-password":
        errorMessage = "Incorrect password. Please try again.";
        break;
      case "email-already-in-use":
        errorMessage = "This email is already registered. Try logging in.";
        break;
      case "weak-password":
        errorMessage = "The password is too weak. Use a stronger password.";
        break;
      case "operation-not-allowed":
        errorMessage = "This operation is not allowed. Please contact support.";
        break;
      case "too-many-requests":
        errorMessage = "Too many attempts. Please try again later.";
        break;
      default:
        errorMessage = error.message ?? errorMessage;
    }

    ShortMessageUtils.showError(errorMessage);
    print(
        "FirebaseAuthException: Code = ${error.code}, Message = ${error.message}");
  }

  /// Handles general Firebase errors.
  static void _handleFirebaseError(FirebaseException error) {
    String errorMessage = "An error occurred. Please try again later.";
    switch (error.code) {
      case "permission-denied":
        errorMessage = "You don't have permission to access this resource.";
        break;
      case "not-found":
        errorMessage = "The requested document was not found.";
        break;
      case "quota-exceeded":
        errorMessage = "You have exceeded your quota.";
        break;
      case "unavailable":
        errorMessage = "The service is currently unavailable. Try again later.";
        break;
      default:
        errorMessage = error.message ?? errorMessage;
    }

    ShortMessageUtils.showError(errorMessage);
    print(
        "FirebaseException: Code = ${error.code}, Message = ${error.message}");
  }

  /// Handles unexpected errors.
  static void _handleUnexpectedError(dynamic error) {
    ShortMessageUtils.showError(
        "An unexpected error occurred. Please try again later.");
    print("Unexpected Error: $error");
  }
}
