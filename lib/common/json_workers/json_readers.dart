import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:web_cv/common/json_workers/json_basedata_objs.dart';
import 'package:web_cv/common/json_workers/json_jobs_objs.dart';
import 'package:web_cv/common/json_workers/json_links_data_objs.dart';


class JsonReaders {
  late JobConverter      jobsEN;
  late BaseDataConverter baseDataEN;
  late JobConverter      jobsHU;
  late BaseDataConverter baseDataHU;
  late LinksConverter    webLinks;
  
  bool isLoaded = false;

  Future <bool> readJSONData() async {
    isLoaded = false;
    await _readJobENG();
    await _readBasedataENG();
    await _readJobHUN();
    await _readBasedataHUN();
    await _readWeblinks();
    isLoaded = true;
    
    return isLoaded;
  }

  Future<void> _readJobENG() async {
    var jsonString = await rootBundle.loadString('assets/jsons/jobs_en.json'); //ON LINUX & WINDOWS
    var jsonModel  = json.decode(jsonString);
    jobsEN         = JobConverter.fromJson(jsonModel);
  }

  Future<void> _readBasedataENG() async {
    var jsonString = await rootBundle.loadString('assets/jsons/basedata_en.json'); //ON LINUX & WINDOWS
    var jsonModel  = json.decode(jsonString);
    baseDataEN     = BaseDataConverter.fromJson(jsonModel);
  }

  Future<void> _readJobHUN() async {
    var jsonString = await rootBundle.loadString('assets/jsons/jobs_hu.json'); //ON LINUX & WINDOWS
    var jsonModel  = json.decode(jsonString);
    jobsHU         = JobConverter.fromJson(jsonModel);
  }

  Future<void> _readBasedataHUN() async {
    var jsonString = await rootBundle.loadString('assets/jsons/basedata_hu.json'); //ON LINUX & WINDOWS
    var jsonModel  = json.decode(jsonString);
    baseDataHU = BaseDataConverter.fromJson(jsonModel);
  }

  Future<void> _readWeblinks() async {
    var jsonString = await rootBundle.loadString('assets/jsons/web_links.json'); //ON LINUX & WINDOWS
    var jsonModel  = json.decode(jsonString);
    webLinks       = LinksConverter.fromJson(jsonModel);
  }

}
