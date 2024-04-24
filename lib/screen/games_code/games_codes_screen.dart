import 'package:flutter/material.dart';

import '../../api_services/api_services.dart';
import '../../model/games_code_model.dart';
import '../../res/common/media_query.dart';
import 'games_code_information_screen.dart';

class GamesCodeScreen extends StatefulWidget {
  const GamesCodeScreen({Key? key}) : super(key: key);

  @override
  _GamesCodeScreenState createState() => _GamesCodeScreenState();
}

class _GamesCodeScreenState extends State<GamesCodeScreen>
    with SingleTickerProviderStateMixin {
  late Future<GamesCodeModel> gamesCodeModel;

  @override
  void initState() {
    super.initState();
    gamesCodeModel = ApiService().fetchGamesCodeModel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GamesCodeModel>(
      future: gamesCodeModel,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final gamesCodeModel = snapshot.data!;

          return DefaultTabController(
            length: gamesCodeModel.gameCodes!.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Codes',
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
                    gamesCodeModel.gameCodes!.length,
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
                              gamesCodeModel.gameCodes![index].category
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
                  gamesCodeModel.gameCodes!.length,
                  (index) => _buildTabContent(
                    gamesCodeModel.gameCodes![index],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildTabContent(GameCodes gameCode) {
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
                margin: const EdgeInsets.symmetric(horizontal: 15)
                    .copyWith(top: 10),
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
              builder: (context) => GamesCodeInformationScreen(
                gamesCodeModel: dataItem,
              ),
            ),
          ),
        );
      },
    );
  }
}
