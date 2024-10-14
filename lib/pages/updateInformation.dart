import 'package:flutter/material.dart';
import 'package:information_app/controller/information_controller.dart';
import 'package:information_app/models/information.dart';
import 'package:information_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UpdateInformation extends StatefulWidget {
  final InformationModel information;

  UpdateInformation({required this.information});

  @override
  State<UpdateInformation> createState() => _UpdateInformationState();
}

class _UpdateInformationState extends State<UpdateInformation> {
  final _formkey = GlobalKey<FormState>();
  final informationSurvice _informationSurvice = informationSurvice();

  late String _name;
  late String _surname;
  late String _birthday;
  late String _age;
  late String _sex;
  late String _status;
  late String _bloodGroup;
  late String _nationality;
  late String _ethnicity;
  late String _religion;
  late String _address;
  late String _email;
  late String _phonenumber;
  late String _shopname;
  late String _renewalPeriod;
  late String _dateInformation;
  late String _expiresInformation;
  late String _startdate;
  late String _historyInformation;
  late String _location;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _name = widget.information.name;
    _surname = widget.information.surname;
    _birthday = widget.information.birthday;
    _age = widget.information.age;
    _sex = widget.information.sex;
    _status = widget.information.status;
    _bloodGroup = widget.information.bloodGroup;
    _nationality = widget.information.nationality;
    _ethnicity = widget.information.ethnicity;
    _religion = widget.information.religion;
    _address = widget.information.address;
    _email = widget.information.email;
    _phonenumber = widget.information.phonenumber;
    _shopname = widget.information.shopname;
    _renewalPeriod = widget.information.renewalPeriod;
    _dateInformation = widget.information.dateInformation;
    _expiresInformation = widget.information.expiresInformation;
    _startdate = widget.information.startdate;
    _historyInformation = widget.information.historyInformation;
    _location = widget.information.location;

  }

  void _UpdateInformation() async {
    if (_formkey.currentState!.validate()) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final updateInformation = InformationModel(
        name: widget.information.name, 
        surname: widget.information.surname, 
        birthday: widget.information.birthday, 
        age: widget.information.age, 
        sex: widget.information.age, 
        status: widget.information.status, 
        bloodGroup: widget.information.bloodGroup, 
        nationality: widget.information.nationality, 
        ethnicity: widget.information.ethnicity, 
        religion: widget.information.religion, 
        address: widget.information.address, 
        email: widget.information.email, 
        phonenumber: widget.information.phonenumber, 
        shopname: widget.information.shopname, 
        renewalPeriod: widget.information.renewalPeriod, 
        dateInformation: widget.information.dateInformation, 
        expiresInformation: widget.information.expiresInformation, 
        startdate: widget.information.startdate, 
        historyInformation: widget.information.historyInformation, 
        location: widget.information.location, 
        id: widget.information.id);

        try {
          await _informationSurvice.updateInformation(updateInformation, userProvider);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Information updated successfully!')),);
          Navigator.of(context).pop(true);
        } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating information: $e')),
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
                          onPressed: _UpdateInformation,
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