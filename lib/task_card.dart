import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {

  final Task? task;
  final Function()? done;
  QuoteCard({this.task, this.done});

  final DateTime now = DateTime.now();
  late final String time;


  @override
  Widget build(BuildContext context) {
    int dateDiff = now.difference(task!.date).inDays;
    if(dateDiff < 1){
      time = task!.date.hour.toString()+":"+task!.date.minute.toString();
    }
    else if(dateDiff < 7) {
      time = task!.date.weekday.toString()+" "+task!.date.hour.toString()+":"+task!.date.minute.toString();
    }else {
      time = task!.date.day.toString()+"/"+task!.date.month.toString()+" "+task!.date.weekday.toString()+" "+task!.date.hour.toString()+":"+task!.date.minute.toString();
    }
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                task!.task,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[800],
                )
            ),
            const SizedBox(height: 8.0),
            Text(
              time,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              )
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: done, child: const Icon(Icons.delete_outline_rounded)),
                TextButton(
                    onPressed: done,
                    child: const Icon(Icons.done_rounded)),
              ],
            )
          ] ,
        ),
      ),
    );
  }
}

class Task {
  final String task;
  final DateTime date = DateTime.now();

  Task(this.task);
}