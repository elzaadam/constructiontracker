import 'dart:developer';
import 'package:constructionguide/models/categorymodel.dart';
import 'package:constructionguide/models/commonmodel.dart';
import 'package:constructionguide/models/employeeslistmodel.dart';
import 'package:constructionguide/models/sitedetailsmodel.dart';
import 'package:constructionguide/models/sitelistmodel.dart';
import 'package:constructionguide/prefmanager/Prefmanager.dart';
import 'package:constructionguide/sever/webclient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class MainBloc extends Bloc<MainEvents, MainStates> {
  String? workId;
  MainBloc() : super(MainStates()) {
    on<VerifyAccount>(verifyaccount);
    on<GetSiteList>(getSiteList);
    on<GetSiteDetails>(getSiteDetails);

    on<VerifyEdittedSite>(verifyEdittedSite);
    on<VerifyNewSite>(verifyNewSite);
    on<GetEmployeesList>(getEmployeesList);
    on<VerifyNewEmployee>(verifyNewEmployee);
    on<Categorylist>(categorylist);
    on<DeleteEmployees>(deleteEmployees);
    on<AssignEmployees>(assignEmployees);
  }

  Future<FutureOr<void>> verifyaccount(
      VerifyAccount event, Emitter<MainStates> emit) async {
    Commonmodel commonmodel;
    // emit(abd());
    Map map = {"phone": event.name, "password": event.password};
    print(map);
    try {
      emit(Loading());
      commonmodel = Commonmodel.fromJson(await WebClient.post(
        '/user/login',
        map,
      ));
      if (commonmodel.status == true) {
        await PrefManager.setToken(commonmodel.token.toString());
        //  Helper.showToast(msg: "OTP Successfully sent");
        var token = await PrefManager.getToken();
        log(token.toString());
        emit(LoginSuccess());
      } else {
        emit(LoginError());
      }
    } catch (e) {
      emit(LoginError());
      log("Exception on authentication : $e");
    }
  }

  Future<FutureOr<void>> getSiteList(
      GetSiteList event, Emitter<MainStates> emit) async {
    Sitetlistmodel sitelistmodel;
    // emit(abd());

    try {
      emit(Loading());
      sitelistmodel = Sitetlistmodel.fromJson(await WebClient.get(
        '/client/site/list',
      ));
      if (sitelistmodel.status == true) {
        emit(SitelistSuccess(sitelistmodel: sitelistmodel));
        print("Success");
      } else {
        print("Failed");
        emit(SitelistError());
      }
    } catch (e) {
      emit(SitelistError());
      log("Exception on authentication : $e");
    }
  }

  Future<FutureOr<void>> verifyNewSite(
      VerifyNewSite event, Emitter<MainStates> emit) async {
    Commonmodel commonmodel;

    // emit(abd());
    Map map = {
      "siteName": event.siteName,
      "siteLocation": event.siteLocation,
      "work": event.work,
      "siteContactAddress": event.siteContactAddress,
      "siteContactPhone": event.siteContactPhone,
      "contactPersonName": event.contactPersonName,
      "lat": event.lat,
      "lon": event.lon,
    };
    print(map);
    try {
      emit(Loading());
      commonmodel = Commonmodel.fromJson(await WebClient.post(
        '/client/add/site',
        map,
      ));
      if (commonmodel.status == true) {
        emit(AddSiteSuccess());
      } else {
        emit(AddingSiteError());
      }
    } catch (e) {
      emit(AddingSiteError());
      log("Exception on authentication : $e");
    }
  }

  Future<FutureOr<void>> getSiteDetails(
      GetSiteDetails event, Emitter<MainStates> emit) async {
    Sitedetailsmodel sitedetailsmodel;
    // emit(abd());
    Map map = {
      "id": event.id,
    };
    print(map);
    try {
      emit(Loading());
      sitedetailsmodel = Sitedetailsmodel.fromJson(await WebClient.post(
        '/client/site/view',
        map,
      ));
      if (sitedetailsmodel.status == true) {
        emit(SitedetailsSuccess(sitedetailsmodel: sitedetailsmodel));
      } else {
        emit(SitedetailsError());
      }
    } catch (e) {
      emit(SitedetailsError());
      log("Exception on authentication : $e");
    }
  }

  // //Edit Site
  // Future<FutureOr<void>> getEditSite(
  //     GetEditSite event, Emitter<MainStates> emit) async {
  //   Commonmodel commonmodel;
  //   // emit(abd());
  //   Map map = {"id": event.id, "position": event.position};
  //   print(map);
  //   try {
  //     emit(Loading());
  //     commonmodel = Commonmodel.fromJson(await WebClient.post(
  //       '/client/edit/site',
  //       map,
  //     ));
  //     if (commonmodel.status == true) {
  //       emit(EditSiteSuccess());
  //     } else {
  //       emit(EditSiteError());
  //     }
  //   } catch (e) {
  //     emit(EditSiteError());
  //     log("Exception on authentication : $e");
  //   }
  // }

  Future<FutureOr<void>> getEmployeesList(
      GetEmployeesList event, Emitter<MainStates> emit) async {
    EmployeesListModel employeeslistmodel;

    try {
      emit(Loading());
      employeeslistmodel = EmployeesListModel.fromJson(await WebClient.get(
        '/client/workers/list',
      ));
      if (employeeslistmodel.status == true) {
        emit(EmployeeslistSuccess(employeeslistmodel: employeeslistmodel));
        print("Success");
      } else {
        print("Failed");
        emit(EmployeeslistError());
      }
    } catch (e) {
      emit(EmployeeslistError());
      log("Exception on authentication : $e");
    }
  }

  // verify editted site list
  Future<FutureOr<void>> verifyEdittedSite(
      VerifyEdittedSite event, Emitter<MainStates> emit) async {
    Commonmodel commonmodel;
    Map map = {
      "id": event.id,
      "siteName": event.siteName,
      "siteLocation": event.siteLocation,
      "work": event.work,
      "siteContactAddress": event.siteContactAddress,
      "siteContactPhone": event.siteContactPhone,
      "contactPersonName": event.contactPersonName,
      "lat": event.lat,
      "lon": event.lon
    };
    print(map);
    try {
      emit(Loading());
      commonmodel = Commonmodel.fromJson(await WebClient.post(
        '/client/edit/site',
        map,
      ));
      if (commonmodel.status == true) {
        emit(EdittingSiteSuccess());
      } else {
        emit(EdittingSiteError());
      }
    } catch (e) {
      emit(EdittingSiteError());
      log("Exception on authentication : $e");
    }
  }

