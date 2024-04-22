

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
  Future<WheaterForecast> getWheaterByDays({ int days = 1 }) async {
    try {

    final resp = await dio.get('/$queryForecast',
    queryParameters: {
      'days': days
    });
    final apiResponse = WheaterApiResponse.fromJson(resp.data);
    final WheaterForecast dateWheater = WheaterMapper.wheaterApiReponseToEntity(apiResponse);
    return dateWheater;

    } on DioException catch (e) {
      if( e.type == DioExceptionType.badResponse ) {
        throw CustomError(message: 'Error en la solicitud del clima');
        }
        throw Exception();
    }catch (e){
        throw Exception();
    }

  }
  
  @override
  Future<WheaterForecast> getWheaterByDate(DateTime date) async {
    try {
    final resp = await dio.get('/$queryFuture', queryParameters: {
        'dt': '${date.year}-${date.month}-${date.day}'
    });
    final apiResponse = WheaterApiResponse.fromJson(resp.data);
    final WheaterForecast dateWheater = WheaterMapper.wheaterApiReponseToEntity(apiResponse);
    return dateWheater;
      
    } on DioException catch (e) {
      if( e.type == DioExceptionType.badResponse ) {
        throw CustomError(message: 'Error en la solicitud del clima');
        }
        throw Exception();
    }catch (e){
        throw Exception();
    }
  }

}