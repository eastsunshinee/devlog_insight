import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:devlog_insight/presentation/viewmodels/log_view_model.dart';

class LogInputScreen extends ConsumerStatefulWidget {
	const LogInputScreen({super.key});

	@override
	ConsumerState<LogInputScreen> createState() => _LogInputScreenState();
}

class _LogInputScreenState extends ConsumerState<LogInputScreen> {
	final TextEditingController _messageController = TextEditingController();
	String _selectedMood = '😀';
	final List<String> _moodOptions = ['😀', '😐', '😢', '🔥', '🥱'];

	@override
	void dispose() {
		_messageController.dispose();
		super.dispose();
	}

	Future<void> _saveLog() async {
        final String message = _messageController.text.trim();
		if (message.isEmpty) return;

		await ref.read(logViewModelProvider).save(
			message,
			_selectedMood,
			[], // 아직 태그는 없음
		);

		_messageController.clear();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('저장 완료!')),
        );
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('DevLog 작성'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						const Text('오늘의 회고', style: TextStyle(fontSize: 18)),
						const SizedBox(height: 8),
						TextField(
							controller: _messageController,
							maxLines: 5,
							decoration: const InputDecoration(
								border: OutlineInputBorder(),
								hintText: '오늘 무엇을 배우셨나요?',
							),
						),
						const SizedBox(height: 16),
						const Text('기분 선택'),
						DropdownButton<String>(
							value: _selectedMood,
							items: _moodOptions.map((String mood) {
								return DropdownMenuItem<String>(
									value: mood,
									child: Text(mood),
								);
							}).toList(),
							onChanged: (String? newValue) {
								if (newValue != null) {
									setState(() {
										_selectedMood = newValue;
									});
								}
							},
						),
						const SizedBox(height: 24),
						SizedBox(
							width: double.infinity,
							child: ElevatedButton(
								onPressed: _saveLog,
								child: const Text('저장'),
							),
						),
					],
				),
			),
		);
	}
}
