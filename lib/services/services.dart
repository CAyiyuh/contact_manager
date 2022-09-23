// ignore_for_file: import_of_legacy_library_into_null_safe, constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:contact_app/models/contact.dart';
import 'package:http/http.dart' as http;

class Services {
//here provide the path to the file uploaded on the local server
  static const ROOT = 'http://192.168.43.146/school_manager/contacts.php';
  static const GET_ALL_ACTION = 'GET_ALL';
  static const ADD_CONTACT_ACTION = 'ADD_CONTACT';
  static const CREATE_TABLE_ACTION = 'CREATE_TABLE';

  static Future<String> createTable() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = CREATE_TABLE_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Response : {$response.body}');
      return response.body;
    } catch (e) {
      return "error";
    }
  }

  static Future<String> addContact(String firstName, String lastName,
      String phoneNumber, String gender) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = GET_ALL_ACTION;
      map['firstName'] = firstName;
      map['lastName'] = lastName;
      map['phoneNumber'] = phoneNumber;
      map['gender'] = gender;
      print("first name : ${firstName}");
      final response = await http.post(ROOT, body: map);
      print("get Contacts Response : ${response.body}");

      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  static Future<List<Contact>> getContacts() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = GET_ALL_ACTION;
      final response = await http.post(ROOT, body: map);
      print("get Contacts Response : ${response.body}");

      if (200 == response.statusCode) {
        List<Contact> list = parseResponse(response.body);
        return list;
      } else {
        return <Contact>[];
      }
    } catch (e) {
      return <Contact>[];
    }
  }

  static List<Contact> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Contact>((json) => Contact.fromJson(json)).toList();
  }
}