///////////////////////////////////////
///////////////////////////////////////
  Future<FutureOr<void>> categorylist(
      Categorylist event, Emitter<MainStates> emit) async {
    Categorymodel categorymodel;

    try {
      emit(Categoryloading());
      categorymodel = Categorymodel.fromJson(await WebClient.get(
        '/category/list',
      ));
      if (categorymodel.status == true) {
        workId = categorymodel.data![0].sId!.toString();
        emit(CategorylistSuccess(categorymodel: categorymodel));
        print("Success");
      } else {
        print("Failed");
        emit(CategorylistError());
      }
    } catch (e) {
      emit(EmployeeslistError());
      log("Exception on authentication : $e");
    }
  }

  Future<FutureOr<void>> verifyNewEmployee(
      VerifyNewEmployee event, Emitter<MainStates> emit) async {
    Commonmodel commonmodel;
    Map map = {
      "name": event.name,
      "gender": event.gender,
      "addess": event.address,
      "password": event.password,
      "dailyWage": event.dailywage,
      "workTypeId": workId,
      "overtimeAmount": event.overtimeAmount,
      "phone": event.phonenumber,
      "district": event.district,
      "state": event.state,
    };
    print(map);
    try {
      emit(Loading());
      commonmodel = Commonmodel.fromJson(await WebClient.post(
        '/client/add/worker',
        map,
      ));
      if (commonmodel.status == true) {
        emit(AddEmployeeSuccess());
      } else {
        emit(AddingEmployeeError());
      }
    } catch (e) {
      emit(AddingEmployeeError());
      log("Exception on authentication : $e");
    }
  }
}

Future<FutureOr<void>> deleteEmployees(
    DeleteEmployees event, Emitter<MainStates> emit) async {
  Commonmodel commonmodel;

  // emit(abd());
  Map map = {"id": event.id};
  print(map);
  try {
    emit(Loading());
    commonmodel = Commonmodel.fromJson(await WebClient.post(
      '/client/worker/delete',
      map,
    ));
    if (commonmodel.status == true) {
      emit(DeleteEmployeeSuccess());
    } else {
      emit(DeleteEmployeesError());
    }
  } catch (e) {
    emit(DeleteEmployeesError());
    log("Exception on authentication : $e");
  }
}

// assignEmployees
Future<FutureOr<void>> assignEmployees(
    AssignEmployees event, Emitter<MainStates> emit) async {
  Commonmodel commonmodel;

  // emit(abd());
  Map map = {"id": event.id};
  print(map);
  try {
    emit(Loading());
    commonmodel = Commonmodel.fromJson(await WebClient.post(
      '/client/worker/assign/task',
      map,
    ));
    if (commonmodel.status == true) {
      emit(AssignEmployeesSuccess());
    } else {
      emit(AssignEmployeesError());
    }
  } catch (e) {
    emit(AssignEmployeesError());
    log("Exception on authentication : $e");
  }
}

class MainStates {}

class LoginInitial extends MainStates {}

class MainEvents {}

class Loading extends MainStates {}

class LoginSuccess extends MainStates {}

