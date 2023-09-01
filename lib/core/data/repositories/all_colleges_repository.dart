import 'package:dartz/dartz.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/apis/all_Collages_model.dart';
import '../models/common_response.dart';
import '../network/endpoints/Collages_endpoint.dart';
import '../network/endpoints/all_college_endpoint.dart';
import '../network/network_config.dart';

class AllCollegesRepository{
  Future<Either<String, List<allcollegesModel>>> getAll(
      ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ALLCollagesEndpoint.collage,

        headers: NetworkConfig.getHeaders(needAuth: true,
       ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<allcollegesModel> result = [];
          commonResponse.data['data'].forEach((element)
          {
            result.add(allcollegesModel.fromJson(element));
          }
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


}