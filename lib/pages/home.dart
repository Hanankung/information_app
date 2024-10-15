import 'package:flutter/material.dart';
import 'package:information_app/controller/information_controller.dart';
import 'package:information_app/models/information.dart';
import 'package:information_app/pages/addInformation.dart';
import 'package:information_app/pages/updateInformation.dart';
import 'package:information_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<InformationModel> informations = [];
  final informationSurvice _informationSurvice = informationSurvice();

  @override
  void initState() {
    super.initState();
    _fetchInformations();
  }

  Future<void> _fetchInformations() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      final informationList =
          await _informationSurvice.fetchInformations(userProvider);
      setState(() {
        informations = informationList;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error fetching products: $e')));
    }
  }

  void _logout() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.onlogout();

    if (!userProvider.isAuthentication()) {
      print('logout successful');
    }

    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _toAddProduct() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddInformation(),
      ),
    );
    if (result == true) {
      _fetchInformations();
    }
  }

  void _toUpdateProduct(InformationModel informationModel) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UpdateInformation(information: informationModel),
      ),
    );
    if (result == true) {
      _fetchInformations();
    }
  }

  Future<void> _deleteInformation(InformationModel informationModel) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    final confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm deletion'),
          content: Text(
              'Are you sure you want to delete "${informationModel.name}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      try {
        await _informationSurvice.deleteInformation(
            informationModel.id, userProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('information deleted successfully!')),
        );
        _fetchInformations(); // อัปเดตข้อมูล
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting information: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(onPressed: _logout, icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/TSU.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (userProvider.isAuthentication())
                Text(
                  'Hi ${userProvider.user.name} !',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              SizedBox(height: 20),
              if (informations.isEmpty)
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: informations.length,
                    itemBuilder: (context, index) {
                      final information = informations[index];
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.all(16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(information.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text('SURNAME  : ${information.surname}'),
                              SizedBox(height: 5),
                              Text('BITHDAY  : ${information.birthday}'),
                              SizedBox(height: 5),
                              Text('AGE  : ${information.age}'),
                              SizedBox(height: 5),
                              Text('SEX  : ${information.sex}'),
                              SizedBox(height: 5),
                              Text('STATUS  : ${information.status}'),
                              SizedBox(height: 5),
                              Text('BLOODGROUP  : ${information.bloodGroup}'),
                              SizedBox(height: 5),
                              Text('NATIONALITY  : ${information.nationality}'),
                              SizedBox(height: 5),
                              Text('ETHNICITY  : ${information.ethnicity}'),
                              SizedBox(height: 5),
                              Text('RELIGION  : ${information.religion}'),
                              SizedBox(height: 5),
                              Text('ADDRESS  : ${information.address}'),
                              SizedBox(height: 5),
                              Text('EMAIL  : ${information.email}'),
                              SizedBox(height: 5),
                              Text('PHONENUMBER  : ${information.phonenumber}'),
                              SizedBox(height: 5),
                              Text('SHOPNAME  : ${information.shopname}'),
                              SizedBox(height: 5),
                              Text(
                                  'RENEWALPERIOD  : ${information.renewalPeriod}'),
                              SizedBox(height: 5),
                              Text(
                                  'DATEINFORMATION  : ${information.dateInformation}'),
                              SizedBox(height: 5),
                              Text(
                                  'EXPIRESINFORMATION  : ${information.expiresInformation}'),
                              SizedBox(height: 5),
                              Text('STARTDATE  : ${information.startdate}'),
                              SizedBox(height: 5),
                              Text(
                                  'HISTORYINFORMATION  : ${information.historyInformation}'),
                              SizedBox(height: 5),
                              Text('LOCATION  : ${information.location}'),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 40, 228, 30), // สีพื้นหลัง
                                      border: Border.all(color: const Color.fromARGB(255, 243, 245, 243)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: IconButton(
                                      onPressed: () =>
                                          _toUpdateProduct(information),
                                      icon: Icon(Icons.edit_note_rounded),
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      tooltip: 'Edit Information',
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 1, 26), // สีพื้นหลัง
                                      border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: IconButton(
                                      onPressed: () =>
                                          _deleteInformation(information),
                                      icon: Icon(Icons.delete_outline),
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      tooltip: 'Delete Information',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toAddProduct,
        child: Icon(Icons.add),
        tooltip: 'Add Information',
      ),
    );
  }
}
