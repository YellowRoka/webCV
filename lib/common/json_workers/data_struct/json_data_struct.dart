import '../json_basedata_objs.dart';
import '../json_jobs_objs.dart';
import '../json_links_data_objs.dart';

class JsonDataStruct{
  final JobConverter      jobsEN;
  final BaseDataConverter baseDataEN;
  final JobConverter      jobsHU;
  final BaseDataConverter baseDataHU;
  final LinksConverter    webLinks;

  JsonDataStruct(this.jobsEN, this.baseDataEN, this.jobsHU, this.baseDataHU, this.webLinks);
}
