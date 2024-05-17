import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:trip_plannerx/model/schedule_db.dart';
import 'package:trip_plannerx/screens/profile_screens/blogs.dart';
import 'package:trip_plannerx/screens/profile_screens/images.dart';

class CompletePage extends StatefulWidget {
  const CompletePage({super.key});

  @override
  State<CompletePage> createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  Box<Schedule>? completedBox;

  @override
  void initState() {
    super.initState();
    initializeBox(); 
  }

  Future<void> initializeBox() async {
    if (!Hive.isBoxOpen('completedTrips')) {
      completedBox = await Hive.openBox<Schedule>('completedTrips'); // Open the box if not open
    } else {
      completedBox = Hive.box<Schedule>('completedTrips'); // Otherwise, get the existing box
    }
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    if (completedBox == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), 
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: completedBox!.length,
          itemBuilder: (context, index) {
            final schedule = completedBox!.getAt(index);
            if (schedule == null) {
              return const SizedBox.shrink(); // No schedule, return empty space
            }

            return Card(
              elevation: 6,
              child: ListTile(
                title: Text("Destination: ${schedule.destination}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    const Text("Companions:",style: TextStyle(fontWeight: FontWeight.w500),),
                    for (final companion in schedule.companion)
                      Text(companion),
                      const SizedBox(height: 8,),
                    Text("Start Date: ${DateFormat("EEEE, MMMM d, yyyy").format(schedule.startDate)}"),
                    Text("End Date: ${DateFormat("EEEE, MMMM d, yyyy").format(schedule.endDate)}"),
                    const SizedBox(height: 5,),
                    Text("Splitted Amount: ${schedule.splitAmount ?? 'None'}"),
                   const SizedBox(height: 5,),
                   const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ImagesPage()));
                      }, child: const Text('Add Image')),
                      ElevatedButton(onPressed: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const BlogsPage()),);
                      }, child: const Text('Add Blogs')),
                    ],
                   )
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green), 
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red), 
                      onPressed: () {
                        _confirmDelete(context, index); //delete dialogue
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to delete this schedule?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close without deleting
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                completedBox!.deleteAt(index); 
                setState(() {});
                Navigator.of(context).pop(); 
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    completedBox?.close(); 
    super.dispose();
  }
}
