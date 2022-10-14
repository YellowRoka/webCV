import 'dart:convert';

import 'package:flutter/services.dart';

import 'jsonBasedataObjs.dart';
import 'jsonJobsObjs.dart';

late JobConverter      jobs;
late BaseDataConverter baseData;

Future <bool> readJSONData() async {
  bool isLoaded = false;

  var jsonString = await rootBundle.loadString('assets/jsons/jobs.json'); //ON LINUX & WINDOWS
  var jsonModel  = json.decode(jsonString);
  jobs           = JobConverter.fromJson(jsonModel);

  jsonString = await rootBundle.loadString('assets/jsons/basedata.json'); //ON LINUX & WINDOWS
  jsonModel  = json.decode(jsonString);
  baseData   = BaseDataConverter.fromJson(jsonModel);

  isLoaded = true;
  
  return isLoaded;
}