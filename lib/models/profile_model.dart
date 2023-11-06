import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel {
  String? documentId;
  late String firstName;
  late String lastName;
  late String email;
  late String phone;
  late String about;
  late Timestamp createdAt;

  ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.about,
  });

  ProfileModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    firstName = documentSnapshot['First Name'];
    lastName = documentSnapshot['Last Name'];
    email = documentSnapshot['Email'];
    phone = documentSnapshot['Phone'];
    about = documentSnapshot['About'];
    createdAt = documentSnapshot['created_at'];
  }
}
