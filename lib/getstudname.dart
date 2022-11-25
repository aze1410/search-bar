import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentNames extends StatelessWidget {
  final String docmentId;
  const StudentNames({Key? key, required this.docmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(docmentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Name : ${data['name']}');
        }
        return Text("loading..");
      }),
    );
  }
}

class StudentEmail extends StatelessWidget {
  final String docmentId;
  const StudentEmail({Key? key, required this.docmentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(docmentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Email : ${data['email']}');
        }
        return Text("loading..");
      }),
    );
  }
}
