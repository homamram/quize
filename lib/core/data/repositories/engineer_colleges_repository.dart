import 'package:dartz/dartz.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/common_response.dart';
import '../models/engineer_Collages_model.dart';
import '../network/endpoints/Collages_endpoint.dart';
import '../network/network_config.dart';

Map<String, String> extraHeaders = {
  'Authorization': 'Bearer 65|E0q0GTfrsrtAmDmE6j6LwhqrIz7yY6LLLizkAhkm',
};
class EngineerCollegesRepository{
  Future<Either<String, List<EngineerCollagesModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CollagesEndpoint.engineercollage,

        headers: NetworkConfig.getHeaders(needAuth: true,
        extraHeaders: {
          'Authorization': 'Bearer 65|E0q0GTfrsrtAmDmE6j6LwhqrIz7yY6LLLizkAhkm',
        }),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<EngineerCollagesModel> result = [];
          commonResponse.data!.forEach((element)
          {
            result.add(EngineerCollagesModel.fromJson(element));
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