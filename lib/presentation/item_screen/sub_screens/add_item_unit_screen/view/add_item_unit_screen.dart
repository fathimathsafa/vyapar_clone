import 'package:flutter/material.dart';

class AddItemUnitPage extends StatefulWidget {
  @override
  _AddItemUnitPageState createState() => _AddItemUnitPageState();
}

class _AddItemUnitPageState extends State<AddItemUnitPage> {
  String? selectedFromUnit;
  String? selectedToUnit;
  String? selectedConversionRateOption;
  List<String> units = ['BOX', 'BOTTLES', 'KG', 'LITERS']; // Example units
  TextEditingController conversionRateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item Unit', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for "From Unit"
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Primary Unit',
                border: OutlineInputBorder(),
              ),
              value: selectedFromUnit,
              items: units.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedFromUnit = newValue;
                });
              },
            ),
            SizedBox(height: 20),

            // Dropdown for "To Unit"
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Secondary Unit',
                border: OutlineInputBorder(),
              ),
              value: selectedToUnit,
              items: units.map((String unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedToUnit = newValue;
                });
              },
            ),
            SizedBox(height: 30),

            // Show conversion rate section only when the secondary unit is selected
            if (selectedToUnit != null) ...[
              Text(
                'Selected Conversion Rate',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              // Conversion Rate Section with Radio Button
              Row(
                children: [
                  Radio<String>(
                    value: 'conversion_rate',
                    groupValue: selectedConversionRateOption,
                    onChanged: (String? value) {
                      setState(() {
                        selectedConversionRateOption = value;
                      });
                    },
                  ),
                  Text(
                    '1 $selectedFromUnit = ',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: conversionRateController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    selectedToUnit ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
            Spacer(),

            // Cancel and Save buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle cancel action
                  },
                  child: Text('Cancel', style: TextStyle(color: Colors.grey)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle save action
                  },
                  child: Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(100, 50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}