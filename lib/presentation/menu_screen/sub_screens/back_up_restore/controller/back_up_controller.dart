import 'package:get/get.dart';

class AutoBackupController extends GetxController {
  var isAutoBackupEnabled = false.obs; // Use observable to track the state
  var backupDays = 3.obs; // Backup reminder days as observable

  // Method to toggle auto backup
  void toggleAutoBackup(bool value) {
    isAutoBackupEnabled.value = value;
  }

  // Method to increment days
  void incrementDays() {
    backupDays.value++;
  }

  // Method to decrement days
  void decrementDays() {
    if (backupDays.value > 1) {
      backupDays.value--;
    }
  }
}
