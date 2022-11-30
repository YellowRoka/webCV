import 'dart:convert';

import 'package:flutter/services.dart';

import 'jsonBasedataObjs.dart';
import 'jsonJobsObjs.dart';

late JobConverter      jobsEN;
late BaseDataConverter baseDataEN;

late JobConverter      jobsHU;
late BaseDataConverter baseDataHU;

Future <bool> readJSONData() async {
  bool isLoaded = false;

  var jsonString = await rootBundle.loadString('assets/jsons/jobs_en.json'); //ON LINUX & WINDOWS
  var jsonModel  = json.decode(jsonString);
  jobsEN         = JobConverter.fromJson(jsonModel);

  jsonString = await rootBundle.loadString('assets/jsons/basedata_en.json'); //ON LINUX & WINDOWS
  jsonModel  = json.decode(jsonString);
  baseDataEN = BaseDataConverter.fromJson(jsonModel);

  jsonString = await rootBundle.loadString('assets/jsons/jobs_hu.json'); //ON LINUX & WINDOWS
  jsonModel  = json.decode(jsonString);
  jobsHU     = JobConverter.fromJson(jsonModel);

  jsonString = await rootBundle.loadString('assets/jsons/basedata_hu.json'); //ON LINUX & WINDOWS
  jsonModel  = json.decode(jsonString);
  baseDataHU = BaseDataConverter.fromJson(jsonModel);

  isLoaded = true;
  
  return isLoaded;
}