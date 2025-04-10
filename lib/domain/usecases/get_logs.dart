import 'package:devlog_insight/domain/entities/dev_log.dart';
import 'package:devlog_insight/domain/repositories/log_repository.dart';

/// 유즈케이스: 저장된 DevLog 목록을 조회합니다.
///
/// - SOLID 원칙 중 SRP (단일 책임 원칙)에 따라,
///   이 클래스는 오직 로그 조회 기능만 담당합니다.
/// - DIP (의존 역전 원칙)를 적용하여,
///   구체 구현이 아닌 LogRepository 인터페이스에만 의존합니다.
class GetLogs {
	final LogRepository repository;

	GetLogs(this.repository);

	/// 로그 목록을 반환합니다.
	/// 비동기 처리이며, 저장소에 따라 응답 방식은 달라질 수 있습니다.
	Future<List<DevLog>> call() async {
		return repository.getLogs();
	}
}
