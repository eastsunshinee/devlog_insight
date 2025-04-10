import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devlog_insight/domain/usecases/get_logs.dart';
import 'package:devlog_insight/domain/entities/dev_log.dart';
import 'package:devlog_insight/domain/providers/get_logs_provider.dart';

/// 로그 목록 상태를 관리하는 ViewModel입니다.
///
/// - 상태는 List로 표현됩니다.
/// - 초기 상태는 빈 리스트이며, loadLogs() 호출 시 실제 데이터 조회 수행
class LogListViewModel extends StateNotifier<List<DevLog>> {
	final GetLogs getLogs;

	LogListViewModel(this.getLogs) : super([]);

	/// 로그 목록을 로드합니다.
	/// 호출 시 상태(state)를 갱신합니다.
	Future<void> loadLogs() async {
		final List<DevLog> logs = await getLogs();
		state = logs;
	}
}

/// Provider: ViewModel을 외부에서 사용할 수 있도록 등록
final StateNotifierProvider<LogListViewModel, List<DevLog>> logListViewModelProvider =
	StateNotifierProvider<LogListViewModel, List<DevLog>>((Ref ref) {
		final GetLogs getLogs = ref.read(getLogsProvider);
		return LogListViewModel(getLogs);
	});
