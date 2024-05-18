import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_swift/routes/app_route_name.dart';

class HomeScreenController extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users
        .add({
          'date': "2", // John Doe
          'description': "i", // Stokes and Sons
          'priority': 1,
          "time": "d",
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> getUser() async {
    const source = Source.cache;
    users.get(const GetOptions(source: source)).then(
          (res) => print("Successfully completed${res}"),
          onError: (e) => print("Error completing: $e"),
        );
  }

  void logout() async {
    await GoogleSignIn().signOut();

    Get.offAllNamed(AppRouteName.loginScreen);
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
  }
}
