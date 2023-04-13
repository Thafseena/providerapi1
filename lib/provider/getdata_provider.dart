import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:providerapi1/model/response_data.dart';

class GetDataProvider extends ChangeNotifier{
  ResponseData responseData=ResponseData();
  bool isLoading=false;

  getMyData() async{
    isLoading=true;
    responseData= await getAllData();
    isLoading=false;
    notifyListeners();
  }

  Future<ResponseData> getAllData() async{
  
  try{
   final response=await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
   if(response.statusCode==200){
    final item=json.decode(response.body);
    responseData=ResponseData.fromJson(item);
     notifyListeners();
   }else{
    print("else");
   }
  }catch(e){
    log(e.toString());
  }

  return responseData;
  }
}