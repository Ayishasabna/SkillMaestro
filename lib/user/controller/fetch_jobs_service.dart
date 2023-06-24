import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api/api_configuration.dart';
import '../../core/theme/access_token/token.dart';
import '../model/get_jobs_model.dart';

class FetchJobs {
  Dio dio = Dio();
  Map<String, dynamic> job = {};
  Future<Map<String, dynamic>> fetch7Jobs() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.get7Jobs;

    //String? token = await getAdminAccesToken();
    try {
      Response response = await dio.get(
        path,
        //options: Options(headers: {"authorization": "Bearer $token"})
      );

      if (response.statusCode == 200) {
        job = response.data;
        //log('======usersjsondecode=======${users}');

        return job;
      }
    } catch (e) {}
    return job;
  }
}

/* class fetchJobs {
  Dio dio = Dio();
  //List<GetJobModel> allServices = [];
  Future<List<GetJobModel>> fetch7Jobs() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.get7Jobs;
    Response response = await dio.get(path);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      if (response.data is Map<String, dynamic>) {
        final List<GetJobModel> allServices = [
          GetJobModel.fromJson(response.data)
        ];
        /* final List<jobProfile> alljobsList = [
            jobProfile.fromJson(response.data)
          ]; */
        log("allExperts.toString()::::$allServices");
        return allServices;
      }
    }
    return allServices;
  }
} */


 /*  List<dynamic> jobList = [];
  List<dynamic> jobRoles = [];
  List<String> images = [];

  Future<List<dynamic>> fetch7Jobs() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.get7Jobs;
    try {
   
      log("----true");

      //Map<String, dynamic> json = response.data;
      //log("------------json----------${json}");
      if (response.statusCode == 200) {
        //List<dynamic> responseData = response.data;

        Map<String, dynamic> responseData = response.data;
        log("------responsedata-----${responseData}");

        /*    responseData.values.forEach((dataList) {
          List<Result> results = (dataList as List<dynamic>)
              .map((item) => Result.fromJson(item))
              .toList();

          GetJobModel jobModel = GetJobModel(
            status: responseData['status'],
            result: results,
          );
          jobList.add(jobModel);
        }); */
        //log('-------------------joblistfetchjobs----${jobList}');

        /*     List<GetJobModel> jobList = responseData.map((data) {
          return GetJobModel.fromJson(data);
        }).toList(); */
        List<dynamic> jobList = responseData.values.last.toList();

        log("----------jobkkkkkk----$jobList");
        /* for (int i = 0; i < dataList.length; i++) {
          jobRoles =
              dataList.map((item) => item['job_role'] as String).toList();
          jobList.add(jobRoles as GetJobModel);
          images = dataList.map((item) => item['image'] as String).toList();
          log("------------joblistkkkk----------${jobList}");
        } */

        //List<dynamic> job = responseData.entries.last;
        log("------------joblistjjjjj----------${jobList}");
        jobRoles = jobList.map((item) => item['job_role'] as String).toList();
        log("-----------------jonbrole----------${jobRoles}");

        images = jobList.map((item) => item['image'] as String).toList();
        log("-----------------image----------${images}");

        /* for (int i = 0; i < dataList.length; i++) {
          List jobrole = dataList[i]["job_role"];
          log("-----mapitems-----${jobrole}");
          //List jobrole = dataList.last[i]['job_role'];
          //log("-----------------jonbrole----------${jobrole}");
        } */

        //String? jobRole = dataList.last['job_role'];

        /* for (int i = 0; i < jsonDecode(response.data).length; i++) {
          jobList.add(
              GetJobModel.fromJson(jsonEncode(jsonDecode(response.data)[i])));
        } */
        log("------returnjoblist----------$jobList");
        return jobList;
      }
    } catch (e) {
      log('$e');
    }

    return jobList;
  } */

/*   Future<List<GetJobModel>> fetch7Jobs() async {
    String path = ApiConfigration.baseUrl + ApiConfigration.get7Jobs;
    List<GetJobModel> allServices = [];
    List<Result> alllistofjobroles = [];

    try {
      Response response = await dio.get(path);

      if (response.statusCode == 200) {
        Map<String, dynamic> json = response.data;
        log("-------------results ----- model${json}");
        Result getJobModel = Result.fromJson(json['result']);
        // Access the response data
        // Map<String, dynamic> responseData = response.data;

        // Parse the JSON response
        //GetJobModel getJobModel = GetJobModel.fromJson(responseData);
        log("-------------results getjob model${getJobModel}");

        // Access the properties from the parsed model
        //String? status = getJobModel.status;
        //List<Result> results = getJobModel.result;

        // Process the data as needed
      }

      /*  Map<String, dynamic> jsonResponse = {
        "status": "success",
        "result": [
          {
            "_id": "1",
            "job_role": "Software Engineer",
            "image": "image_url",
            "base_rate": 5000,
            "add_rate": 1000,
            "listed": true,
            "createdAt": "2022-01-01T00:00:00Z",
            "updatedAt": "2022-01-02T00:00:00Z",
            "__v": 1
          },
          // Additional job results...
        ]
      }; */

      /*  GetJobModel getJobModel = GetJobModel.fromJson(response);
      String? status = getJobModel.status;
      List<Result> results = getJobModel.result;

// Accessing job result properties
      for (Result result in results) {
        String id = result.id;
        String jobRole = result.jobRole;
        String image = result.image;
        int baseRate = result.baseRate;
        int addRate = result.addRate;
        bool listed = result.listed;
        DateTime createdAt = result.createdAt;
        DateTime updatedAt = result.updatedAt;
        int v = result.v; */

      // Process the job result as needed...
    }

/* 
      if (response.data is List) {
        log("------inside fetchjobs ${allServices}");
        allServices = List<GetJobModel>.from(
            response.data['result'].map((item) => GetJobModel.fromJson(item)));
      } else if (response.data is Map<String, dynamic>) {
        allServices = [GetJobModel.fromJson(response.data['result'])];

        //List<String> alllistofjobroles = allServices.map((job) => job.jobRole).toList();
        //List<String> alllistofjobroles = allServices.map((job) =>job.result).toList();
        log("-------hhhh----------$allServices");
      } else {
        throw Exception("Invalid response data format");
      } */

    /* final List<GetJobModel> allServices = [
        GetJobModel.fromJson(response.data)
      ];
      log("-----------------$allServices"); */

    /* if (response.data is Map<String, dynamic>) {
        final List<GetJobModel> allServices = [
          GetJobModel.fromJson(response.data['result'])
        ];
        log("-----------------$allServices");
        return allServices;
      } else {
        throw Exception("Invalid response data format");
      } */
    on DioException catch (e) {
      log(e.message.toString());
    }
    return allServices;
  } */

