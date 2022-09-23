import 'dart:core';

class Contact {
  String firstName;
  String lastName;
  String phoneNumber;
  bool gender;

  Contact({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.gender,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['[phoneNumber'] as String,
      gender: json['gender'] as bool,
    );
  }
}
