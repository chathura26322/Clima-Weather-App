import 'dart:io';

void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2Result = await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 Completed');
}

Future<String> task2() async {
  Duration threeSecond = Duration(seconds: 3);
  String result='';

  // Await the delayed task to ensure the result is set after the delay
  await Future.delayed(threeSecond, () {
    result = 'task 1 data';
    print('Task 2 Completed');
  });

  return result; // Return the result after the delay
}

void task3(String task2Data) {
  String result = 'task 2 data';
  print('Task 3 Completed with $task2Data');
}