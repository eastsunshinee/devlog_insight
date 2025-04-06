import '../entities/dev_log.dart';
import '../repositories/log_repository.dart';

/// 객체를 저장하는 유스케이스입니다.
class SaveLog {
    final LogRepository repository;

    SaveLog(this.repository);

    Future<void> call(DevLog log) async {
        await repository.saveLog(log);
    }
}
