import 'package:flutter/material.dart';
import '../models/pickup.dart';

class SampleStageTracker extends StatelessWidget {
  final List<SampleStage> stages;

  const SampleStageTracker({super.key, required this.stages});

  @override
  Widget build(BuildContext context) {
    final allStages = SampleStage.values;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: allStages.map((stage) {
        final isComplete = stages.contains(stage);

        return Column(
          children: [
            Icon(
              isComplete ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isComplete ? Colors.green : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              stage.name,
              style: const TextStyle(fontSize: 10),
            ),
          ],
        );
      }).toList(),
    );
  }
}
