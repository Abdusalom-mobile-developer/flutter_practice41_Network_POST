import 'package:flutter/material.dart';
import 'package:flutter_practice41_network_post/database/network_data.dart';
import 'package:flutter_practice41_network_post/mixins/widgets.dart';
import 'package:flutter_practice41_network_post/screens/home.dart';
import 'package:flutter_practice41_network_post/services/requests.dart';

class ProductAdding extends StatefulWidget {
  static bool showBottomButton = true;
  const ProductAdding({
    super.key,
  });

  @override
  State<ProductAdding> createState() => _ProductAddingState();
}

class _ProductAddingState extends State<ProductAdding> with Widgets {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _categoriesController = TextEditingController();
  bool _hasError = false;
  @override
  void initState() {
    super.initState();
    // NetworkRequests.POST(
    //     title: "Abdusalom",
    //     price: "12.5",
    //     description: "asadascs",
    //     image:
    //         "https://i.pinimg.com/564x/39/38/58/39385833421d321be8dfc677389a69d9.jpg",
    //     category: "Evil");
    // Timer(
    //     const Duration(seconds: 3),
    //     () => Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => const HomeScreen(),
    //         )));
  }

  void textFiledFunction() {
    setState(() {
      ProductAdding.showBottomButton = false;
    });
  }

  void textFiledFunction2() {
    setState(() {
      FocusScope.of(context).unfocus();
      ProductAdding.showBottomButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            textFiledFunction2();
          },
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textFieldMaker(
                              context,
                              "Product Title",
                              _titleController,
                              textFiledFunction,
                              textFiledFunction2),
                          textFieldMaker(
                              context,
                              "Product Price",
                              _priceController,
                              textFiledFunction,
                              textFiledFunction2),
                          textFieldMaker(
                              context,
                              "Product Description",
                              _descriptionController,
                              textFiledFunction,
                              textFiledFunction2),
                          textFieldMaker(
                              context,
                              "Product Image",
                              _imageController,
                              textFiledFunction,
                              textFiledFunction2),
                          textFieldMaker(
                              context,
                              "Product Category",
                              _categoriesController,
                              textFiledFunction,
                              textFiledFunction2),
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _hasError
                                    ? const Text(
                                        "Fill all fields!",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const SizedBox(
                                        width: 0,
                                      ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(17)),
                                  child: TextButton(
                                      onPressed: () {
                                        textFiledFunction2();
                                        if (_titleController.text.trim().isNotEmpty &&
                                            _priceController.text
                                                .trim()
                                                .isNotEmpty &&
                                            _descriptionController.text
                                                .trim()
                                                .isNotEmpty &&
                                            _imageController.text
                                                .trim()
                                                .isNotEmpty &&
                                            _categoriesController.text
                                                .trim()
                                                .isNotEmpty) {
                                          NetworkRequests.POST(
                                              title:
                                                  _titleController.text.trim(),
                                              price:
                                                  _priceController.text.trim(),
                                              description:
                                                  _descriptionController.text
                                                      .trim(),
                                              image:
                                                  _imageController.text.trim(),
                                              category: _categoriesController
                                                  .text
                                                  .trim());
                                          setState(() {
                                            _hasError = false;
                                          });
                                          _titleController.clear();
                                          _priceController.clear();
                                          _descriptionController.clear();
                                          _imageController.clear();
                                          _categoriesController.clear();
                                        } else {
                                          setState(() {
                                            _hasError = true;
                                          });
                                        }
                                      },
                                      child: const Text(
                                        "Submit",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ProductAdding.showBottomButton
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 21),
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(17)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen(),
                                      ),
                                      (route) => false);
                                },
                                child: const Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          )
                        ],
                      )
                    : const SizedBox(
                        height: 0,
                      )
              ],
            ),
          ),
        ));
  }
}
