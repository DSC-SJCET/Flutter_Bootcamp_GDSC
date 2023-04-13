import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  //FIREBASE
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      title: 'Firebase CRUD',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  //FIRESTORE
  final CollectionReference firestore =
      FirebaseFirestore.instance.collection('users');

  //CREATE
  void addUser() async {
    await firestore.add({
      'name': nameController.text,
      'age': int.parse(ageController.text),
    });
    nameController.clear();
    ageController.clear();
  }

  //UPDATE
  void updateUser(DocumentSnapshot document, BuildContext context) async {
    nameController.text = document['name'];
    ageController.text = document['age'].toString();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              await firestore.doc(document.id).update({
                'name': nameController.text,
                'age': int.parse(ageController.text),
              });

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
    nameController.clear();
    ageController.clear();
  }

  //DELETE
  void deleteUser(DocumentSnapshot document) async {
    await firestore.doc(document.id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase CRUD Example'),
      ),
      //READ
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final document = snapshot.data!.docs[index];
              return ListTile(
                title: Text(document['name']),
                subtitle: Text(document['age'].toString()),
                onTap: () => updateUser(document, context),
                onLongPress: () => deleteUser(document),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Add User'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  addUser();
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
