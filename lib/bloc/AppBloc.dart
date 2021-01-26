import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pro_zone/models/provider.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc{

  var _accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjEwNzI4MjAzLCJleHAiOjE2MTMzMjAyMDN9.7TKlfBKkf8jw9FPjo91z7gQxvLB21ycXphEkH6-_Cc0";

  final _loadingListSubject = BehaviorSubject<bool>();
  final _providerSubject = BehaviorSubject<List<Provider>>();

  AppBloc();

  Stream<bool> get loadingListState{
    return _loadingListSubject.stream;
  }

  Stream<List<Provider>> get providerData{
    return _providerSubject.stream;
  }

  Future<void> getProviders(String query, String sortBy) async{

    //ENDPOINT IS NOT RETURNING CORRECT DATA FOR _contains AND _sort

    _loadingListSubject.add(true);
    debugPrint("Starting to fetch providers");
    var url = "https://pro-zone.herokuapp.com/providers";
    var dio = Dio(BaseOptions(
      headers: {"Authorization" : "Bearer $_accessToken"},

      queryParameters:
        query != null && sortBy != null? {"_contains": "$query", "_sort": sortBy} :
        query != null && sortBy == null? {"_contains": "$query"}:
        query == null && sortBy != null? {"_sort": sortBy}:
            {}
    ));

    dio.interceptors.add(InterceptorsWrapper(
        onError: (DioError e) async{

          debugPrint("Fetching Providers Error: ${e.message},  $e");
          _loadingListSubject.add(false);
        }
    ));

    try{
      Response response = await dio.get(url);
      if(response.data != null){

        var responseData = response.data;
        List<Provider> providers = List();
        responseData.forEach((f) => providers.add(Provider.fromJson(f)));

        _providerSubject.add(providers);
        _loadingListSubject.add(false);
      }
    }catch(e){
      //print(e);
    }
  }


}