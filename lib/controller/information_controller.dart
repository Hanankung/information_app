import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:information_app/controller/auth_controller.dart';
import 'package:information_app/models/information.dart';
import 'package:information_app/provider/user_provider.dart';
import 'package:information_app/varibles.dart';

class informationSurvice {
  //get information
  Future<void> _response(
      http.Response response, UserProvider userProvider) async {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else if (response.statusCode == 403) {
      await AuthSurvice().refreshToken(userProvider);
    } else if (response.statusCode == 401) {
      userProvider.onlogout();
      throw Exception('Unauthorized');
    } else {
      throw Exception('Error : ${response.statusCode} - ${response.body}');
    }
  }

  Future<List<InformationModel>> fetchInformations(
      UserProvider userProvider) async {
    final response =
        await http.get(Uri.parse('$apiURL/api/information'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${userProvider.accessToken}',
    });

    await _response(response, userProvider);

    List<dynamic> informationList = jsonDecode(response.body);
    return informationList
        .map((json) => InformationModel.fromJson(json))
        .toList();
  }

  //add information
  Future<void> addInformation(
      InformationModel informationModel, UserProvider userProvider) async {
    final response = await http.post(Uri.parse('$apiURL/api/information'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${userProvider.accessToken}',
        },
        body: jsonEncode(informationModel.toJson()));
    await _response(response, userProvider);
  }

  //update information
  Future<void> updateInformation(
      InformationModel informationModel, UserProvider userProvider) async {
    final response = await http.put(
        Uri.parse('$apiURL/api/information/${informationModel.id}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${userProvider.accessToken}',
        },
        body: jsonEncode(informationModel.toJson()));
    await _response(response, userProvider);
  }

  //delete information
  Future<void> deleteInformation(
      String information_id, UserProvider userProvider) async {
    final response = await http.delete(
      Uri.parse('$apiURL/api/information/${information_id}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userProvider.accessToken}',
      },
    );
    await _response(response, userProvider);
  }
}
