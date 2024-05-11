import 'package:flutter/material.dart';
import 'package:myapp/service.dart/databse.dart';
// ignore: unused_import
import 'package:myapp/screen/form_data.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Map<String, dynamic>> _list = [];

  Future _refreshList() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _list = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Show List of Items'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReactiveFormData()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text(_list[index]['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_list[index]['age'].toString()),
                  Text(_list[index]['address']),
                  Text(_list[index]['profession']),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      await SQLHelper.deleteItem(_list[index]['id']);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Successfully deleted!')),
                      );
                      _refreshList();
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () async {
                      // Navigate to the form screen and pass the item's data
                      final updatedData = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReactiveFormData(
                            formData: _list[
                                index], // Pass the item's data to the form
                          ),
                        ),
                      );

                      // Handle the updated data if needed
                      if (updatedData != null) {
                        // Update the item in the list
                        setState(() {
                          _list[index] = updatedData;
                        });
                      }
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
