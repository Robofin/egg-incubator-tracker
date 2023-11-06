import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/profile_model.dart';
import 'firebase_auth_constants.dart';

class FirestoreDb {
  // Profile CRUD
  static addProfile(ProfileModel profileModel) async {
    await firebaseFirestore
        .collection('usersEggy')
        .doc(auth.currentUser!.uid)
        .collection('profile')
        .add({
      'First Name': profileModel.firstName,
      'Last Name': profileModel.lastName,
      'Email': profileModel.email,
      'Phone': profileModel.phone,
      'About': profileModel.about,
      'created_at': FieldValue.serverTimestamp(),
    });
  }

  static Stream<List<ProfileModel>> oneProfileStream() {
    return firebaseFirestore
        .collection('usersEggy')
        .doc(auth.currentUser!.uid)
        .collection('profile')
        .where('Email', isEqualTo: auth.currentUser!.email!)
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProfileModel> profiles_list = [];
      for (var profile in query.docs) {
        final profileModel =
            ProfileModel.fromDocumentSnapshot(documentSnapshot: profile);
        profiles_list.add(profileModel);
      }
      return profiles_list;
    });
  }

  static Stream<List<ProfileModel>> profileStream() {
    return firebaseFirestore
        .collection('usersEggy')
        .doc(auth.currentUser!.uid)
        .collection('profile')
        .snapshots()
        .map((QuerySnapshot query) {
      List<ProfileModel> profiles_list = [];
      for (var profile in query.docs) {
        final profileModel =
            ProfileModel.fromDocumentSnapshot(documentSnapshot: profile);
        profiles_list.add(profileModel);
      }
      return profiles_list;
    });
  }

  static updateProfile(docID, firstName, lastName, about, phone) async {
    await firebaseFirestore
        .collection('usersEggy')
        .doc(auth.currentUser!.uid)
        .collection('profile')
        .doc(docID)
        .update(
      {
        'First Name': firstName,
        'Last Name': lastName,
        'About': about,
        'Phone': phone,
      },
    );
  }
}
