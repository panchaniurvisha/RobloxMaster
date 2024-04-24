import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roblox_master/res/common/media_query.dart'; // Assuming this is a custom utility for media queries

import '../../api_services/api_services.dart';
import '../../model/games_code_model.dart';

class GamesCodeInformationScreen extends StatefulWidget {
  final Data gamesCodeModel;

  const GamesCodeInformationScreen({Key? key, required this.gamesCodeModel})
      : super(key: key);

  @override
  State<GamesCodeInformationScreen> createState() =>
      _GamesCodeInformationScreenState();
}

class _GamesCodeInformationScreenState
    extends State<GamesCodeInformationScreen> {
  late Future<GamesCodeModel> futureGamesCodeModel;
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to Clipboard'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    futureGamesCodeModel = ApiService().fetchGamesCodeModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gamesCodeModel.name.toString()),
      ),
      body: FutureBuilder<GamesCodeModel>(
        future: futureGamesCodeModel,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final gamesCodeModel = snapshot.data!;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                // alignment: Alignment.bottomCenter,
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
                    height: height(context) / 1,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            widget.gamesCodeModel.description.toString(),
                            style: TextStyle(
                              color: Colors.black87.withOpacity(0.6),
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemBuilder: (context, index) {
                              final code = widget.gamesCodeModel.code![index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: height(context) * 0.15,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.1),
                                        blurRadius: 3,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              code.code.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            InkWell(
                                                child: Icon(Icons.copy),
                                                onTap: () => _copyToClipboard(
                                                      context,
                                                      code.code.toString(),
                                                    )),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          code.description.toString(),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 15),
                            itemCount: widget.gamesCodeModel.code!.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
