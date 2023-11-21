import 'dart:developer';
import 'package:constructionguide/models/commonmodel.dart';
import 'package:constructionguide/models/sitelistmodel.dart';
import 'package:constructionguide/prefmanager/Prefmanager.dart';
import 'package:constructionguide/sever/webclient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class MainBloc extends Bloc<MainEvents, MainStates> {
  MainBloc() : super(LoginInitial()) {
    on<VerifyAccount>(verifyaccount);
    on<GetSiteList>(getSiteList);
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
