import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/domain/repositories/yes_no_repository.dart';
import 'package:yes_no_app/data/models/yes_no_model.dart';

class YesNoRepositoryImpl implements YesNoRepository {
  final Dio _dio;

  YesNoRepositoryImpl(this._dio);

  @override
  Future<Message> fetchMessage() async {
    try {
      final response = await _dio.get('https://yesno.wtf/api');
      final yesNoModel = YesNoModel.fromJsonMap(response.data);

      return Message(
          text: yesNoModel.answer,
          imageURL: yesNoModel.image,
          fromWho: FromWho.hers);
    } catch (e) {
      throw Exception('Failed to load message: $e');
    }
  }
}
