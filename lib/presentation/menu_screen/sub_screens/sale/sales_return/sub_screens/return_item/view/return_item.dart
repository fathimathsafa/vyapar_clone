import 'package:flutter/material.dart';

class AddItemsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Items to Credit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // Item Name Field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Item Name',
                    hintText: 'e.g. Chocolate Cake',
                    border: InputBorder.none, // Remove the default border
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Quantity and Unit Row
              Row(
                children: [
                  // Quantity Field
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Quantity',
                          border: InputBorder.none, // Remove the default border
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),

                  // Unit Dropdown Field
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8),
                      child: DropdownButtonFormField<String>(
                        items: ['Kg', 'Lbs', 'Pieces'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {},
                        decoration: InputDecoration(
                          labelText: 'Unit',
                          border: InputBorder.none, // Remove the default border
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // Rate and Tax Row
              Row(
                children: [
                  // Rate Field
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Rate (Price/Unit)',
                          hintText: 'e.g. 50.00',
                          border: InputBorder.none, // Remove the default border
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),

                  // Tax Dropdown Field
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8),
                      child: DropdownButtonFormField<String>(
                        items: ['With Tax', 'Without Tax'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {},
                        decoration: InputDecoration(
                          labelText: 'Tax',
                          border: InputBorder.none, // Remove the default border
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),

              // Buttons Row for Save & New and Save
              Row(
                children: [
                  // Save & New Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Handle save & new logic
                        }
                      },
                      child: Text('Save & New'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),

                  // Save Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Handle save logic
                        }
                      },
                      child: Text('Save'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}