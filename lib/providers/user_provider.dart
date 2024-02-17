import 'package:flutter/material.dart';
import 'package:portfolio/models/profile.dart';
import 'package:portfolio/repositories/profile_repository.dart';

class UserProvider extends ChangeNotifier {
  late ProfileModel _profile;
  ProfileModel get profile => _profile;

  Future<void> getProfile() async {
    ProfileModel? profileModel = await ProfileRepository().getProfile();

    if (profileModel == null) {
      await getProfile();
    } else {
      _profile = profileModel;
    }
  }
}
