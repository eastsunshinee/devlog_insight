import 'package:devlog_insight/domain/entities/dev_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devlog_insight/presentation/viewmodels/log_list_view_model.dart';
import 'package:intl/intl.dart';

class LogListScreen extends ConsumerStatefulWidget {
	const LogListScreen({super.key});

	@override
	ConsumerState<LogListScreen> createState() => _LogListScreenState();
}

class _LogListScreenState extends ConsumerState<LogListScreen> {
	@override
	void initState() {
		super.initState();
		// 화면 로딩 시 로그 목록 불러오기
		WidgetsBinding.instance.addPostFrameCallback((_) {
			ref.read(logListViewModelProvider.notifier).loadLogs();
		});
	}

	@override
	Widget build(BuildContext context) {
		final List<DevLog> logs = ref.watch(logListViewModelProvider);
		return Scaffold(
			appBar: AppBar(title: const Text('DevLog 목록')),
			body: logs.isEmpty
				? const Center(child: Text('작성된 로그가 없습니다.'))
				: ListView.builder(
					itemCount: logs.length,
					itemBuilder: (BuildContext context, int index) {
						final DevLog log = logs[index];
						final String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(log.createdAt);
						return ListTile(
							title: Text(log.message),
							subtitle: Text('$formattedDate | 기분: ${log.mood}'),
						);
					},
				),
		);
	}
}
