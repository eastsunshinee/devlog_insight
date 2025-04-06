import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devlog_insight/domain/usecases/save_log.dart';
import 'package:devlog_insight/domain/repositories/log_repository.dart';
import 'package:devlog_insight/data/providers/log_repository_provider.dart';

/// SaveLog 유즈케이스 Provider
final Provider<SaveLog> saveLogProvider = Provider<SaveLog>((Ref ref) {
	final LogRepository repository = ref.read(logRepositoryProvider);
	return SaveLog(repository);
});
