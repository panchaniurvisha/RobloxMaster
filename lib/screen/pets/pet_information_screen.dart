// import 'package:flutter/material.dart';
// import 'package:hash_cached_image/hash_cached_image.dart';
// import 'package:roblox_master/model/pet_model.dart';
// import 'package:roblox_master/res/common/media_query.dart';
//
// import '../../api_services/api_services.dart';
// import '../../res/common/hash_cache_image.dart';
//
// class PetInformationScreen extends StatefulWidget {
//   final Data? petModel;
//
//   const PetInformationScreen({super.key, this.petModel});
//
//   @override
//   State<PetInformationScreen> createState() => _PetInformationScreenState();
// }
//
// class _PetInformationScreenState extends State<PetInformationScreen> {
//   late Future<PetModel> petModel;
//   bool imageLoadError = false;
//   @override
//   void initState() {
//     super.initState();
//     petModel = ApiService().fetchPetModel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           widget.petModel!.name.toString(),
//           style: TextStyle(
//               fontSize: 24, fontWeight: FontWeight.w700, fontFamily: "Platypi"),
//         ),
//       ),
//       body: ListView(
//         padding: EdgeInsets.only(bottom: 15),
//         shrinkWrap: true,
//         primary: true,
//         physics: AlwaysScrollableScrollPhysics(),
//         children: [
//           FutureBuilder<PetModel>(
//             future: petModel,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else if (!snapshot.hasData) {
//                 return const Center(child: Text('No data available'));
//               }
//
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   AppHashCacheImage(
//                     imageUrl: widget.petModel!.image.toString(),
//                   ),
//                   if (imageLoadError) SizedBox(height: height(context) / 2.5),
//                   ListView.separated(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 20).copyWith(
//                       top: height(context) * 0.02,
//                     ),
//                     separatorBuilder: (context, index) =>
//                         SizedBox(height: height(context) * 0.04),
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: widget.petModel!.pet!.length,
//                     itemBuilder: (context, index) {
//                       final information = widget.petModel!.pet![index];
//
//                       return Container(
//                         height: information.details != null &&
//                                 information.details!.isNotEmpty
//                             ? height(context) / 2.5
//                             : height(context) / 3,
//                         width: width(context) * 0.4,
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.4),
//                               blurRadius: 3, // changes the spread of the shadow
//                               offset:
//                                   Offset(0, 2), // changes position of shadow
//                               spreadRadius:
//                                   0, // changes how "thick" the shadow is
//                             ),
//                           ],
//                           color: Colors.teal.shade50,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10)
//                               .copyWith(top: 15),
//                           child: Column(
//                             children: [
//                               HashCachedImage(
//                                 imageUrl: information.image.toString(),
//                                 height: height(context) * 0.15,
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         titletext(text: "NAME: "),
//                                         subTitletext(
//                                           subText: information.name.toString(),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         titletext(text: "PRICE: "),
//                                         subTitletext(
//                                           subText: information.price.toString(),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         titletext(text: "RARITY: "),
//                                         subTitletext(
//                                           subText:
//                                               information.rarity.toString(),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         titletext(text: "DETAILS: "),
//                                         subTitletext(
//                                             subText:
//                                                 information.details != null &&
//                                                         information
//                                                             .details!.isNotEmpty
//                                                     ? information.details!
//                                                     : 'No details',
//                                             maxiLines: 4),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget titletext({required String text}) {
//     return Text(
//       text,
//       style: const TextStyle(
//         fontWeight: FontWeight.w700,
//         fontSize: 18,
//       ),
//     );
//   }
//
//   Widget subTitletext({required String subText, int? maxiLines}) {
//     return Flexible(
//       child: Text(
//         subText,
//         maxLines: maxiLines ?? 1,
//         style: TextStyle(
//           fontWeight: FontWeight.w500,
//           fontSize: 16,
//           color: Colors.black.withOpacity(0.8),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hash_cached_image/hash_cached_image.dart';
import 'package:roblox_master/model/pet_model.dart';

import '../../api_services/api_services.dart';
import '../../res/common/hash_cache_image.dart';
import '../../res/common/media_query.dart';

class PetInformationScreen extends StatefulWidget {
  const PetInformationScreen({
    super.key,
  });

  @override
  State<PetInformationScreen> createState() => _PetInformationScreenState();
}

class _PetInformationScreenState extends State<PetInformationScreen> {
  late Future<PetModel> petModel;
  bool imageLoadError = false;
  @override
  void initState() {
    super.initState();
    petModel = ApiService().fetchPetModel();
  }

  @override
  Widget build(BuildContext context) {
    final Data petModel = ModalRoute.of(context)!.settings.arguments as Data;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            petModel.name.toString(),
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: "Platypi"),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(bottom: 15),
          shrinkWrap: true,
          primary: true,
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppHashCacheImage(
                  imageUrl: petModel.image.toString(),
                ),
                if (imageLoadError) SizedBox(height: height(context) / 2.5),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
                    top: height(context) * 0.02,
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: height(context) * 0.04),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: petModel.pet!.length,
                  itemBuilder: (context, index) {
                    final information = petModel.pet![index];

                    return Container(
                      height: information.details != null &&
                              information.details!.isNotEmpty
                          ? height(context) / 2.5
                          : height(context) / 3,
                      width: width(context) * 0.4,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 3, // changes the spread of the shadow
                            offset: Offset(0, 2), // changes position of shadow
                            spreadRadius:
                                0, // changes how "thick" the shadow is
                          ),
                        ],
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10)
                            .copyWith(top: 15),
                        child: Column(
                          children: [
                            HashCachedImage(
                              imageUrl: information.image.toString(),
                              height: height(context) * 0.15,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      titletext(text: "NAME: "),
                                      subTitletext(
                                        subText: information.name.toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      titletext(text: "PRICE: "),
                                      subTitletext(
                                        subText: information.price.toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      titletext(text: "RARITY: "),
                                      subTitletext(
                                        subText: information.rarity.toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      titletext(text: "DETAILS: "),
                                      subTitletext(
                                          subText:
                                              information.details != null &&
                                                      information
                                                          .details!.isNotEmpty
                                                  ? information.details!
                                                  : 'No details',
                                          maxiLines: 4),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ));
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
