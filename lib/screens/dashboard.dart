import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/controllers/bottom_tab_controller.dart';
import 'package:todo/controllers/data_controller.dart';
import 'package:todo/models/task_list_model.dart';
import 'package:todo/screens/task_calendar_screen.dart';
import 'package:todo/widgets/list_item2.dart';

import '../widgets/icon_text.dart';
import '../widgets/todo_item.dart';


class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(bottomTabIndexProvider);
    final data = ref.watch(dataProvider);

    if(data is DataLoading){
      return const Scaffold(body: Center(child: CircularProgressIndicator(),),);
    }

    if(data is DataLoaded){
      return Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(data.user.profileData.profilePic),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.user.profileData.name, style: Theme.of(context).textTheme.titleMedium),
              Text(data.user.profileData.userId, style: Theme.of(context).textTheme.labelMedium,)
            ],
          ),
          actions: [
            Icon(Icons.notifications_none)
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Yuhuu, your work is almost done!',
                  style: Theme.of(context).textTheme.headlineLarge?.apply(color: Colors.white),),

                const SizedBox(height: 22,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        PriorityTaskComponent(tasks: data.task,),
                        TaskOverview()
                      ],
                    ),
                    SharedWorkspace()
                  ],
                ),

                ///Todo list

                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text('To do today', style: Theme.of(context).textTheme.headlineSmall,)),

                Column(
                  children: [
                    ListItem2(text: data.task.tasks.taskId1.task),
                    ListItem2(text: data.task.tasks.taskId2.task),
                    ListItem2(text: data.task.tasks.taskId3.task),
                    ListItem2(text: data.task.tasks.taskId4.task),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabController,
          onTap: (index){
            ref.read(bottomTabIndexProvider.notifier).state = index;
            if(index == 2){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TaskCalendarScreen()));
            }
          },
          selectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.note_alt_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.perm_identity), label: 'Home'),
          ],
        ),
      );
    }

    return const SizedBox.shrink();

  }
}



class TaskOverview extends StatelessWidget {
  const TaskOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white10
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Daily tasks'),
              Text('8 out of 10 done')
            ],
          ),

          Spacer(),

          ///Place for progress graph
          CircleAvatar()
        ],
      ),
    );
  }
}


class SharedWorkspace extends StatelessWidget {
  const SharedWorkspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: 150,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          color: Colors.yellow.shade100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shared Workspace',
                style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.grey),),
              const SizedBox(height: 12,),

              IconText(text: 'Loyarieo Deolly', icon: Icons.check_box),
              IconText(text: 'Loyarieo Deolly', icon: Icons.check_box),
              IconText(text: 'Loyarieo Deolly', icon: Icons.check_box),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Private Workspace',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.grey),),
              ),

              Text('Humar Resource', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),),
              const SizedBox(height: 12,),
              Text('Humar Resource', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),),

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 12.0, right: 12),
          child: IconButton(onPressed: (){},
              icon: Icon(Icons.arrow_circle_right_rounded, color: Colors.black87, size: 50,)),
        )
      ],
    );
  }
}





class PriorityTaskComponent extends StatelessWidget {
  final TaskListModel tasks;
  const PriorityTaskComponent({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(16)
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text('My Priority Task',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.grey),),
              ),

              TodoItem(title: tasks.tasks.taskId1.task, onTap: (val){},),
              TodoItem(title: tasks.tasks.taskId2.task, onTap: (val){}, isCompleted: true),
              TodoItem(title: tasks.tasks.taskId3.task, onTap: (val){},),

            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(bottom: 12.0, right: 12),
          child: IconButton(onPressed: (){},
              icon: Icon(Icons.arrow_circle_right_rounded, color: Colors.black87, size: 50,)),
        )
      ],
    );
  }
}
