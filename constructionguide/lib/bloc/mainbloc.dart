import 'dart:developer';
import 'package:constructionguide/models/commonmodel.dart';
import 'package:constructionguide/models/employeeslistmodel.dart';
import 'package:constructionguide/models/sitedetailsmodel.dart';
import 'package:constructionguide/models/sitelistmodel.dart';
import 'package:constructionguide/prefmanager/Prefmanager.dart';
import 'package:constructionguide/sever/webclient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class MainBloc extends Bloc<MainEvents, MainStates> {
  MainBloc() : super(LoginInitial()) {
    on<VerifyAccount>(verifyaccount);
    on<GetSiteList>(getSiteList);
    on<GetSiteDetails>(getSiteDetails);
    on<VerifyNewSite>(verifyNewSite);
    on<GetEmployeesList>(getEmployeesList);
  }
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
  final String? id;

  GetSiteDetails({
    this.id,
  });
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

class GetEmployeesList extends MainEvents {
  final String? name, status, phone, district;
  GetEmployeesList({
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
