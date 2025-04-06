import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:devlog_insight/domain/repositories/log_repository.dart';
import 'package:devlog_insight/data/repositories/log_repository_impl.dart';
import 'package:devlog_insight/data/models/dev_log_model.dart';

/// Riverpod Provider를 통해 LogRepositoryImpl 주입
final Provider<LogRepository> logRepositoryProvider = Provider<LogRepository>(
	(Ref ref) {
		final Box<DevLogModel> box = Hive.box<DevLogModel>('devLogs');
		return LogRepositoryImpl(box);
	},
);
