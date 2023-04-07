import 'package:flutter/material.dart';
import 'package:listpagedua/util/my_button.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController taskController;
  final TextEditingController timeController;
  final TextEditingController descController;
  final Function() onSave;
  final Function() onCancel;

  const DialogBox({
    Key? key,
    required this.onSave,
    required this.onCancel,
    required this.taskController,
    required this.timeController,
    required this.descController,
  }) : super(key: key);

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  // TimeOfDay timeOfDay = TimeOfDay.now();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 10, minute: 30);

  //show time
  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Task'),
      // backgroundColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Colors.white,
      content: Container(
        height: 300, //size
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: widget.taskController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            TextField(
              controller: widget.descController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a desc"),
            ),
            TextFormField(
              controller: widget.timeController,
              decoration: const InputDecoration(
                  labelText: 'Time picker', border: OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //display choose time
                Text(
                  _timeOfDay.format(context).toString(),
                  style: TextStyle(fontSize: 15),
                ),

                // button
                TextButton.icon(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.blue),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  onPressed: _showTimePicker,
                  icon: Icon(
                    Icons.access_alarm,
                  ),
                  label: Text(
                    'Pick Time',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed: widget.onSave),
                const SizedBox(width: 8),
                MyButton(text: "Cancel", onPressed: widget.onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//   Future displayTimePicker(BuildContext context) async {
//     var time = await showTimePicker(context: context, initialTime: timeOfDay);

//     if (time != null) {
//       setState(() {
//         widget.timeController.text = "${time.hour}:${time.minute}";
//       });
//     }
//   }
// }
