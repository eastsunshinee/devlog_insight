
/// 사용자가 작성한 학습/회고 기록을 표현하는 모델입니다.
class DevLog {
    final String id;
    final String message;
    final DateTime createdAt;
    final String mood;
    final List<String> tags;

    DevLog({
        required this.id,
        required this.message,
        required this.createdAt,
        required this.mood,
        required this.tags,
  });
}