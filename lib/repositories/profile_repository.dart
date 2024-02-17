import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/models/profile.dart';

class ProfileRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<ProfileModel?> getProfile() async {
    try {
      return ProfileModel.fromJson(
          (await firestore.collection('profile').doc('1').get()).data()!);
    } catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }
}
