import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabViewWidget extends StatelessWidget {
  final TextEditingController dateController;
  final Function(BuildContext, TextEditingController) selectDate;

  CustomTabViewWidget({
    required this.dateController,
    required this.selectDate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: TabBarView(
        children: [
          // Pricing Tab
          Column(
            children: [
              Text(
                "Sale Price",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Sale Price',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    suffixIcon: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'Without Tax',
                        items: [
                          DropdownMenuItem(
                            value: 'Without Tax',
                            child: Text(
                              'Without Tax',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.sp),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'With Tax',
                            child: Text('With Tax'),
                          ),
                        ],
                        onChanged: (value) {
                          // Handle tax selection
                        },
                      ),
                    ),
                  ),
                  initialValue: '58.00',
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Disc.on Sale Price',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    suffixIcon: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'Percentage',
                        items: [
                          DropdownMenuItem(
                            value: 'Percentage',
                            child: Text(
                              'Percentage',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.sp),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'NO Percentage',
                            child: Text('NO Percentage'),
                          ),
                        ],
                        onChanged: (value) {
                          // Handle percentage selection
                        },
                      ),
                    ),
                  ),
                  initialValue: '0.00',
                ),
              ),
            ],
          ),
          // Stock Tab
          Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: 'Opening Stock',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: '0.00',
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        controller: dateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'As of Date',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () => selectDate(context, dateController),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'At Price/Unit',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: '0.00',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: 'Min Stock Qty',
                          border: OutlineInputBorder(),
                        ),
                        initialValue: '0.00',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Item Location",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Online Store Tab
          Column(
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.info),
                    labelText: 'Online Store Item Price',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: '58.00',
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.info),
                    labelText: 'Online Store Item Description',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
