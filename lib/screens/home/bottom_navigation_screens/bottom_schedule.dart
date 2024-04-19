import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:trip_plannerx/db/database_file/schedule_db.dart';
import 'package:trip_plannerx/screens/editpage.dart';  

double? splitAmount;

class ScheduleListPage extends StatefulWidget {
  const ScheduleListPage({Key? key}) : super(key: key);

  @override
  _ScheduleListPageState createState() => _ScheduleListPageState();
}

class _ScheduleListPageState extends State<ScheduleListPage> {
  Box<Schedule>? scheduleBox;
  List<String> selectedContactNames = [];
  final TextEditingController splitAmountController = TextEditingController();
   bool isUpcomingSelected = true;
  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future<void> openBox() async {
    scheduleBox = await Hive.openBox<Schedule>('addtrip');
    setState(() {}); // Trigger a rebuild after scheduleBox is initialized
  }

  @override
  Widget build(BuildContext context) {
    // Check if scheduleBox is null before using it
    if (scheduleBox == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Schedule List'),
        ),
        body: const Center(
          child:
              CircularProgressIndicator(), // Show a loading indicator while scheduleBox is being initialized
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [  
                InkWell(
                  onTap: () {

                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: const Center(
                        child: Text(
                          'Upcoming',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    height: 40,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: const Center(
                        child: Text(
                          'Completed',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: scheduleBox!.length,
                itemBuilder: (context, index) {
                  // Build list items using the retrieved schedules
                  Schedule schedule = scheduleBox!.getAt(index)!;
                  // Calculate split amount
                  // double totalAmount = double.tryParse(
                  // splitAmountController.text) ?? 0;
                  //  Assuming this is the total amount entered by the user
                  // int numberOfCompanions = schedule.companion.length;
                  //  splitAmount = totalAmount / numberOfCompanions;
                  return Card(
                    elevation: 5,
                    color: const Color.fromARGB(255, 230, 226, 226),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          Text(
                            'Destination: ${schedule.destination}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          // Text('companion ${schedule.companion}'),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text(
                            'Companions:',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: schedule.companion
                                  .map((companionName) => Text(
                                        companionName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ))
                                  .toList()),
                          const SizedBox(height: 10),
                          Text(
                            'Start Date: ${DateFormat('yyyy-MM-dd').format(schedule.startDate)}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 4,),
                          Text(
                            'End Date: ${DateFormat('yyyy-MM-dd').format(schedule.endDate)}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: splitAmountController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Enter estimate amount",
                            ),
                            onChanged: (value) async {
                              double totalAmount = double.tryParse(value) ?? 0;
                              int numberOfCompanions =
                                  schedule.companion.length;
                              double splitAmount =
                                  totalAmount / (numberOfCompanions);
                              await scheduleBox!.put(
                                index,
                                Schedule(
                                  companion: schedule.companion,
                                  destination: schedule.destination,
                                  startDate: schedule.startDate,
                                  endDate: schedule.endDate,
                                  splitAmount: splitAmount,
                                ),
                              );
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 15),

                          Text(' splitted amount : ${schedule.splitAmount}',style: const TextStyle(fontWeight: FontWeight.w400),),
                          const SizedBox(height: 10),
                        ],
                      ),
                      trailing: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditPage(schedule: schedule),
                                  )).then((result) {
                                if (result != null) {
                                  setState(() {
                                    schedule.destination =
                                        result['destination'];
                                    schedule.companion =
                                        result['companion'].split(', ');
                                    schedule.startDate = result['startDate'];
                                    schedule.endDate = result['endDate'];
                                  });
                                }
                              });
                            },
                            icon: const Icon(Icons.edit,color: Colors.red,),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Confirm Deletion'),
                                    content: const Text(
                                        'Are you sure you want to delete this schedule?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          scheduleBox!.deleteAt(index);
                                          setState(() {}); //
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.delete,color: Colors.red,),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Close the Hive box when the widget is disposed
    scheduleBox?.close();
    super.dispose();
  }
}
