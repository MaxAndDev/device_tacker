import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class DialogWidget extends StatefulWidget {
  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {

  TextEditingController controller_model;
  TextEditingController controller_producer;
  TextEditingController controller_owner;
  TextEditingController controller_inventory;

  bool headphones_state = false;
  bool cable_state = false;
  bool adapter_state = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: controller_model,
                    decoration: InputDecoration(labelText: 'Device Model'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller_producer,
                    decoration: InputDecoration(labelText: 'Producer'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller_owner,
                    decoration: InputDecoration(labelText: 'Owner'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller_inventory,
                    decoration: InputDecoration(labelText: 'Inventory Number'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a text';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            CheckboxListTile(
              title: Text('Headphones'),
              value: headphones_state,
              onChanged: (bool value) {
                setState(() {
                  headphones_state = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Charging Cable'),
              value: cable_state,
              onChanged: (bool value) {
                setState(() {
                  cable_state = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Adapter'),
              value: adapter_state,
              onChanged: (bool value) {
                setState(() {
                  adapter_state = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showDialogWidget(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Device'),
          content: DialogWidget(),
          actions: <Widget>[
            FlatButton(
              child: Text('Add'),
              onPressed: () {
                if (_formKey.currentState.validate()){
                  print('valid');
                }
              },
            ),
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
