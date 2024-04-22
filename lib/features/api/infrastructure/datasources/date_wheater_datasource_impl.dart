

import 'package:dio/dio.dart';
import 'package:tennis_court/config/config.dart';
import 'package:tennis_court/features/api/domain/domain.dart';
import 'package:tennis_court/features/schedule/infrastructure/infrastructure.dart';
import '../infrastructure.dart';

class DateWheaterDatasourceImpl extends DateWheaterDatasource{

  final dio = Dio(
    BaseOptions(
      baseUrl: Environment.apiUrl,
      queryParameters: {
        'key': Environment.apiKey,
        'q': queryCords,
        'aqi': 'no',
        'alerts': 'no',
        'lang': 'es'
      }
    )
  );


  @override
  Future<DateWheater> getWheaterByDate({ int days = 1 }) async {
    try {
    final response = await dio.get('/$queryForecast',
    queryParameters: {
      'days': days
    });
    final apiResponse = WheaterApiResponse.fromJson(response.data);
    final DateWheater dateWheater = WheaterMapper.wheaterApiReponseToEntity(apiResponse);
    print(response.data);
    return dateWheater;
    } on DioException catch (e) {
      if( e.type == DioExceptionType.badResponse ) {
        throw CustomError(message: 'Error en la solicitud del clima');
        }
        throw Exception();
    }catch (e){
      throw CustomError(message: 'Error no controlado');
    }

  }

}