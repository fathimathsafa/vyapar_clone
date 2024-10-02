import 'package:flutter/material.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/dash_board_screen.dart/sub_screens/edit_store_info/view/edit_store_info.dart';

class DashBoardOnlineScreen extends StatelessWidget {
  // final bool dontShowAgain;
  //final Function(bool?) onCheckChanged;

  const DashBoardOnlineScreen({
    super.key,
    // this.dontShowAgain,
    // this.onCheckChanged
  }); // Track checkbox state

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colorconst.cBluelight,
      appBar: AppBar(
        backgroundColor: Colorconst.cwhite,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colorconst.cBlack,
            )),
        title: const Text(
          'Online Store',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          const Icon(Icons.visibility_outlined),
          SizedBox(width: screenWidth * .01),
          const Icon(Icons.settings_outlined),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Store Info Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                color: const Color.fromARGB(
                    255, 253, 207, 210), // Light pink color for main card
                child: Column(
                  children: [
                    // Inner Container with shadow, white background, and full width
                    Container(
                      width: double.infinity, // Full width of the main card
                      decoration: BoxDecoration(
                        color: Colors.white, // White background
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(screenWidth * .01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Leading text
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    ' XianInfoTech',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 19.sp,
                                        color: Colorconst.cBlack),
                                  ),
                                  //SizedBox(height: 8),

                                  // "+ Add Description" button
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "+ Add Description",
                                      style: TextStyle(color: Colorconst.cGrey),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(16.0)),
                                        ),
                                        backgroundColor: Colors.white,
                                        constraints: const BoxConstraints(
                                          minHeight:
                                              150, // Set the minimum height for the bottom sheet
                                        ),
                                        builder: (BuildContext context) {
                                          return Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize
                                                  .min, // Makes the sheet take up minimum space
                                              children: [
                                                ListTile(
                                                  leading:
                                                      const Icon(Icons.photo),
                                                  title: const Text(
                                                      'Open Gallery'),
                                                  onTap: () {
                                                    // Add your gallery picker logic here
                                                    Navigator.pop(
                                                        context); // Close bottom sheet after selection
                                                  },
                                                ),
                                                ListTile(
                                                  leading: const Icon(
                                                      Icons.camera_alt),
                                                  title:
                                                      const Text('Open Camera'),
                                                  onTap: () {
                                                    // Add your camera picker logic here
                                                    Navigator.pop(
                                                        context); // Close bottom sheet after selection
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: const CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw6GrlY9mXGbj7hIKKltKqte87hqTQUW0kLW_pwXCnKz52aieE', // Add your image here
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.edit,
                                        size: 16,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EditStoreInfo()));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colorconst.cBlue,
                                      size: 15.sp,
                                    ),
                                    Text(
                                      "Edit Store Info",
                                      style: TextStyle(
                                          color: Colorconst.cBlue,
                                          fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: screenHeight * .03,
                                width: 1,
                                color: Colorconst.cBlack,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.public,
                                      color: Colorconst.cBlue,
                                      size: 13.sp,
                                    ),
                                    Text(
                                      "Get Your Own Website",
                                      style: TextStyle(
                                          color: Colorconst.cBlue,
                                          fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Remaining part of the card with text and button
                    Padding(
                      padding: EdgeInsets.all(screenWidth * .02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * .03),

                          Text(
                            'Share Store link & get more orders online.',
                            style: TextStyle(
                                fontSize: 15.sp, color: Colorconst.cRed),
                          ),
                          SizedBox(height: screenHeight * .07),

                          // Material button
                          MaterialButton(
                            shape: const StadiumBorder(),
                            color: Colorconst.cRed,
                            onPressed: () {
                              _showBottomSheet(context);
                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Transform(
                                    transform:
                                        Matrix4.diagonal3Values(-1, 1, 1),
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.reply,
                                      size: 23.sp,
                                      color: Colorconst.cwhite,
                                    ),
                                  ),
                                  Text(
                                    'Share Online Store',
                                    style: TextStyle(
                                        color: Colorconst.cwhite,
                                        fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: screenHeight * .01,
              ),

              // Order Stats
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: screenHeight * .002,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildStatCard('Total Orders', '0'),
                  _buildStatCard('Open Orders', '0'),
                  _buildStatCard('Store Views', '0'),
                  _buildStatCard('Order Value Received', '₹ 0.00'),
                ],
              ),

              SizedBox(height: screenHeight * .01),

              // Quick Actions
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(5.r), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * .02),
                      child: Text(
                        'Quick Actions',
                        style: TextStyle(
                          color: Colorconst.cGrey,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(),
                    // Optional: Divider between title and cards
                    SizedBox(
                      height: screenHeight * .007,
                    ),
                    _buildStatCard2(
                      context,
                      'Manage Items',
                      'Total Items added - 1',
                      'assets/images/images (5).jpeg',
                    ),
                    SizedBox(
                      height: screenHeight * .007,
                    ),
                    const Divider(),
                    SizedBox(
                      height: screenHeight * .007,
                    ),
                    _buildStatCard2(
                      context,
                      'Manage Orders',
                      'Orders deliver till date-0',
                      'assets/images/images (1).png',
                    ),
                    SizedBox(
                      height: screenHeight * .007,
                    ),
                    const Divider(),

                    _buildStatCard2(
                      context,
                      'Store Reports',
                      'Today sale-₹0.00',
                      'assets/images/images (2).png',
                    ),
                    SizedBox(
                      height: screenHeight * .007,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows for scrolling content
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;
        final screenWidth = MediaQuery.of(context).size.width;

        return Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.05,
            top: screenHeight * 0.02,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Preview & Share',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Divider(),

                // Container with description
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: Colorconst.cBluelight,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colorconst.cwhite,
                        radius: 10.r,
                      ),
                      // SizedBox(width: screenWidth * 0.02),
                      Text(
                        'Get your own website for online store now',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colorconst.cGrey,
                        ),
                      ),
                      //SizedBox(width: screenWidth * 0.02),
                      Text(
                        'Click Here',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colorconst.cBlue,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // Scrollable content with long text
                Container(
                  height:
                      screenHeight * 0.2, // Set height to make it scrollable
                  decoration: BoxDecoration(
                    color: Colorconst.cGrey2,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: Text(
                            'Your own website can help you reach a wider audience. '
                            'With the ability to showcase your products online, customers '
                            'can easily view and order them, leading to higher sales. '
                            'You can also add a blog to share updates, manage customer feedback, '
                            'and ensure a professional look for your business.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colorconst.cGrey,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          child: Text(
                            'Having your store online means you are open 24/7. '
                            'Let your customers reach you anytime and from anywhere. '
                            'Build your brand by getting your own personalized website now.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colorconst.cGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // TextFormField for additional input
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText:
                        'Now Place Orders For Your home and get attractive discounts',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),

                // Checkbox for "Don't show this again"
                Row(
                  children: [
                    Checkbox(
                      tristate: true, // Allow null value for the checkbox
                      value:
                          null, // This will work now since tristate is enabled
                      onChanged: (bool? value) {
                        // Your onChanged logic here
                      },
                    ),
                    Expanded(
                      child: Text(
                        "Don't show this pop-up again",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colorconst.cBlack,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.03),

                // Button at the bottom
                Container(
                  height: screenHeight * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colorconst.cRed,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Center(
                    child: Text(
                      'Save & Share',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard2(
      BuildContext context, String title, String subtitle, String imagePath) {
    return ListTile(
      // Remove the CircleAvatar and use a rectangular Container instead
      leading: CircleAvatar(
        radius: 25.r,
        backgroundImage: AssetImage(imagePath),
      ),

      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colorconst.cBlue,
      ),
      onTap: () {
        // Navigate to the respective management page
      },
    );
  }
}
