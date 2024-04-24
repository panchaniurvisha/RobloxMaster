import 'package:flutter/material.dart';
import 'package:roblox_master/model/pet_model.dart';
import 'package:roblox_master/res/common/media_query.dart';
import 'package:roblox_master/screen/pets/pet_information_screen.dart';

import '../../api_services/api_services.dart';

class RobLoxPetScreen extends StatefulWidget {
  const RobLoxPetScreen({super.key});

  @override
  State<RobLoxPetScreen> createState() => _RobLoxPetScreenState();
}

class _RobLoxPetScreenState extends State<RobLoxPetScreen> {
  late Future<PetModel> petModel;

  @override
  void initState() {
    super.initState();
    petModel = ApiService().fetchPetModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Pets",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        // primary: true,
        //   physics: const AlwaysScrollableScrollPhysics(),
        children: [
          FutureBuilder<PetModel>(
              future: petModel,
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
                  height: height(context),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1,
                    ),
                    itemCount: user.data!.length,
                    itemBuilder: (context, index) {
                      final item = user.data![index];

                      return InkWell(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: height(context) * 0.8,
                                width: width(context) * 0.4,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.6),
                                      blurRadius: 3,
                                      offset: const Offset(0, 2),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAlias,
                                  child: item.image != null &&
                                          item.image!.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 30,
                                          ),
                                          child: Image.network(
                                            item.image!,
                                            fit: BoxFit
                                                .contain, // Use BoxFit.cover to fill the container
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Center(
                                                child: Icon(
                                                  Icons.error_outline,
                                                  size: height(context) * 0.06,
                                                ),
                                              ); // Show error icon if image fails to load
                                            },
                                          ),
                                        )
                                      : const Center(
                                          child: Text("No Image"),
                                        ),
                                ),
                              ),
                              Container(
                                  height: 30,
                                  width: width(context) * 0.4,
                                  child: Align(
                                    child: Text(
                                      item.name ?? 'No Name',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      )))
                            ],
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PetInformationScreen(petModel: item))));
                    },
                  ),
                );
                //     SizedBox(
                //   height: height(context) / 8,
                //   child: ListView.separated(
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: user.data!.length,
                //     separatorBuilder: (context, index) => const SizedBox(
                //       width: 15,
                //     ),
                //     itemBuilder: (context, index) {
                //       final item = user.data![index];
                //       return Row(
                //         children: [
                //           Column(
                //             children: [
                //               item.image != null && item.image!.isNotEmpty
                //                   ? CircleAvatar(
                //                       maxRadius: 40,
                //                       backgroundColor: Colors.blue.shade100,
                //                       child: Padding(
                //                         padding: const EdgeInsets.all(15.0),
                //                         child: Image.network(
                //                           item.image!,
                //                           fit: BoxFit
                //                               .contain, // Use BoxFit.cover to fill the container
                //                           errorBuilder:
                //                               (context, error, stackTrace) {
                //                             return Center(
                //                               child: Icon(
                //                                 Icons.error_outline,
                //                                 size: height(context) * 0.06,
                //                               ),
                //                             ); // Show error icon if image fails to load
                //                           },
                //                         ),
                //                       ),
                //                     )
                //                   : const Center(
                //                       child: Text("No Image"),
                //                     ),
                //               Text(
                //                 item.name ?? 'No Name',
                //                 style: const TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //               ),
                //             ],
                //           )
                //         ],
                //       );
                //     },
                //   ),
                // );
              }),
        ],
      ),
    );
  }
}
