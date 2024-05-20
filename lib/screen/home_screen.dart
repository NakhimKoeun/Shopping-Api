import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shopapi/controller/product_cotroller.dart';
import 'package:shopapi/screen/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<ProductController>(
          builder: (_) {
            if (controller.Isloading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.black),
                            ),
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                // Implement clearing search functionality
                              },
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Implement add to cart functionality
                        },
                        icon: Icon(Icons.add_shopping_cart),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () {
                        return controller.refreshProduct();
                      },
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 2
                              : 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 20,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailScreen(
                                    product: controller.products[
                                        index], // Pass selected product to DetailScreen
                                  ));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: 400,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                Positioned(
                                  child: Image.network(
                                      controller.products[index].image!),
                                  height: 200,
                                  width: 200,
                                ),
                                Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Text(
                                    '  \$ ${controller.products[index].price.toString()}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  bottom: 20,
                                  right: 10,
                                  child: Icon(Icons.favorite_border),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
