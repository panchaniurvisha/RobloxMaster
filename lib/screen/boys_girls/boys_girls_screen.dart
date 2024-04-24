import 'package:flutter/material.dart';
import 'package:roblox_master/model/boys_all_data_model.dart';
import 'package:roblox_master/model/girls_all_data_model.dart';
import 'package:roblox_master/res/common/media_query.dart';

import '../../api_services/api_services.dart';
import '../../res/constant/app_images.dart';

class BoysGirlsScreen extends StatefulWidget {
  const BoysGirlsScreen({Key? key}) : super(key: key);

  @override
  _BoysGirlsScreenState createState() => _BoysGirlsScreenState();
}

class _BoysGirlsScreenState extends State<BoysGirlsScreen> {
  late Future<BoysModel> boysModel;
  late Future<BoysSweaterModel> boysSweaterModel;
  late Future<BoysTShirtModel> boysTShirtModel;
  late Future<BoysClassicShirts> boysClassicShirts;
  late Future<BoysClassicPants> boysClassicPants;
  late Future<GirlsModel> girlsModel;
  late Future<GirlsClassicPantsModel> girlsClassicPantsModel;
  late Future<GirlsClassicShirtsModel> girlsClassicShirtsModel;
  late Future<GirlsTShirtsModel> girlsTShirtsModel;
  late Future<GirlsSweaterModel> girlsSweaterModel;
  List<Map<String, dynamic>> boysData = [
    {
      "text": "Boy",
      "Image": AppImages.boyImage,
    },
    {
      "text": "Boy Sweater",
      "Image": AppImages.boysSweater,
    },
    {
      "text": "Boy T_Shirt",
      "Image": AppImages.boysClassicShirt,
    },
    {
      "text": "Boy Classic Shirt",
      "Image": AppImages.boysClassicShirt,
    },
    {
      "text": "Boy Classic Pant",
      "Image": AppImages.boysClassicPants,
    },
    {
      "text": "Girl",
      "Image": AppImages.girlsImage,
    },
    {
      "text": "Girl Sweater",
      "Image": AppImages.girlsSweater,
    },
    {
      "text": "Girl T-Shirt",
      "Image": AppImages.girlsTShirt,
    },
    {
      "text": "Girl Classic Shirt",
      "Image": AppImages.girlsClassicShirt,
    },
    {
      "text": "Girl Classic Pant",
      "Image": AppImages.girlsClassicPants,
    }
  ];
  Set<Map<String, dynamic>> selectedItems = {};

  @override
  void initState() {
    super.initState();

    boysModel = ApiService().fetchBoysModel();
    boysSweaterModel = ApiService().fetchBoysSweaterModel();
    boysTShirtModel = ApiService().fetchBoysTShirtsModel();
    boysClassicShirts = ApiService().fetchBoysClassicShirts();
    boysClassicPants = ApiService().fetchBoysPentsModel();
    girlsModel = ApiService().fetchGirlsModel();
    girlsClassicPantsModel = ApiService().fetchGirlsPentsModel();
    girlsClassicShirtsModel = ApiService().fetchGirlsClassicShirtModel();
    girlsTShirtsModel = ApiService().fetchGirlsTShirtsModel();
    girlsSweaterModel = ApiService().fetchGirlsSweaterModel();
  }