class LoginError extends MainStates {
  final String? error;
  LoginError({this.error});
}

class VerifyAccount extends MainEvents {
  final String? name, password;

  VerifyAccount({
    this.name,
    this.password,
  });
}

class GetSiteList extends MainEvents {
  final String? sitename,
      status,
      sitelocation,
      contactpersonname,
      contactpersonnumber;
  GetSiteList({
    this.sitename,
    this.status,
    this.sitelocation,
    this.contactpersonname,
    this.contactpersonnumber,
  });
}

class SitelistSuccess extends MainStates {
  final Sitetlistmodel sitelistmodel;
  SitelistSuccess({required this.sitelistmodel});
}

class SitelistError extends MainStates {
  final String? error;
  SitelistError({this.error});
}

//VerifyNewSite

class VerifyNewSite extends MainEvents {
  final String? siteName,
      siteLocation,
      work,
      siteContactAddress,
      siteContactPhone,
      contactPersonName,
      lat,
      lon;
  VerifyNewSite(
      {this.siteName,
      this.siteLocation,
      this.work,
      this.siteContactAddress,
      this.siteContactPhone,
      this.contactPersonName,
      this.lat,
      this.lon});
}

class SiteAdding extends MainStates {}

class AddSiteSuccess extends MainStates {}

class AddingSiteError extends MainStates {
  final String? error;
  AddingSiteError({this.error});
}

class GetSiteDetails extends MainEvents {
  final String? id, position;

  GetSiteDetails({this.id, this.position});
}

class SitedetailsSuccess extends MainStates {
  final Sitedetailsmodel sitedetailsmodel;
  SitedetailsSuccess({required this.sitedetailsmodel});
}

// class SitelistSuccess extends MainStates {
//   final Sitetlistmodel sitelistmodel;
//   SitelistSuccess({required this.sitelistmodel});
// }
class SitedetailsError extends MainStates {
  final String? error;
  SitedetailsError({this.error});
}

class GetEditSite extends MainEvents {
  final String? id, position;

  GetEditSite({
    this.id,
    this.position,
  });
}

class EditSiteSuccess extends MainStates {}

class EditSiteError extends MainStates {
  final String? error;
  EditSiteError({this.error});
}

class VerifyEdittedSite extends MainEvents {
  final String? id,
      siteName,
      siteLocation,
      work,
      siteContactAddress,
      siteContactPhone,
      contactPersonName,
      lat,
      lon;
  VerifyEdittedSite({
    this.id,
    this.siteName,
    this.siteLocation,
    this.work,
    this.siteContactAddress,
    this.siteContactPhone,
    this.contactPersonName,
    this.lat,
    this.lon,
  });
}

class EditSiteloading extends MainStates {}

class EdittingSiteSuccess extends MainStates {}

class EdittingSiteError extends MainStates {
  final String? error;
  EdittingSiteError({this.error});
}

class GetEmployeesList extends MainEvents {
  final String? id, workid, name, status, phone, district;
  GetEmployeesList({
    this.id,
    this.workid,
    this.name,
    this.status,
    this.phone,
    this.district,
  });
}

class EmployeeslistSuccess extends MainStates {
  final EmployeesListModel employeeslistmodel;
  EmployeeslistSuccess({required this.employeeslistmodel});
}

class EmployeeslistError extends MainStates {
  final String? error;
  EmployeeslistError({this.error});
}

class Categorylist extends MainEvents {}

class Categoryloading extends MainStates {}

class CategorylistSuccess extends MainStates {
  final Categorymodel categorymodel;
  CategorylistSuccess({required this.categorymodel});
}

class CategorylistError extends MainStates {
  final String? error;
  CategorylistError({this.error});
}

class VerifyNewEmployee extends MainEvents {
  final String? name,
      gender,
      address,
      password,
      dailywage,
      overtimeAmount,
      phonenumber,
      district,
      state;

  VerifyNewEmployee(
      {this.name,
      this.gender,
      this.address,
      this.password,
      this.dailywage,
      this.overtimeAmount,
      this.phonenumber,
      this.district,
      this.state});
}

class AddEmployeeSuccess extends MainStates {}

class AddingEmployeeError extends MainStates {
  final String? error;
  AddingEmployeeError({this.error});
}

class DeleteEmployees extends MainEvents {
  final String? id;

  DeleteEmployees({this.id});
}

class DeleteEmployeeSuccess extends MainStates {}

class DeleteEmployeesError extends MainStates {
  final String? error;
  DeleteEmployeesError({this.error});
}

class AssignEmployees extends MainEvents {
  final String? id;

  AssignEmployees({this.id});
}

class Assigning extends MainStates {}

class AssignEmployeesSuccess extends MainStates {}

class AssignEmployeesError extends MainStates {
  final String? error;
  AssignEmployeesError({this.error});
}
