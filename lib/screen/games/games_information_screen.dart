import 'package:flutter/material.dart';
import 'package:roblox_master/model/best_games_model.dart';
import 'package:roblox_master/res/common/media_query.dart'; // Assuming this is a custom utility for media queries
import 'package:url_launcher/url_launcher.dart';

import '../../api_services/api_services.dart';

class GamesInformationScreen extends StatefulWidget {
  final Datum gamesCodeModel;

  const GamesInformationScreen({Key? key, required this.gamesCodeModel})
      : super(key: key);

  @override
  State<GamesInformationScreen> createState() => _GamesInformationScreenState();
}

class _GamesInformationScreenState extends State<GamesInformationScreen> {
  late Future<BestGamesModel> fetchBestGamesModel;

  @override
  void initState() {
    super.initState();
    fetchBestGamesModel = ApiService().fetchBestGamesModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.gamesCodeModel.name.toString(),
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, fontFamily: "Platypi"),
        ),
      ),
      body: FutureBuilder<BestGamesModel>(
        future: fetchBestGamesModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final gamesCodeModel = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ).copyWith(bottom: 15),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: height(context) * 0.28,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        color: Colors.amber.shade200,
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          widget.gamesCodeModel.thumbnail.toString(),
                          height: height(context) * 0.3,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height(context) * 0.24),
                      //height: height(context),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  titletext(text: "PLAYER COUNT: "),
                                  subTitletext(
                                    subText: widget.gamesCodeModel.playercount
                                        .toString(),
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                                Colors.white38),
                                      ),
                                      onPressed: () async {
                                        var url = Uri.parse(widget
                                            .gamesCodeModel.link
                                            .toString());
                                        await launchUrl(url,
                                            mode:
                                                LaunchMode.externalApplication);
                                      },
                                      child: const Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.black87,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  titletext(text: "RATING: "),
                                  subTitletext(
                                    subText:
                                        widget.gamesCodeModel.rating.toString(),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height(context) * 0.2,
                                child: ListView.separated(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  scrollDirection: Axis
                                      .horizontal, // Set the scroll direction to horizontal
                                  itemCount:
                                      widget.gamesCodeModel.image!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        // borderRadius: BorderRadius.circular(35),
                                      ),
                                      child: Image.network(
                                        widget.gamesCodeModel.image![
                                            index], // Use current image URL from the list
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 15,
                                    );
                                  },
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                ),
                              ),
                              titletext(text: "DESCRIPTION: "),
                              Text(
                                widget.gamesCodeModel.description.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black.withOpacity(0.8),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
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
