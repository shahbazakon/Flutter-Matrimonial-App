import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class PostData {
  TextEditingController? emailController;
  TextEditingController phoneController;

  PostData(this.emailController, this.phoneController);

 SignIndata() async {
    try {
      var formData = {
        'phone': phoneController.toString(),
        'email': emailController != null ? emailController.toString() : null,
      };

      var res = await Dio()
          .post('https://kiska.co.in/app/api/v1/createuser', data: formData)
          .then((response) {
        response.statusCode == 200
            ? print("successful ${response.data}")
            : print("fail");

        print("returned userID ${response.data["data"]} ");
        return response.data["data"];
      });
      return res;

    } on DioError catch (e) {
      if (e.response != null) {
        print(e.message);
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response);
      } else {
        print("fail");
        print(e.message);
      }
    }
  }
}

class AddAccountDetails {
  String? first_name;
  String? sceond_name;
  String? nick_name;
  String? mother_tongue;
  String? heightControlar;
  String? genderValue;
  String? DOBController;
  String? TOBController;
  String? cityController;
  String? religinController;
  String? castController;
  String? subCastController;
  String? maritalStatus;

  AddAccountDetails(
      this.first_name,
      this.sceond_name,
      this.nick_name,
      this.mother_tongue,
      this.heightControlar,
      this.genderValue,
      this.DOBController,
      this.TOBController,
      this.cityController,
      this.religinController,
      this.castController,
      this.subCastController,
      this.maritalStatus);

  AddDetails(userId) async {

    print("AddDetails Called");
    print("AddDetails: https://kiska.co.in/app/api/v1/createpersonaldetail/$userId");

    try {
      var formData = {
        'fname': first_name,
        'lname': sceond_name,
        'nname': nick_name,
        'gender': genderValue,
        'height': double.parse("$heightControlar"),
        'mtongue': mother_tongue,
        'DOB': DOBController,
        'TOB': TOBController,
        'POB': cityController,
        'religion': religinController,
        'mstatus': maritalStatus,
        'caste': castController,
        'subcaste': subCastController
      };

      var res = await Dio()
          .post('https://kiska.co.in/app/api/v1/createpersonaldetail/$userId',
              data: formData)
          .then((response) {
        response.statusCode == 200
            ? print("successful addDetails ")
            : print("fail");
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.message);
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response);
      } else {
        print("fail");
        print(e.message);
      }
    }
  }
}



class AddPresonalDetails {

  String? bodyShapeValue;
  String? bloodGroupValue;
  String? bioController;
  String? locationController;
  String? gothramController;
  String? doshamController;
  String? starController;
  String? raasiController;
  String? mgothramController;

  AddPresonalDetails(
      this.bodyShapeValue,
      this.bloodGroupValue,
      this.bioController,
      this.locationController,
      this.gothramController,
      this.doshamController,
      this.starController,
      this.raasiController,
      this.mgothramController,
  );

  AddDetails(userId) async {

    print("Add Personal Details Called");
    print("AddDetails: https://kiska.co.in/app/api/v1/createextradetails/$userId");

    try {
      var formData = {
        'bio': bioController,
        'bshape' : bodyShapeValue,
        'bgroup' : bloodGroupValue,
        'location': locationController,
        'gothram': gothramController,
        'dosham': doshamController,
        'star': starController,
        'raasi': raasiController,
        'mgothram': mgothramController,
      };

      var res = await Dio()
          .post('https://kiska.co.in/app/api/v1/createextradetails/$userId',
          data: formData)
          .then((response) {
        response.statusCode == 200
            ? print("successful add Personal Details ")
            : print("fail");
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.message);
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response);
      } else {
        print("fail");
        print(e.message);
      }
    }
  }
}

class AddEduAndCar {
  String? qualificationController;
  String? designationController;
  String? workController;
  String? organizationController;
  String? salaryController;

  AddEduAndCar(
      this.qualificationController,
      this.designationController,
      this.workController,
      this.organizationController,
      this.salaryController);
  AddDetails(userId) async {

    print("Add Education and Career Called");
    print("Add Education and Career Details: https://kiska.co.in/app/api/v1/createeduandcar/$userId");

    try {
      var formData = {
        'hqualification': qualificationController,
        'designation': designationController,
        'wdomain': workController,
        'oname': organizationController,
        'salary': salaryController,
      };

      var res = await Dio()
          .post('https://kiska.co.in/app/api/v1/createeduandcar/$userId',
          data: formData)
          .then((response) {
        response.statusCode == 200
            ? print("successful add Education and Career Details ")
            : print("fail");
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.message);
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response);
      } else {
        print("fail");
        print(e.message);
      }
    }
  }
}



