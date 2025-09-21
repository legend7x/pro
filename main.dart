import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
main(){
  runApp(MaterialApp(home: CyberToolApp(),));
}

class CyberToolApp extends StatelessWidget {
  const CyberToolApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cyber Security Tool"),
        bottom: TabBar(

          tabs: const [
            Tab(text: "IP العام"),
            Tab(text: "فحص DNS"),
          ],
        ),
      ),
      body: TabBarView(

        children: [
          // 🌍 فحص IP العام
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  onPressed:() {

                  },
                  child: const Text("عرض عنوان IP"),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(""),
                ),
              ],
            ),
          ),

          // 🌐 فحص DNS
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(

                  decoration: const InputDecoration(
                    labelText: "أدخل اسم الموقع (مثال: google.com)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  ),
                  onPressed: () {

                  },
                  child: const Text("فحص DNS"),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(""),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




