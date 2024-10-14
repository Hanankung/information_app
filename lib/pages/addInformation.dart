import 'package:flutter/material.dart';
import 'package:information_app/controller/information_controller.dart';
import 'package:information_app/models/information.dart';
import 'package:information_app/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class AddInformation extends StatefulWidget {
  const AddInformation({super.key});

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  final _formkey = GlobalKey<FormState>();
  final informationSurvice _informationSurvice = informationSurvice();

  String _name = '';
  String _surname = '';
  String _birthday = '';
  String _age = '';
  String _sex = '';
  String _status = '';
  String _bloodGroup = '';
  String _nationality = '';
  String _ethnicity = '';
  String _religion = '';
  String _address = '';
  String _email = '';
  String _phonenumber = '';
  String _shopname = '';
  String _renewalPeriod = '';
  String _dateInformation = '';
  String _expiresInformation = '';
  String _startdate = '';
  String _historyInformation = '';
  String _location = '';

  void _AddInformation() async {
    if (_formkey.currentState!.validate()) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final NewInformation = InformationModel(
        name: _name,
        surname: _surname,
        birthday: _birthday,
        age: _age,
        sex: _sex,
        status: _status,
        bloodGroup: _bloodGroup,
        nationality: _nationality,
        ethnicity: _ethnicity,
        religion: _religion,
        address: _address,
        email: _email,
        phonenumber: _phonenumber,
        shopname: _shopname,
        renewalPeriod: _renewalPeriod,
        dateInformation: _dateInformation,
        expiresInformation: _expiresInformation,
        startdate: _startdate,
        historyInformation: _historyInformation,
        location: _location,
        id: ''
      );

      try {
        await _informationSurvice.addInformation(NewInformation, userProvider);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Information added successfull !')),);
        // ไปยังหน้า HomePage หลังจากเพิ่มผลิตภัณฑ์สำเร็จ
        Navigator.of(context).pop(
            true); // หรือใช้ Navigator.of(context).pushReplacementNamed('/home');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error adding information: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/TSU.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: SingleChildScrollView(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'ADD INFORMATION',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'NAME'),
                          onChanged: (value) {
                            _name = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'SURNAME'),
                          onChanged: (value) {
                            _surname = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information surname';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'BIRTHDAY'),
                          onChanged: (value) {
                            _birthday = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information birthday';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'AGE'),
                          onChanged: (value) {
                            _age = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information age';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'SEX'),
                          onChanged: (value) {
                            _sex = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information sex';
                            }
                            return null;
                          },
                        ),SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'STATUS'),
                          onChanged: (value) {
                            _status = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information status';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'BLOODGROUP'),
                          onChanged: (value) {
                            _bloodGroup = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information bloodGoup';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'NATIONALITY'),
                          onChanged: (value) {
                            _nationality = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information nationality';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'ETHNICITY'),
                          onChanged: (value) {
                            _ethnicity = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information ethnicity';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'RELIGION'),
                          onChanged: (value) {
                            _religion = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information religion';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'ADDRESS'),
                          onChanged: (value) {
                            _address = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'EMAIL'),
                          onChanged: (value) {
                            _email = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'PHONENUMBER'),
                          onChanged: (value) {
                            _phonenumber = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information phonenumber';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'SHOPNAME'),
                          onChanged: (value) {
                            _shopname = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information shopname';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'RENEWAL PERIOD'),
                          onChanged: (value) {
                            _renewalPeriod = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information renowal period';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Date Information'),
                          onChanged: (value) {
                            _dateInformation = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information date information';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Expires Information'),
                          onChanged: (value) {
                            _expiresInformation = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information Expires';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Status Date'),
                          onChanged: (value) {
                            _startdate = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information Status Date';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'History Information'),
                          onChanged: (value) {
                            _historyInformation = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information History';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'LOCATION'),
                          onChanged: (value) {
                            _location = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a information Location';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(height: 80),
                        ElevatedButton(
                          onPressed: _AddInformation,
                          child: Text('SUCCESSFULLY'),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}