import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Validation {
  static String isValidEmail({required String email}) {
    // Regular expression for validating an email
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(email)) {
      throw FormatException("The provided email address is invalid.");
    }
    return email.toString();
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static String isValidPhoneNumber({required String phoneNumber}) {
    // Regular expression for validating a phone number that starts with '5' and has 9 digits
    final RegExp phoneRegex = RegExp(r"^5\d{8}$");
    if (!phoneRegex.hasMatch(phoneNumber)) {
      throw FormatException("phoneNumber");
    }
    return phoneNumber;
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static String? isValidOneWordName(
      {required String value, String? title, bool? isOption}) {
    if (isOption == true) {
      if (value.toUpperCase().trim() == 'null' || value.trim().isEmpty) {
        return null;
      }
    }
    final RegExp nameRegex = RegExp(
        r"^[a-zA-Z\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]+$");
    if (!nameRegex.hasMatch(value.trim())) {
      throw FormatException("$title name should be one word.".trim());
    }
    return value.trim();
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static String isStrongPassword({required String password}) {
    // Regular expression for validating a strong password
    final RegExp passwordRegex = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      throw FormatException(" password");
    }
    return password;
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static String isValidOTP({required String otp}) {
    // Regular expression for validating a 6-digit OTP
    final RegExp otpRegex = RegExp(r'^\d{6}$');
    if (!otpRegex.hasMatch(otp)) {
      throw FormatException("OTP should be in numbers");
    }
    return otp;
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static String? validateUuid(
      {String? value, String? title, bool? isOption = false}) {
    try {
      if (isOption == true) {
        if (value == null || value.trim().isEmpty) {
          return null;
        }
      }
      Uuid.parse(value!.trim());
      return value.trim();
    } catch (error) {
      throw FormatException('$title Invalid UUID format');
    }
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static bool? isValidBoolean(
      {String? value, String? title, bool? isOption = false}) {
    try {
      if (isOption == true) {
        if (value == null || value.trim().isEmpty) {
          return null;
        }
      }
      if (value!.trim() == 'true') return true;
      if (value.trim() == 'false') return false;
      throw FormatException("The value of $title should be boolean");
    } catch (e) {
      rethrow;
    }
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static dynamic isValidNotNull(
      {String? value, String? title, bool? isOption = false}) {
    try {
      if (value.toString().trim().toLowerCase() == "null") {
        throw FormatException("The value of $title not accept null value");
      } else {
        return value;
      }
    } catch (e) {
      rethrow;
    }
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static String? isValidPrefixedUuid(
      {value, String? title, bool? isOption = false, required String prefix}) {
    try {
      if (value.startsWith(prefix)) {
        return value;
      } else {
        throw FormatException("The $title is not correct");
      }
    } catch (error) {
      rethrow;
    }
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static String? validateDate(
      {String? value, String? title, bool? isOption = false}) {
    try {
      if (isOption == true) {
        if (value == null || value.trim().isEmpty) {
          return null;
        }
      }
      DateFormat dateFormat = DateFormat('dd/MM/yyyy');
      DateTime dateTime = dateFormat.parseStrict(value!);
      String formattedDate = dateFormat.format(dateTime);
      if (formattedDate == value) {
        return formattedDate;
      } else {
        throw FormatException("${title ?? ""}Date format is incorrect.".trim());
      }
    } catch (e) {
      throw FormatException('${title ?? ""} Date format is incorrect.'.trim());
    }
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  static List<int>? parseIntList(
      {required String input, String? title, bool? isOption = false}) {
    try {
      if (isOption == true) {
        if (input.toLowerCase() == "null" || input.isEmpty) {
          return null;
        }
      }
      var decoded = jsonDecode(input);

      if (decoded is List) {
        List<int> intList = [];
        for (var element in decoded) {
          intList.add(int.parse(element.toString()));
        }

        if (intList.length == decoded.length) {
          return intList;
        }
      }
    } catch (e) {
      throw FormatException(
          '${title ?? ""} Invalid format for List<int>.'.trim());
    }
    throw FormatException(
        '${title ?? ""} Invalid format for List<int>.'.trim());
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  static String? convertDateFromSupabase({
    String? date,
    bool? isOption = false,
    String? title,
  }) {
    if (isOption == true) {
      if (date == null || date.isEmpty) {
        return null;
      }
    }
    DateFormat inputFormat = DateFormat('yyyy-MM-dd');
    DateFormat outputFormat = DateFormat('dd/MM/yyyy');

    DateTime dateTime = inputFormat.parse(date!);
    return outputFormat.format(dateTime);
  }
  //?-----------------------------------------------------
  //?-----------------------------------------------------

  static String? convertToDateToSupabase({
    String? date,
    bool? isOption = false,
    String? title,
  }) {
    try {
      if (isOption == true) {
        if (date == null || date.isEmpty) {
          return null;
        }
      }
      final regex = RegExp(r'^(\d{2})/(\d{2})/(\d{4})$');
      final match = regex.firstMatch(date!);

      if (match == null) {
        // Not matching the expected format
        throw FormatException("Error with format date $title".trim());
      }
      final day = int.tryParse(match.group(1)!);
      final month = int.tryParse(match.group(2)!);
      final year = int.tryParse(match.group(3)!);

      if (day == null || month == null || year == null) {
        // Parsing error
        throw FormatException("Error with format date $title".trim());
      }
      if (day == 0 || month == 0 || month > 12 || day > 31 || year < 2024) {
        // Day or month is invalid
        throw FormatException("Error with format date $title".trim());
      }
      DateFormat inputFormat = DateFormat('dd/MM/yyyy');
      DateFormat outputFormat = DateFormat('MM-dd-yyyy');

      DateTime dateTime = inputFormat.parse(date);
      return outputFormat.format(dateTime);
    } catch (error) {
      throw FormatException("Error with format date $title".trim());
    }
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  static String? isValidUsername({
    String? value,
    bool? isOption = false,
    String? title,
  }) {
    if (isOption == true) {
      if (value == null || value.isEmpty) {
        return null;
      }
    }
    // Regular expression for username validation
    final RegExp usernameRegExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9._-]{2,50}$');

    if (!usernameRegExp.hasMatch(value!.trim())) {
      throw FormatException("$title Invalid username".trim());
    }

    return value.trim();
  }

  //?-----------------------------------------------------
  //?-----------------------------------------------------
  static int? isValidRatingValue({
    String? value,
    bool? isOption = false,
    String? title,
  }) {
    try {
      if (isOption == true) {
        if (value == null || value.isEmpty) {
          return null;
        }
      }
      // Regular expression for username validation
      int? parsedValue = int.tryParse(value!);
      if (parsedValue == null) {
        throw FormatException("$title value is not an integer number.".trim());
      } else if (parsedValue < 0) {
        throw FormatException("$title value should be great then 0.".trim());
      } else if (parsedValue > 10) {
        throw FormatException("$title value should be less then 10".trim());
      }

      return parsedValue;
    } catch (error) {
      rethrow;
    }
  }
}
