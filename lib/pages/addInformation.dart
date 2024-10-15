import 'package:flutter/material.dart';
import 'package:information_app/controller/information_controller.dart';
import 'package:information_app/models/information.dart';
import 'package:information_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

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
        id: '',
      );

      try {
        await _informationSurvice.addInformation(NewInformation, userProvider);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Information added successfully!')));
        Navigator.of(context).pop(true);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error adding information: $e')));
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
        title: Text('Add Information'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/TSU.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 243, 241, 241), width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'ADD INFORMATION',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                      SizedBox(height: 40),
                      _buildTextFormField('NAME', (value) => _name = value),
                      _buildTextFormField('SURNAME', (value) => _surname = value),
                      _buildTextFormField('BIRTHDAY', (value) => _birthday = value),
                      _buildTextFormField('AGE', (value) => _age = value),
                      _buildTextFormField('SEX', (value) => _sex = value),
                      _buildTextFormField('STATUS', (value) => _status = value),
                      _buildTextFormField('BLOODGROUP', (value) => _bloodGroup = value),
                      _buildTextFormField('NATIONALITY', (value) => _nationality = value),
                      _buildTextFormField('ETHNICITY', (value) => _ethnicity = value),
                      _buildTextFormField('RELIGION', (value) => _religion = value),
                      _buildTextFormField('ADDRESS', (value) => _address = value),
                      _buildTextFormField('EMAIL', (value) => _email = value),
                      _buildTextFormField('PHONENUMBER', (value) => _phonenumber = value),
                      _buildTextFormField('SHOPNAME', (value) => _shopname = value),
                      _buildTextFormField('RENEWAL PERIOD', (value) => _renewalPeriod = value),
                      _buildTextFormField('Date Information', (value) => _dateInformation = value),
                      _buildTextFormField('Expires Information', (value) => _expiresInformation = value),
                      _buildTextFormField('Status Date', (value) => _startdate = value),
                      _buildTextFormField('History Information', (value) => _historyInformation = value),
                      _buildTextFormField('LOCATION', (value) => _location = value),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _AddInformation,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // มุมของปุ่ม
                          ),
                        ),
                        child: Text('SUCCESSFULLY', style: TextStyle(fontSize: 18,color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String label, Function(String) onChanged) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blue),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
          ),
          onChanged: onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a information $label';
            }
            return null;
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
