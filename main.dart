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
           // controller: _tabController,
            tabs: const [
              Tab(text: "IP العام"),
              Tab(text: "فحص DNS"),
            ],
          ),
        )
        }
}




