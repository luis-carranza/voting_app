import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Projects').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        if (snapshot.data.documents.length == 0)
          return const Center(
            child: Text(
              'Error: Collection Does not exist',
            ),
          );
        return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot data = snapshot.data.documents[index];
              return _buildListTile(data);
            });
      },
    );
  }
  ListTile _buildListTile(DocumentSnapshot data) {
    return ListTile(
      leading: Icon(Icons.account_circle),
      title: Text(data['project_name']),
      subtitle: Text(data['author']),
      trailing: Text(data['votes'].toString()),
      onTap: () {
        // First Not Robust Approach since this does not take into account concurrency
        //What if another instance updates this value wbefore we do it in ours?
        // data.reference.update({
        //   'votes': data['votes'] + 1
        // });

        // Using Transaction instead,  to make it concurrent.
        // We will have a new hit to the Database but this will avoid corruption in the data.
        FirebaseFirestore.instance.runTransaction((transaction)  async {
          DocumentSnapshot newSnap = await transaction.get(data.reference);
          await transaction.update(newSnap.reference, {
            'votes': newSnap['votes'] + 1,
          });
        });
      },
    );
  }
}
