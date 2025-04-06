import 'package:hive/hive.dart';
import 'package:devlog_insight/domain/entities/dev_log.dart';

part 'dev_log_model.g.dart';

@HiveType(typeId: 0)
class DevLogModel extends HiveObject {
	@HiveField(0)
	final String id;

	@HiveField(1)
	final String message;

	@HiveField(2)
	final DateTime createdAt;

	@HiveField(3)
	final String mood;

	@HiveField(4)
	final List<String> tags;

	DevLogModel({
		required this.id,
		required this.message,
		required this.createdAt,
		required this.mood,
		required this.tags,
	});

	/// 도메인 엔티티 → Hive 모델
	factory DevLogModel.fromEntity(DevLog entity) {
		return DevLogModel(
			id: entity.id,
			message: entity.message,
			createdAt: entity.createdAt,
			mood: entity.mood,
			tags: entity.tags,
		);
	}

	/// Hive 모델 → 도메인 엔티티
	DevLog toEntity() {
		return DevLog(
			id: id,
			message: message,
			createdAt: createdAt,
			mood: mood,
			tags: tags,
		);
	}
}
