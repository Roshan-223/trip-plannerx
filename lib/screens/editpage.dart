import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trip_plannerx/db/database_file/schedule_db.dart';

class EditPage extends StatefulWidget {
  final Schedule schedule;

  const EditPage({Key? key, required this.schedule}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController destinationController;
  late TextEditingController companionController;
  late DateTime startDate;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();
    destinationController = TextEditingController(text: widget.schedule.destination);
    companionController = TextEditingController(text: widget.schedule.companion.join(', '));
    startDate = widget.schedule.startDate;
    endDate = widget.schedule.endDate;
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Detail'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: destinationController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Destination",
              ),
            ),
            TextField(
              controller: companionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Companion",
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: DateFormat('yyyy-MM-dd').format(startDate),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Start Date",
                    ),
                    onTap: () => _selectStartDate(context),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(
                      text: DateFormat('yyyy-MM-dd').format(endDate),
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "End Date",
                    ),
                    onTap: () => _selectEndDate(context),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Implement update logic here
                String updatedDestination = destinationController.text;
                String updatedCompanion = companionController.text;

                // Navigate back and pass the updated data
                Navigator.pop(context, {
                  'destination': updatedDestination,
                  'companion': updatedCompanion,
                  'startDate': startDate,
                  'endDate': endDate,
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    destinationController.dispose();
    companionController.dispose();
    super.dispose();
  }
}
