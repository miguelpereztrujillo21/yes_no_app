import 'package:yes_no_app/domain/entities/message.dart';

abstract class YesNoRepository {
  Future<Message> fetchMessage();
}
