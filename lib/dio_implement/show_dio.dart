import 'package:flutter/material.dart';
import 'package:myapp/dio_implement/model_class_api.dart'; // Import your ApiService class

class ShowApi extends StatefulWidget {
  const ShowApi({super.key,});

  @override
  State<ShowApi> createState() => _ShowApiState();
}

class _ShowApiState extends State<ShowApi> {
  final ApiService _apiService = ApiService(); // Create an instance of ApiService

  final List<Map<String, dynamic>> _data = []; // Define a list to hold fetched data
  bool _isLoading = false;
  int _currentPage = 1;
   int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      setState(() {
        _isLoading = true;
      });
      final List<Map<String, dynamic>> fetchedData =
          await _apiService.fetchData(page: _currentPage, pageSize: _pageSize);
      setState(() {
        _data.addAll(fetchedData);
        _isLoading = false;
        _currentPage++;
      });
    } catch (e) {
      // Handle error
      setState(() {
        _isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Dio Implementation',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!_isLoading &&
              scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
            _getData();
            return true;
          }
          return false;
        },
        child: ListView.builder(
          itemCount: _data.length + (_isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < _data.length) {
              return ListTile(
                title: Text('${_data[index]['id']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title:${_data[index]['title']}',
                      style: const TextStyle(color: Colors.red),
                    ),
                    Text('Body: ${_data[index]['body']}'),
                  ],
                ),
              );
            } else {
              return _buildLoader();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}


