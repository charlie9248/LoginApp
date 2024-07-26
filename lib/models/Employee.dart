import 'dart:convert';

import 'package:equatable/equatable.dart';

class Employee  extends Equatable{
  String name;
  String surname;
  String address;
  String password;

  Employee({
    required this.name,
    required this.surname,
    required this.address,
  required this.password,
  });

  // Method to convert a User instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'address': address,
      'password': password
    };
  }

  // Factory constructor to create a User instance from a JSON map
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      surname: json['surname'],
      address: json['address'],
      password : json['password'],
    );
  }

  // Method to convert a User instance to a JSON string
  String toJsonString() {
    return jsonEncode(toJson());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name , surname , address , password];
}

