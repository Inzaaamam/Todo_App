import 'package:flutter/material.dart';
import 'package:myapp/screen/list_vew.dart';
import 'package:myapp/service.dart/databse.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormData extends StatefulWidget {
   final Map<String, dynamic>? formData;
  const ReactiveFormData({super.key, this.formData, });

  @override
  // ignore: library_private_types_in_public_api
  _ReactiveFormDataState createState() => _ReactiveFormDataState();
}

class _ReactiveFormDataState extends State<ReactiveFormData> {
  late final FormGroup _form;

  @override
  void initState() {
    _form = FormGroup({
      'id': FormControl<int>(),
      'name': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(3),
        ],
      ),
      'age': FormControl<int>(
        validators: [
          Validators.required,
          Validators.min(18),
        ],
      ),
      'address': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      'profession': FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
    });
      if (widget.formData != null) {
    // Pre-fill form fields with existing data
    _form.patchValue(widget.formData);
  }
    super.initState();
    

    _refreshList();
  }

  Future<void> _refreshList() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _list = data;
    });
  }

  // ignore: unused_field
  List<Map<String, dynamic>> _list = [];
  // bool _isLoading = true;

  Future<void> _addItem(Map<String, dynamic> formData) async {
    await SQLHelper.createItems(
      formData['name'],
      formData['age'],
      formData['address'],
      formData['profession'],
    );
    await _refreshList();
  }

  Future<void> _updateItem(Map<String, dynamic> formData) async {
    await SQLHelper.updateItem(
      formData['id'],
      formData['name'],
      formData['age'],
      formData['address'],
      formData['profession'],
    );
    await _refreshList();
  }

  void _onSubmit(Map<String, dynamic> formData) {
    if (_form.valid) {
      if (formData['id'] == null) {
       
        _addItem(formData);
      } else {
        _updateItem(formData);
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListViewScreen()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is valid! Data submitted.'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: ReactiveForm(
          formGroup: _form,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                ReactiveTextField<String>(
                  formControlName: 'name',
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                   validationMessages: {
                      ValidationMessage.required.toString(): (error) {
                        return 'The name must not be empty';
                      },
                      ValidationMessage.minLength.toString(): (error) {
                        return 'The name must be at least 3 characters long';
                      },
                    }),
                const SizedBox(height: 20),
                ReactiveTextField<int>(
                  formControlName: 'age',
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    prefixIcon: Icon(Icons.cake),
                  ),
                      validationMessages: {
                    ValidationMessage.required.toString(): (error) {
                      return 'The age must not be empty';
                    },
                    ValidationMessage.number.toString(): (error) {
                      return 'The age must be a valid number';
                    },
                    ValidationMessage.min.toString(): (error) {
                      return 'The age must be at least 18';
                    },
                  },
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ReactiveTextField<String>(
                  formControlName: 'address',
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    prefixIcon: Icon(Icons.home),
                  ),
                   validationMessages: {
                    ValidationMessage.required.toString(): (error) {
                      return 'The address must not be empty';
                    },
                  },
                ),
                const SizedBox(height: 20),
                ReactiveTextField<String>(
                  formControlName: 'profession',
                  decoration: const InputDecoration(
                    labelText: 'Profession',
                    prefixIcon: Icon(Icons.work),
                  ),
                    validationMessages: {
                      ValidationMessage.required.toString(): (error) {
                        return 'The profession must not be empty';
                      },}
                ),
                const SizedBox(height: 20),
                ReactiveFormConsumer(
                  builder: (context, form, child) {
                    return ElevatedButton(
                      onPressed: form.valid
                          ? () => _onSubmit(form.value)
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please fill in all required fields'),
                                  backgroundColor: Colors.redAccent,
                                ),
                              );
                            },
                      child:  Text(form.control('id').value == null ? 'Submit' : 'Update'),

                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
