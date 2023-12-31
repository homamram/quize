import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:quize/core/data/models/apis/token_info.dart';
import 'package:quize/core/data/models/common_response.dart';
import 'package:quize/core/data/network/endpoints/user_endpoints.dart';
import 'package:quize/core/data/network/network_config.dart';
import 'package:quize/core/enums/request_type.dart';
import 'package:quize/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String user_name,
    required String passcode,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndpoints.login,
        body: {
          'user_name': user_name,
          'passcode': passcode,
        },
        headers: NetworkConfig.getHeaders(
            needAuth: false, extraHeaders: {"Language": "ar"}),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> register({
    required String user_name,
    required String phone,
    required String collage_uuid,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: UserEndpoints.register,
        fields: {
          'user_name': user_name,
          'phone': phone,
          'collage_uuid':collage_uuid
        },
        headers: NetworkConfig.getHeaders(needAuth: false,extraHeaders: {'Content-Type':'multipart/form-data'}),
      ).then((response) {
        if(response!=null){
          CommonResponse<Map<String, dynamic>> commonResponse =
          CommonResponse.fromJson(response);

          if (commonResponse.getStatus) {
            return Right(commonResponse.getStatus );
          } else {
            return Left(commonResponse.data!['message'] ?? '');
          }
        }
        else{
          if (false==true) return Right(true);
         else return Left('bad request');

        }

      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
