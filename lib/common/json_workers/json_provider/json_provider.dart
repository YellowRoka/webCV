import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_cv/common/json_workers/data_struct/json_data_struct.dart';
import 'package:web_cv/common/json_workers/json_readers.dart';


//https://stackoverflow.com/questions/71818501/how-to-fix-lateinitializationerror-field-data-has-not-been-initialized-error
//https://muddassirm.medium.com/load-json-data-in-flutter-in-different-ways-e3312e6a317a

class JsonDataProvider extends ChangeNotifier{

  bool isLoaded = false;

  JsonReaders     jsonHandler = JsonReaders();
  JsonDataStruct? jsonDataPack;

  Future<void> load() async {
    if(!isLoaded){
      isLoaded = await jsonHandler.readJSONData();
    }

    jsonDataPack = JsonDataStruct( 
      jsonHandler.jobsEN,
      jsonHandler.baseDataEN,
      jsonHandler.jobsHU,
      jsonHandler.baseDataHU,
      jsonHandler.webLinks
    );

    if( isLoaded ){
       //isLoaded = false;
      notifyListeners();
      log("-------------loaded jsons----------");
    }
  }

  JsonDataStruct? readAllData() => jsonDataPack;

}
