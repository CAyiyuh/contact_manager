import 'package:contact_app/services/services.dart';
import 'package:contact_app/utils/custom_input.dart';
import 'package:contact_app/utils/custom_theme.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _gender = TextEditingController();

  createTable() {
    // print('creating table');
    Services.createTable();
  }

  createContact() {
    Services.addContact(
        _firstName.text, _lastName.text, _phoneNumber.text, _gender.text);
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
                    child: Column(
                      children: [
                        CustomInput(
                            controller: _firstName,
                            hintText: 'CS LISTED',
                            labelText: 'First Name',
                            isPassword: false,
                            prefixIcon: Icons.person,
                            surfixIcon: Icons.person,
                            readOnly: false,
                            borderColor: CustomTheme.blue,
                            helperText: ""),
                        SizedBox(
                          height: 2,
                        ),
                        CustomInput(
                            controller: _lastName,
                            hintText: 'CS LISTED',
                            labelText: 'Last Name',
                            isPassword: false,
                            prefixIcon: Icons.person,
                            surfixIcon: Icons.person,
                            readOnly: false,
                            borderColor: CustomTheme.blue,
                            helperText: ""),
                        SizedBox(
                          height: 2,
                        ),
                        CustomInput(
                            controller: _phoneNumber,
                            hintText: '+237 652686163',
                            labelText: 'Phone Number',
                            isPassword: false,
                            prefixIcon: Icons.phone,
                            surfixIcon: Icons.phone,
                            readOnly: false,
                            borderColor: CustomTheme.blue,
                            helperText: ""),
                        SizedBox(
                          height: 2,
                        ),
                        CustomInput(
                            controller: _gender,
                            hintText: '',
                            labelText: 'Gender',
                            isPassword: false,
                            prefixIcon: Icons.male,
                            surfixIcon: Icons.male,
                            readOnly: false,
                            borderColor: CustomTheme.blue,
                            helperText: "")
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  createTable();
                },
                child: Icon(Icons.add),
              )
            ],
          )),
    );
  }
}
