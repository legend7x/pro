import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String ipResult = "اضغط زر الفحص لمعرفة عنوان IP العام";
  String dnsResult = "";
  final TextEditingController _domainController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  // ✅ جلب الـ IP العام من API
  Future<void> getPublicIP() async {
    setState(() {
      ipResult = "⏳ جاري الفحص...";
    });

    try {
      final url = Uri.parse("http://ip-api.com/json");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          ipResult = """
🌐 عنوان IP: ${data['query']}
🏳️ الدولة: ${data['country']}
🏙️ المدينة: ${data['city']}
📡 مزود الخدمة: ${data['isp']}
          """;
        });
      } else {
        setState(() {
          ipResult = "❌ خطأ: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        ipResult = "⚠️ فشل الاتصال بالـ API";
      });
    }
  }

  // ✅ فحص DNS (تحويل دومين إلى IP)
  Future<void> checkDNS(String domain) async {
    setState(() {
      dnsResult = "⏳ جاري الفحص...";
    });

    try {
      final result = await InternetAddress.lookup(domain);
      setState(() {
        dnsResult = "✅ $domain → ${result.first.address}";
      });
    } catch (e) {
      setState(() {
        dnsResult = "❌ فشل إيجاد IP لهذا الدومين";
      });
    }
  }
