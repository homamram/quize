import 'package:dartz/dartz.dart';
import '../models/apis/questions_model.dart';
import '../models/book_Questions_model.dart';
import '../network/endpoints/Question _endpoint.dart';
import '../network/endpoints/book_Question _endpoint.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/common_response.dart';
import '../models/Collages_model.dart';
import '../network/endpoints/Collages_endpoint.dart';
import '../network/network_config.dart';

class QuestionRepository{
  Future<Either<String, List<QuestionsModel>>> getAll(
      ) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url:Questionendpoint.Question,

        headers: NetworkConfig.getHeaders(needAuth: true,
        ),
      ).then((response) {
        CommonResponse<dynamic> commonResponse =
        CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<QuestionsModel> result = [];
          commonResponse.data['data'].forEach((element)
          {
            result.add(QuestionsModel.fromJson(element));
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