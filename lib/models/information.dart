// To parse this JSON data, do
//
//     final informationModel = informationModelFromJson(jsonString);

import 'dart:convert';

InformationModel informationModelFromJson(String str) => InformationModel.fromJson(json.decode(str));

String informationModelToJson(InformationModel data) => json.encode(data.toJson());

class InformationModel {
    String name;
    String surname;
    String birthday;
    String age;
    String sex;
    String status;
    String bloodGroup;
    String nationality;
    String ethnicity;
    String religion;
    String address;
    String email;
    String phonenumber;
    String shopname;
    String renewalPeriod;
    String dateInformation;
    String expiresInformation;
    String startdate;
    String historyInformation;
    String location;
    String id;
    // DateTime createdAt;
    // DateTime updatedAt;

    InformationModel({
        required this.name,
        required this.surname,
        required this.birthday,
        required this.age,
        required this.sex,
        required this.status,
        required this.bloodGroup,
        required this.nationality,
        required this.ethnicity,
        required this.religion,
        required this.address,
        required this.email,
        required this.phonenumber,
        required this.shopname,
        required this.renewalPeriod,
        required this.dateInformation,
        required this.expiresInformation,
        required this.startdate,
        required this.historyInformation,
        required this.location,
        required this.id,
        // required this.createdAt,
        // required this.updatedAt,
    });

    factory InformationModel.fromJson(Map<String, dynamic> json) => InformationModel(
        name: json["name"],
        surname: json["surname"],
        birthday: json["birthday"],
        age: json["age"],
        sex: json["sex"],
        status: json["status"],
        bloodGroup: json["blood_group"],
        nationality: json["nationality"],
        ethnicity: json["ethnicity"],
        religion: json["religion"],
        address: json["address"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        shopname: json["shopname"],
        renewalPeriod: json["renewal_period"],
        dateInformation: json["date_information"],
        expiresInformation: json["expires_information"],
        startdate: json["startdate"],
        historyInformation: json["history_information"],
        location: json["location"],
        id: json["_id"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "birthday": birthday,
        "age": age,
        "sex": sex,
        "status": status,
        "blood_group": bloodGroup,
        "nationality": nationality,
        "ethnicity": ethnicity,
        "religion": religion,
        "address": address,
        "email": email,
        "phonenumber": phonenumber,
        "shopname": shopname,
        "renewal_period": renewalPeriod,
        "date_information": dateInformation,
        "expires_information": expiresInformation,
        "startdate": startdate,
        "history_information": historyInformation,
        "location": location,
        "_id": id,
        // "createdAt": createdAt.toIso8601String(),
        // "updatedAt": updatedAt.toIso8601String(),
    };
}
