import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todo/controllers/bottom_tab_controller.dart';
import 'package:todo/controllers/date_controller.dart';

class TaskCalendarScreen extends ConsumerWidget {
  const TaskCalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedDate = ref.watch(dateProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
            ref.read(bottomTabIndexProvider.notifier).state = 0;
          },
          icon: Icon(Icons.chevron_left_outlined),
        ),
        title: Text('Today task'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.menu))
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            // Row(
            //   children: [
            //     TextButton.icon(
            //       onPressed: () async{
            //         final today = DateTime.now();
            //         final selectedDate = await showDatePicker(context: context,
            //             initialDate: today,
            //             firstDate: today,
            //             lastDate: today.add(const Duration(days: 60)),
            //         );
            //         if(selectedDate != null){
            //           ref.read(dateProvider.notifier).state = selectedDate;
            //         }
            //
            //       }, icon: Icon(Icons.arrow_drop_down), label: Text('${DateFormat('MMM yyyy').format(pickedDate)}', style: Theme.of(context).textTheme.headlineMedium,),),
            //
            //
            //   ],
            // ),

            SfCalendar(
              view: CalendarView.week,
              initialDisplayDate: pickedDate,
              initialSelectedDate: DateTime.now(),
            )


          ],
        ),
      ),
    );
  }
}
