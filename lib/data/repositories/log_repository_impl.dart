import 'package:hive/hive.dart';
import 'package:devlog_insight/domain/entities/dev_log.dart';
import 'package:devlog_insight/domain/repositories/log_repository.dart';
import '../models/dev_log_model.dart';

class LogRepositoryImpl implements LogRepository {
	final Box<DevLogModel> box;

	LogRepositoryImpl(this.box);

	@override
	Future<void> saveLog(DevLog log) async {
		final DevLogModel model = DevLogModel.fromEntity(log);
		await box.put(model.id, model);
	}

	@override
	Future<List<DevLog>> getLogs() async {
		final List<DevLogModel> models = box.values.toList();
		final List<DevLog> logs = models.map((DevLogModel model) => model.toEntity()).toList();
		return logs;
	}

	@override
	Future<void> deleteLog(String id) async {
		await box.delete(id);
	}
}