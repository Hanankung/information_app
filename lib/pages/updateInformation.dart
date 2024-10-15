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
        title: Text('Edit Information'),
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
                          'EDIT INFORMATION',
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
                        onPressed: _UpdateInformation,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // มุมของปุ่ม
                          ),
                        ),
                        child: Text('CONFIRM', style: TextStyle(fontSize: 18,color: Colors.white)),
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