import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json/model/product_model.dart';
import 'package:json/product_detail.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List _items = [];

  Future readJson() async {
    String response =
        await rootBundle.loadString("assets/local_json_file.json");
    final data = await jsonDecode(response);

    setState(() {
      _items = data['items'];
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
        backgroundColor: Colors.green[900],
        title: const Text(
          'Products',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: _items.isNotEmpty
          ? ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final products = _items[index];
                final name = products["name"];
                final description = products["description"];
                final price = products["price"];
                final img = products["imageUrl"];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => ProductDetail(
                            productsModel: ProductsModel(
                              pName: name,
                              pDescription: description,
                              pPrice: price,
                              pImg: img,
                            ),
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(img),
                      radius: 30,
                    ),
                    title: Text(name),
                    subtitle: Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text('\$${price.toString()}'),
                  ),
                );
              },
            )
          : const CircularProgressIndicator()
    );
  }
}
