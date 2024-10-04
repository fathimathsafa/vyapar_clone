import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar_clone/core/constatnts/colors.dart';
import 'package:vyapar_clone/presentation/menu_screen/sub_screens/my_online_store/dash_board_screen.dart/sub_screens/edit_store_info/view/edit_store_info.dart';

class DashBoardOnlineScreen extends StatelessWidget {
  const DashBoardOnlineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colorconst.cBluelight,
      appBar: AppBar(
        backgroundColor: Colorconst.cwhite,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colorconst.cBlack),
        ),
        title:
            const Text('Online Store', style: TextStyle(color: Colors.black)),
        actions: [
          const Icon(Icons.visibility_outlined),
          SizedBox(width: 8.w), // Responsive width
          const Icon(Icons.settings_outlined),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildStoreInfoCard(context),
              SizedBox(height: 8.h), // Responsive height
              _buildStatsGrid(),
              SizedBox(height: 8.h), // Responsive height
              _buildQuickActionsSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStoreInfoCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      color: const Color.fromARGB(255, 253, 207, 210), // Light pink color
      child: Column(
        children: [
          _buildInfoHeader(context),
          _buildShareStoreSection(context),
        ],
      ),
    );
  }

  Widget _buildInfoHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w), // Responsive padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStoreInfo(),
              _buildProfileImage(context),
            ],
          ),
          _buildEditAndWebsiteButtons(context),
        ],
      ),
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'XianInfoTech',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19.sp, // Responsive font size
              color: Colorconst.cBlack),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "+ Add Description",
            style: TextStyle(color: Colorconst.cGrey),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProfileImageOptions(context),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSw6GrlY9mXGbj7hIKKltKqte87hqTQUW0kLW_pwXCnKz52aieE'),
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: Icon(Icons.edit, size: 16, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }

  void _showProfileImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.w), // Responsive padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildListTile(Icons.photo, 'Open Gallery', context),
              _buildListTile(Icons.camera_alt, 'Open Camera', context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEditAndWebsiteButtons(BuildContext context) {
    return Row(
      children: [
        _buildTextButton(context, Icons.edit, "Edit Store Info", () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditStoreInfo()));
        }),
        _divider(),
        _buildTextButton(context, Icons.public, "Get Your Own Website", () {}),
      ],
    );
  }

  Widget _buildTextButton(BuildContext context, IconData icon, String text,
      VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon, color: Colorconst.cBlue, size: 15.sp), // Responsive size
          Text(text,
              style: TextStyle(
                  color: Colorconst.cBlue,
                  fontSize: 13.sp)), // Responsive font size
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 30.h, // Responsive height
      width: 1.w, // Responsive width
      color: Colorconst.cBlack,
    );
  }

  Widget _buildShareStoreSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w), // Responsive padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Share Store link & get more orders online.',
            style: TextStyle(
                fontSize: 15.sp,
                color: Colorconst.cRed), // Responsive font size
          ),
          SizedBox(height: 50.h), // Responsive height
          MaterialButton(
            shape: const StadiumBorder(),
            color: Colorconst.cRed,
            onPressed: () => _showBottomSheet(context),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    transform: Matrix4.diagonal3Values(-1, 1, 1),
                    alignment: Alignment.center,
                    child: Icon(Icons.reply,
                        size: 23.sp,
                        color: Colorconst.cwhite), // Responsive size
                  ),
                  Text(
                    'Share Online Store',
                    style: TextStyle(
                        color: Colorconst.cwhite,
                        fontSize: 14.sp), // Responsive font size
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildStatCard('Total Orders', '0'),
        _buildStatCard('Open Orders', '0'),
        _buildStatCard('Store Views', '0'),
        _buildStatCard('Order Value Received', '₹ 0.00'),
      ],
    );
  }

  Widget _buildQuickActionsSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Add your quick action items here
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(8.w), // Responsive margin
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold)), // Responsive font size
          Text(value,
              style: TextStyle(
                  fontSize: 14.sp, color: Colors.grey)), // Responsive font size
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(20.w), // Responsive padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Share Your Store Link",
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 10.h), // Responsive height
              Text(
                'xianinfotech.com/store',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Colorconst.cBlack), // Responsive font size
              ),
              SizedBox(height: 20.h), // Responsive height
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colorconst.cBlue,
                ),
                onPressed: () {},
                child: const Text("Copy Link"),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListTile(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading:
          Icon(icon, size: 20.w, color: Colorconst.cBlue), // Responsive size
      title: Text(title,
          style: TextStyle(fontSize: 18.sp)), // Responsive font size
      onTap: () => Navigator.pop(context), // Close the modal on tap
    );
  }
}
