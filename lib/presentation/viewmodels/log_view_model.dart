import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devlog_insight/domain/usecases/save_log.dart';
import 'package:devlog_insight/domain/entities/dev_log.dart';
import 'package:devlog_insight/domain/providers/save_log_provider.dart';
import 'package:uuid/uuid.dart';

final Provider<LogViewModel> logViewModelProvider = Provider<LogViewModel>(
	(Ref ref) {
		final SaveLog saveLog = ref.read(saveLogProvider);
		return LogViewModel(saveLog);
	},
);

class LogViewModel {
	final SaveLog saveLog;

	LogViewModel(this.saveLog);

	Future<void> save(String message, String mood, List<String> tags) async {
		final DevLog log = DevLog(
			id: const Uuid().v4(),
			message: message,
			createdAt: DateTime.now(),
			mood: mood,
			tags: tags,
		);

		await saveLog(log);
	}
}
