import 'package:dartz/dartz.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/common_response.dart';
import '../models/Collages_model.dart';
import '../network/endpoints/Collages_endpoint.dart';
import '../network/network_config.dart';

class CollegesRepository{
  Future<Either<String, List<CollagesModel>>> getAll({required bool isenginner }
      ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: isenginner?CollagesEndpoint.engineercollage:CollagesEndpoint.medicalCollages,

        headers: NetworkConfig.getHeaders(needAuth: true,
       ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<CollagesModel> result = [];
          commonResponse.data['data'].forEach((element)
          {
            result.add(CollagesModel.fromJson(element));
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