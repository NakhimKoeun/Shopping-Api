import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopapi/models/product_models.dart';
import 'package:shopapi/widget/butom.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.product}) : super(key: key);
  final ProductModels product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 400,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage("${product.image}"),
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 350),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${product.title}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "\$ ${product.price}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Description",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${product.description}",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20), // Add some space at the bottom
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                  ),
                ),
                SizedBox(width: 10),
                ResponSive(
                  isResponsive: true,
                  color: const Color.fromARGB(255, 41, 32, 32),
                  iconColor: Colors.white,
                  height: 70,
                  widget: 500,
                ),
              ],
            ),
            SizedBox(height: 20), // Add additional space if needed
          ],
        ),
      ),
    );
  }
}
