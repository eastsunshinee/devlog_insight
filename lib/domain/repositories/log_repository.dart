import '../entities/dev_log.dart';

/// 기록 데이터를 저장하거나 불러오는 동작을 정의하는 인터페이스입니다.
abstract class LogRepository {
    Future<void> saveLog(DevLog log);
    Future<List<DevLog>> getLogs();
    Future<void> deleteLog(String id);
}
