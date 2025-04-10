import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devlog_insight/domain/usecases/get_logs.dart';
import 'package:devlog_insight/domain/repositories/log_repository.dart';
import 'package:devlog_insight/data/providers/log_repository_provider.dart';

/// GetLogs 유즈케이스 Provider
///
/// - LogRepository를 주입받아 GetLogs 유즈케이스를 생성합니다.
/// - 다른 계층(ViewModel 등)에서 이를 통해 로그 목록 조회 기능 사용 가능
final Provider<GetLogs> getLogsProvider = Provider<GetLogs>((Ref ref) {
	final LogRepository repository = ref.read(logRepositoryProvider);
	return GetLogs(repository);
});
