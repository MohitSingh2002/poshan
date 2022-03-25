import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  
  Future<bool> isAdminExist(String userType, String pin) async {
    var snapshot = await FirebaseFirestore.instance.collection(userType == 'Central' ? 'centralLogin' : userType == 'State' ? 'stateLogin' : 'districtLogin').where('pin', isEqualTo: pin).get();
    return snapshot.docs.isNotEmpty;
  }
  
  Future<List<String>> getStatesList() async {
    var response = await FirebaseFirestore.instance.collection('states').get();
    List<String> states = [];
    response.docs.forEach((element) {
      states.add(element.get('name'));
    });
    return states;
  }

  Future<List<String>> getDistrictsList(String stateName) async {
    var response = await FirebaseFirestore.instance.collection('states').doc(stateName).collection('districts').get();
    List<String> districts = [];
    response.docs.forEach((element) {
      districts.add(element.get('name'));
    });
    return districts;
  }

  Future<List<String>> getSchoolsList(String stateName, String districtName) async {
    var response = await FirebaseFirestore.instance.collection('states').doc(stateName).collection('districts').doc(districtName).collection('school').get();
    List<String> schools = [];
    response.docs.forEach((element) {
      schools.add(element.get('name'));
    });
    return schools;
  }
  
}