  void _handleItemClick(Map<String, dynamic> item) {
    setState(() {
      // if (selectedItems.contains(item)) {
      //   bool removed = selectedItems.remove(item);
      //   debugPrint("Removed item: $item | Result: $removed");
      // } else {
      //   selectedItems.clear();
      //   bool added = selectedItems.add(item);
      //   debugPrint("Added item: $item | Result: $added");
      // }

      selectedItems.clear();
      bool added = selectedItems.add(item);
      debugPrint("Added item: $item | Result: $added");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Skins',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, fontFamily: "Platypi"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
        child: Column(
          children: [
            SizedBox(
              height: height(context) * 0.15,
              child: ListView.separated(
                padding: const EdgeInsets.only(right: 10),
                scrollDirection: Axis.horizontal,
                itemCount: boysData.length,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  final item = boysData[index];
                  return InkWell(
                    child: Container(
                      width: width(context) * 0.6,
                      decoration: BoxDecoration(
                          color: index % 2 == 0
                              ? Colors.black26
                              : Colors.amber.shade200,
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              maxRadius: 40,
                              child: ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  boysData[index]["Image"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          titletext(
                            text: boysData[index]["text"],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      _handleItemClick(item);
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              padding: const EdgeInsets.only(right: 10),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: selectedItems.isEmpty ? 1 : selectedItems.length,
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemBuilder: (context, index) {
                if (selectedItems.isEmpty) {
                  // If selectedItems is empty, show default boys widget (index 0)
                  return buildBoysWidget(); // Use appropriate boysModelData
                } else {
                  final selectedItem = selectedItems.first;
                  final selectedItemText = selectedItem["text"];

                  if (selectedItemText == "Boy") {
                    return buildBoysWidget(item: selectedItem);
                  } else if (selectedItemText == "Boy Sweater") {
                    return buildBoysSweaterWidget(selectedItem);
                  } else if (selectedItemText == "Boy T_Shirt") {
                    return buildBoysTShirtWidget(selectedItem);
                  } else if (selectedItemText == "Boy Classic Shirt") {
                    return buildBoysClassicShirtWidget(selectedItem);
                  } else if (selectedItemText == "Boy Classic Pant") {
                    return buildBoysClassicpantWidget(selectedItem);
                  } else if (selectedItemText == "Girl") {
                    return buildGirlsWidget(selectedItem);
                  } else if (selectedItemText == "Girl Sweater") {
                    return buildGirlsSweaterWidget(selectedItem);
                  } else if (selectedItemText == "Girl T-Shirt") {
                    return buildGirlsTShirtWidget(selectedItem);
                  } else if (selectedItemText == "Girl Classic Shirt") {
                    return buildGirlsClassicShirtWidget(selectedItem);
                  } else if (selectedItemText == "Girl Classic Pant") {
                    return buildGirlsClassicPantsWidget(selectedItem);
                  }

                  return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.8);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoysWidget({Map<String, dynamic>? item}) {
    return FutureBuilder<BoysModel>(
        future: boysModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }

          final user = snapshot.data!;
          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            child: ListView.separated(
              padding: const EdgeInsets.only(right: 10),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: user.boys!.length,
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemBuilder: (context, index) {
                final item = user.boys![index];
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white38.withOpacity(0.4),
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                        spreadRadius: 0,
                      ),
                    ],
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (item.image != null && item.image!.isNotEmpty)
                          Image.network(
                            item.image!,
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height * 0.3,
                            errorBuilder: (context, error, stackTrace) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: height(context) * 0.1),
                                child: Center(
                                  child: Icon(
                                    Icons.error_outline,
                                    size: MediaQuery.of(context).size.height *
                                        0.09,
                                  ),
                                ),
                              );
                            },
                          )
                        else
                          const Center(child: Text("No Image")),
                        Row(
                          children: [
                            titletext(text: "Name: "),
                            subTitletext(
                              subText: "${item.name.toString()}",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            titletext(text: "TYPE: "),
                            subTitletext(
                              subText: "${item.type.toString()}",
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            titletext(text: "PRICE: "),
                            subTitletext(
                              subText: "${item.price.toString()}",
                            ),
                          ],
                        ),
                        titletext(text: "DESCRIPTION: "),
                        subTitletext(
                          maxiLines: 4,
                          subText: "${item.description.toString()}",
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }

  Widget buildBoysSweaterWidget(Map<String, dynamic> item) {
    return FutureBuilder<BoysSweaterModel>(
      future: boysSweaterModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final user = snapshot.data!;
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: user.boysSweaters!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = user.boysSweaters![index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38.withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        Image.network(
                          item.image!,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height(context) * 0.1),
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const Center(child: Text("No Image")),
                      Row(
                        children: [
                          titletext(text: "Name: "),
                          subTitletext(
                            subText: "${item.name.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "TYPE: "),
                          subTitletext(
                            subText: "${item.type.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "PRICE: "),
                          subTitletext(
                            subText: "${item.price.toString()}",
                          ),
                        ],
                      ),
                      titletext(text: "DESCRIPTION: "),
                      subTitletext(
                        maxiLines: 4,
                        subText: "${item.description.toString()}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildBoysTShirtWidget(Map<String, dynamic> item) {
    return FutureBuilder<BoysTShirtModel>(
      future: boysTShirtModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final user = snapshot.data!;
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: user.boysTShirt!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = user.boysTShirt![index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38.withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        Image.network(
                          item.image!,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height(context) * 0.1),
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const Center(child: Text("No Image")),
                      Row(
                        children: [
                          titletext(text: "Name: "),
                          subTitletext(
                            subText: "${item.name.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "TYPE: "),
                          subTitletext(
                            subText: "${item.type.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "PRICE: "),
                          subTitletext(
                            subText: "${item.price.toString()}",
                          ),
                        ],
                      ),
                      titletext(text: "DESCRIPTION: "),
                      subTitletext(
                        maxiLines: 4,
                        subText: "${item.description.toString()}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildBoysClassicShirtWidget(Map<String, dynamic> item) {
    return FutureBuilder<BoysClassicShirts>(
      future: boysClassicShirts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final user = snapshot.data!;
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: user.boysClassicShirts!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = user.boysClassicShirts![index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38.withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        Image.network(
                          item.image!,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height(context) * 0.1),
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const Center(child: Text("No Image")),
                      Row(
                        children: [
                          titletext(text: "Name: "),
                          subTitletext(
                            subText: "${item.name.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "TYPE: "),
                          subTitletext(
                            subText: "${item.type.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "PRICE: "),
                          subTitletext(
                            subText: "${item.price.toString()}",
                          ),
                        ],
                      ),
                      titletext(text: "DESCRIPTION: "),
                      subTitletext(
                        maxiLines: 4,
                        subText: "${item.description.toString()}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildBoysClassicpantWidget(Map<String, dynamic> item) {
    return FutureBuilder<BoysClassicPants>(
      future: boysClassicPants,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final user = snapshot.data!;
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: user.boysClassicPants!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = user.boysClassicPants![index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38.withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        Image.network(
                          item.image!,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height(context) * 0.1),
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const Center(child: Text("No Image")),
                      Row(
                        children: [
                          titletext(text: "Name: "),
                          subTitletext(
                            subText: "${item.name.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "TYPE: "),
                          subTitletext(
                            subText: "${item.type.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "PRICE: "),
                          subTitletext(
                            subText: "${item.price.toString()}",
                          ),
                        ],
                      ),
                      titletext(text: "DESCRIPTION: "),
                      subTitletext(
                        maxiLines: 4,
                        subText: "${item.description.toString()}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildGirlsWidget(Map<String, dynamic> item) {
    return FutureBuilder<GirlsModel>(
      future: girlsModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final user = snapshot.data!;
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: user.girls!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = user.girls![index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38.withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        Image.network(
                          item.image!,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height(context) * 0.1),
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const Center(child: Text("No Image")),
                      Row(
                        children: [
                          titletext(text: "Name: "),
                          subTitletext(
                            subText: "${item.name.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "TYPE: "),
                          subTitletext(
                            subText: "${item.type.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "PRICE: "),
                          subTitletext(
                            subText: "${item.price.toString()}",
                          ),
                        ],
                      ),
                      titletext(text: "DESCRIPTION: "),
                      subTitletext(
                        maxiLines: 4,
                        subText: "${item.description.toString()}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildGirlsSweaterWidget(Map<String, dynamic> item) {
    return FutureBuilder<GirlsSweaterModel>(
      future: girlsSweaterModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final user = snapshot.data!;
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: user.girlsSweaters!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = user.girlsSweaters![index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38.withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        Image.network(
                          item.image!,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height(context) * 0.1),
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const Center(child: Text("No Image")),
                      Row(
                        children: [
                          titletext(text: "Name: "),
                          subTitletext(
                            subText: "${item.name.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "TYPE: "),
                          subTitletext(
                            subText: "${item.type.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "PRICE: "),
                          subTitletext(
                            subText: "${item.price.toString()}",
                          ),
                        ],
                      ),
                      titletext(text: "DESCRIPTION: "),
                      subTitletext(
                        maxiLines: 4,
                        subText: "${item.description.toString()}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildGirlsTShirtWidget(Map<String, dynamic> item) {
    return FutureBuilder<GirlsTShirtsModel>(
      future: girlsTShirtsModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final user = snapshot.data!;
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: user.girlsTShirt!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = user.girlsTShirt![index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38.withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        Image.network(
                          item.image!,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height(context) * 0.1),
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const Center(child: Text("No Image")),
                      Row(
                        children: [
                          titletext(text: "Name: "),
                          subTitletext(
                            subText: "${item.name.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "TYPE: "),
                          subTitletext(
                            subText: "${item.type.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "PRICE: "),
                          subTitletext(
                            subText: "${item.price.toString()}",
                          ),
                        ],
                      ),
                      titletext(text: "DESCRIPTION: "),
                      subTitletext(
                        maxiLines: 4,
                        subText: "${item.description.toString()}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildGirlsClassicShirtWidget(Map<String, dynamic> item) {
    return FutureBuilder<GirlsClassicShirtsModel>(
      future: girlsClassicShirtsModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final user = snapshot.data!;
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: user.girlsClassicShirts!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = user.girlsClassicShirts![index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38.withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        Image.network(
                          item.image!,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height(context) * 0.1),
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const Center(child: Text("No Image")),
                      Row(
                        children: [
                          titletext(text: "Name: "),
                          subTitletext(
                            subText: "${item.name.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "TYPE: "),
                          subTitletext(
                            subText: "${item.type.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "PRICE: "),
                          subTitletext(
                            subText: "${item.price.toString()}",
                          ),
                        ],
                      ),
                      titletext(text: "DESCRIPTION: "),
                      subTitletext(
                        maxiLines: 4,
                        subText: "${item.description.toString()}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget buildGirlsClassicPantsWidget(Map<String, dynamic> item) {
    return FutureBuilder<GirlsClassicPantsModel>(
      future: girlsClassicPantsModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No data available'));
        }

        final user = snapshot.data!;
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.8,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: user.girlsClassicPants!.length,
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemBuilder: (context, index) {
              final item = user.girlsClassicPants![index];
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white38.withOpacity(0.4),
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.image != null && item.image!.isNotEmpty)
                        Image.network(
                          item.image!,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.3,
                          errorBuilder: (context, error, stackTrace) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height(context) * 0.1),
                              child: Center(
                                child: Icon(
                                  Icons.error_outline,
                                  size:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        const Center(child: Text("No Image")),
                      Row(
                        children: [
                          titletext(text: "Name: "),
                          subTitletext(
                            subText: "${item.name.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "TYPE: "),
                          subTitletext(
                            subText: "${item.type.toString()}",
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          titletext(text: "PRICE: "),
                          subTitletext(
                            subText: "${item.price.toString()}",
                          ),
                        ],
                      ),
                      titletext(text: "DESCRIPTION: "),
                      subTitletext(
                        maxiLines: 4,
                        subText: "${item.description.toString()}",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget titletext({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
    );
  }

  Widget subTitletext({required String subText, int? maxiLines}) {
    return Flexible(
      child: Text(
        subText,
        maxLines: maxiLines ?? 1,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black.withOpacity(0.8),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
