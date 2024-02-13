import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/utils/storage_manager.dart';

class Home extends StatelessWidget with StorageManager {
  handleLogout() async {
    final res = await remove("token");
    Get.offAllNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text('Home', style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(128, 48),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    handleLogout();
                  },
                  child: const Text("Logout"))
            ],
          ),
        ));
  }
}
