import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vistaar_assignment_app/model/movie_data.dart';
import 'package:vistaar_assignment_app/widgets/common_widget.dart';

import '../network/api/movie_repository.dart';
import '../provider/shared_preference.dart';
import '../routes/route_name.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<MovieData?> movieList = [];
  bool filter1 = false;
  bool filter2 = false;
  @override
  void initState() {
    ref.read(movieRepositoryProvider).getData().then((value) {
      value.sort((a, b) => a!.year ?? 0.compareTo(b!.year ?? 0));
      movieList = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = ref.read(sharedUtilityProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            text(
              text: "Welcome, ",
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
            text(
              text: sharedPreferences.getUsername(),
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                filter1 = filter1 ? false : true;
                if (filter1) {
                  movieList
                      .sort((a, b) => a!.year ?? 0.compareTo(b!.year ?? 0));
                } else {
                  movieList
                      .sort((a, b) => b!.year ?? 0.compareTo(a!.year ?? 0));
                }
              });
            },
            child: Container(
              width: 85,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25,
                ),
                color: const Color(0xFFd9d9d9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(
                    text: "Year",
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  filter1
                      ? const Icon(
                          Icons.arrow_upward_outlined,
                        )
                      : const Icon(
                          Icons.arrow_downward_outlined,
                        )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  filter2 = filter2 ? false : true;
                  if (filter2) {
                    movieList.sort((a, b) {
                      var a1 = a!.runtime?.toInt() ?? 0;
                      var b1 = b!.runtime?.toInt() ?? 0;

                      return a1 - b1;
                    });
                  } else {
                    movieList.sort((a, b) {
                      var a1 = a!.runtime?.toInt() ?? 0;
                      var b1 = b!.runtime?.toInt() ?? 0;

                      return b1 - a1;
                    });
                  }
                },
              );
            },
            child: Container(
              width: 85,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25,
                ),
                color: const Color(0xFFd9d9d9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(
                    text: "Runtime",
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  filter2
                      ? const Icon(Icons.arrow_upward_outlined)
                      : const Icon(Icons.arrow_downward_outlined)
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: FutureBuilder(
          future: Future.delayed(
            const Duration(
              seconds: 3,
            ),
          ),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  itemCount: movieList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 1.95),
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 25.0,
                  ),
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.detailScreen,
                            arguments: movieList[index]);
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                    "https://parade.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkwNTgxMjkxNjk3NDQ4ODI4/marveldisney.jpg"),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              autoSizeTextV(
                                text: movieList[index]!.title ?? "None",
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                maxLines: 2,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              text(
                                text: "Release Date:",
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              text(
                                text:
                                    "${movieList[index]!.month}, ${movieList[index]!.year}",
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              text(
                                text: "Run Time:",
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              text(
                                text:
                                    "${movieList[index]!.runtime.toString()} mins",
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}
