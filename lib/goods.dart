import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GoodsPage extends StatefulWidget {
  const GoodsPage({super.key});

  @override
  State<GoodsPage> createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  List _items = [];

  Future readJson() async {
    String response = await rootBundle.loadString("assets/l_json_file.json");
    final data = await jsonDecode(response);

    setState(() {
      _items = data("items");
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Goods',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _items.isNotEmpty ?
      ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(_items[index]["imageUrl"]),
              ),
              title: const Text('Ghana JayZ'),
              subtitle: const Text('We don\'t play'),
              trailing: const Text('Price'),
            ),
          );
        },
      ): const Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