// #####################################################################################################


class editProfileDetails {
  String? first_name;
  String? sceond_name;
  String? nick_name;
  String? mother_tongue;
  String? heightControlar;
  String? genderValue;
  String? DOBController;
  String? TOBController;
  String? cityController;
  String? religinController;
  String? castController;
  String? subCastController;
  String? maritalStatus;

  editProfileDetails(
      this.first_name,
      this.sceond_name,
      this.nick_name,
      this.mother_tongue,
      this.heightControlar,
      this.genderValue,
      this.DOBController,
      this.TOBController,
      this.cityController,
      this.religinController,
      this.castController,
      this.subCastController,
      this.maritalStatus);

  editDetails(userId) async {

    print("editProfileDetails Called");
    print("editDetails: https://kiska.co.in/app/api/v1/createpersonaldetail/$userId");

    try {
      var formData = {
        'fname': first_name,
        'lname': sceond_name,
        'nname': nick_name,
        'gender': genderValue,
        'height': double.parse("${heightControlar}"),
        'mtongue': mother_tongue,
        'DOB': DOBController,
        'TOB': TOBController,
        'POB': cityController,
        'religion': religinController,
        'mstatus': maritalStatus,
        'caste': castController,
        'subcaste': subCastController
      };

      var res = await Dio()
          .put('https://kiska.co.in/app/api/v1/editpersonaldetails/$userId',
          data: formData)
          .then((response) {
        response.statusCode == 200
            ? print("successful editProfileDetails ")
            : print("fail");
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.message);
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response);
      } else {
        print("fail");
        print(e.message);
      }
    }
  }
}

class editPresonalDetails {

  String? bodyShapeValue;
  String? bloodGroupValue;
  String? bioController;
  String? locationController;
  String? gothramController;
  String? doshamController;
  String? starController;
  String? raasiController;
  String? mgothramController;

  editPresonalDetails(
      this.bodyShapeValue,
      this.bloodGroupValue,
      this.bioController,
      this.locationController,
      this.gothramController,
      this.doshamController,
      this.starController,
      this.raasiController,
      this.mgothramController,
      );

  editDetails(userId) async {

    print("edit Personal Details Called");
    print("editDetails: https://kiska.co.in/app/api/v1/createextradetails/$userId");

    try {
      var formData = {
        'bio': bioController,
        'bshape' : bodyShapeValue,
        'bgroup' : bloodGroupValue,
        'location': locationController,
        'gothram': gothramController,
        'dosham': doshamController,
        'star': starController,
        'raasi': raasiController,
        'mgothram': mgothramController,
      };

      var res = await Dio()
          .put('https://kiska.co.in/app/api/v1/createextradetails/$userId',
          data: formData)
          .then((response) {
        response.statusCode == 200
            ? print("successful edit Personal Details ")
            : print("fail");
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.message);
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response);
      } else {
        print("fail");
        print(e.message);
      }
    }
  }
}



class editEduAndCar {
  String? qualificationController;
  String? designationController;
  String? workController;
  String? organizationController;
  String? salaryController;

  editEduAndCar(
      this.qualificationController,
      this.designationController,
      this.workController,
      this.organizationController,
      this.salaryController);
  editDetails(userId) async {

    print("Add Education and Career Called");
    print("Add Education and Career Details: https://kiska.co.in/app/api/v1/editeduandcardetails/$userId");

    try {
      var formData = {
        'hqualification': qualificationController,
        'designation': designationController,
        'wdomain': workController,
        'oname': organizationController,
        'salary': salaryController,
      };

      var res = await Dio()
          .put('https://kiska.co.in/app/api/v1/editeduandcardetails/$userId',
          data: formData)
          .then((response) {
        response.statusCode == 200
            ? print("successful add Education and Career Details ")
            : print("fail");
      });
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.message);
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response);
      } else {
        print("fail");
        print(e.message);
      }
    }
  }
}

