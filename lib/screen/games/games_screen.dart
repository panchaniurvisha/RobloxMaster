import 'package:flutter/material.dart';

import '../../api_services/api_services.dart';
import '../../model/best_games_model.dart';
import '../../res/common/media_query.dart';
import 'games_information_screen.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  late Future<BestGamesModel> bestGamesModel;

  @override
  void initState() {
    super.initState();
    bestGamesModel = ApiService().fetchBestGamesModel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BestGamesModel>(
      future: bestGamesModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final bestGamesModel = snapshot.data!;

          return DefaultTabController(
            length: bestGamesModel.bestGame!.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Games',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Platypi"),
                ),
                bottom: TabBar(
                  physics: const BouncingScrollPhysics(),
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  indicatorColor: Colors.transparent,
                  tabs: List.generate(
                    bestGamesModel.bestGame!.length,
                    (index) => Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index % 2 == 0
                                ? Colors.amberAccent.shade100
                                : Colors.red.shade100,
                            border: Border.all(color: Colors.black38)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              bestGamesModel.bestGame![index].category
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                physics: const ClampingScrollPhysics(),
                children: List.generate(
                  bestGamesModel.bestGame!.length,
                  (index) => _buildTabContent(
                    bestGamesModel.bestGame![index],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildTabContent(BestGame gameCode) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      itemCount: gameCode.data!.length,
      itemBuilder: (context, index) {
        final dataItem = gameCode.data![index];
        return InkWell(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15).copyWith(top: 10),
                height: height(context) * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    dataItem.thumbnail.toString(),
                    height: height(context) * 0.3,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    // fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                dataItem.name ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GamesInformationScreen(
                gamesCodeModel: dataItem,
              ),
            ),
          ),
        );
      },
    );
  }
}
