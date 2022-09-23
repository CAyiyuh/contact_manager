// ignore_for_file: avoid_print

import 'package:contact_app/services/services.dart';
import 'package:contact_app/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List _contacts = [];

  @override
  void initState() {
    super.initState();
    _contacts = [];
  }

  createTable() {
    Services.CREATE_TABLE_ACTION;
  }

  getContacts() {
    Services.getContacts().then((contacts) {
      setState(() {
        _contacts = contacts;
        print("Length : $_contacts");
      });
    });
  }

  SingleChildScrollView _dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('First Name')),
            DataColumn(label: Text('Last Name')),
            DataColumn(label: Text('Phone Number')),
            DataColumn(label: Text('Gender')),
            DataColumn(label: Text('Creation Date')),
          ],
          rows: _contacts
              .map((contact) => DataRow(cells: [
                    DataCell(Text(contact.id.toString())),
                    DataCell(Text(contact.firstName.toUpperCase())),
                    DataCell(Text(contact.lastName.toUpperCase())),
                    DataCell(Text(contact.phoneNumber.toString())),
                    DataCell(Text(contact.gender.toString())),
                    DataCell(Text(contact.created_at.toString()))
                  ]))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                  height: 350,
                  decoration: CustomTheme.getCardDecoration(),
                  child: Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(children: [_dataBody()]))))
            ],
          )),
    );
  }
}
