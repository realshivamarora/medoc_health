import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/pickup_provider.dart';

class ReportIssueScreen extends StatefulWidget {
  final String pickupId;

  const ReportIssueScreen({super.key, required this.pickupId});

  @override
  State<ReportIssueScreen> createState() => _ReportIssueScreenState();
}

class _ReportIssueScreenState extends State<ReportIssueScreen> {
  final _formKey = GlobalKey<FormState>();
  String _issueType = 'Patient Unavailable';
  String _comments = '';

  final List<String> _issueTypes = [
    'Patient Unavailable',
    'Wrong Address',
    'Sample Not Ready',
    'Contact Not Responding',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PickupProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Report Issue')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Issue Type'),
                items: _issueTypes
                    .map((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                value: _issueType,
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      _issueType = val;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Additional Comments (optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                onChanged: (val) => _comments = val,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("Submit"),
                onPressed: () {
                  provider.reportIssue(
                      widget.pickupId, '$_issueType - $_comments');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Issue submitted')),
                  );
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
