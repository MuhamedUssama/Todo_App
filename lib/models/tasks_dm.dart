import 'package:cloud_firestore/cloud_firestore.dart';

class TasksDm {
  late String id;
  late String title;
  late String details;
  late bool isDone;
  late DateTime date;

  static const String collectionName = "Tasks";

  TasksDm(this.id, this.title, this.details, this.isDone, this.date);

  TasksDm.fromJson(Map json) {
    id = json["id"];
    title = json["title"];
    details = json["details"].toString();
    isDone = json["isDone"];
    Timestamp time = json["date"];
    date = time.toDate();
  }
}
