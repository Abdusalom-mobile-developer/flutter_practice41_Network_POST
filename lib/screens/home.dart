import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice41_network_post/database/network_data.dart';
import 'package:flutter_practice41_network_post/screens/product_adding.dart';
import 'package:flutter_practice41_network_post/services/requests.dart';

class HomeScreen extends StatefulWidget {
  static bool worked = false;
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    NetworkRequests.GET();
    Timer(
      const Duration(milliseconds: 2200),
      () {
        setState(() {
          HomeScreen.worked = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                children: [
                  NetworkData.listOfNetworkData.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1.3,
                                  crossAxisSpacing: 17,
                                  mainAxisSpacing: 17),
                          itemCount: NetworkData.listOfNetworkData.length,
                          itemBuilder: (context, index) => Container(
                            margin: index % 2 == 0
                                ? const EdgeInsets.only(left: 10)
                                : const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image(
                                          image: NetworkImage(
                                            NetworkData.listOfNetworkData[index]
                                                ["image"],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                NetworkData.listOfNetworkData[
                                                    index]["title"],
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            // Text(
                                            //   NetworkData.listOfNetworkData[index]["price"]
                                            //       .toString(),
                                            //   style: const TextStyle(color: Colors.white),
                                            // ),
                                          ],
                                        ),
                                        Text(
                                          NetworkData.listOfNetworkData[index]
                                                  ["price"]
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        Text(
                                          NetworkData.listOfNetworkData[index]
                                              ["category"],
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      NetworkData.listOfNetworkData.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(17)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ProductAdding(),
                                        ));
                                  },
                                  child: const Text(
                                    "Add new products",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )),
                            )
                          : const SizedBox(
                              height: 0,
                            )
                    ],  
                  )
                ],
              )),
        ));
  }
}
