import 'package:web_cv/common/json_workers/json_basedata_objs.dart';
import 'package:web_cv/common/json_workers/json_jobs_objs.dart';
import 'package:web_cv/common/json_workers/json_links_data_objs.dart';

class JsonDataStruct{
  final JobConverter      jobsEN;
  final BaseDataConverter baseDataEN;
  final JobConverter      jobsHU;
  final BaseDataConverter baseDataHU;
  final LinksConverter    webLinks;

  JsonDataStruct(this.jobsEN, this.baseDataEN, this.jobsHU, this.baseDataHU, this.webLinks);
}
