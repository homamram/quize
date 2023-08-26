import 'package:dartz/dartz.dart';
import 'package:quize/ui/views/main_views/home_view/select_specilazion/select_specilazion.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/common_response.dart';
import '../models/Collages_model.dart';
import '../models/specilazion_model.dart';
import '../network/endpoints/Collages_endpoint.dart';
import '../network/endpoints/specialization_endpoint.dart';
import '../network/network_config.dart';

class specializationsRepository{
  Future<Either<String, List<specializationModel>>> getAll(
      ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: SpecializationEndpoint.specialization,

        headers: NetworkConfig.getHeaders(needAuth: true,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<specializationModel> result = [];
          commonResponse.data['data'].forEach((element)
          {
            result.add(specializationModel.fromJson(element));
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