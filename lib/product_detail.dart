import 'package:flutter/material.dart';
import 'package:json/model/product_model.dart';

class ProductDetail extends StatelessWidget {
  final ProductsModel productsModel;
  const ProductDetail({Key? key, required this.productsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.4,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  productsModel.pImg!,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productsModel.pName!,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                            ),
                          ),
                          Text(
                            '\$${productsModel.pPrice.toString()}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 27,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 27,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            size: 27,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star_half,
                            size: 27,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star_border,
                            size: 27,
                            color: Colors.amber,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  SizedBox(
                    height: height*0.25,
                    child: Text(
                      productsModel.pDescription!,
                      style: const TextStyle(
                        fontSize: 23,
                        fontFamily: 'Stylish',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                          horizontal: 110,
                          vertical: 15,
                        ),
                      ),
                      backgroundColor:  MaterialStatePropertyAll(
                        Colors.green[900],
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
