import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moni/core/constants/api.dart';
import 'package:moni/core/models/cluster.dart';

Future<ClusterModel> fetchCluster() async {
  var url = Uri.parse(loansApi);

  var response = await http.get(url);

  ClusterModel cluster;

  if (response.statusCode == 200) {
    var responseJson = jsonDecode(response.body);
    cluster = ClusterModel.fromMap(responseJson["data"]);

    return cluster;
  }

  throw "Failed to fetch cluster info";
}
