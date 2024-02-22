import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/model/newsmodel.dart';
import 'package:news_app/screens/full_screen.dart';
import 'package:news_app/services/api_services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<NewsModel>? fetchdata;
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    fetchdata = getNews();
  }

  Future<NewsModel> getNews() async {
    return ApiServices().getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'Tech',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: Color.fromARGB(164, 0, 0, 0),
                fontSize: 28,
              ),
            ),
            children: [
              TextSpan(
                text: 'Pulse',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Color.fromARGB(99, 0, 0, 0),
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: fetchdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final deslen = snapshot.data!.des.length;
            final cntlen = snapshot.data!.content.length;
            return PageView.builder(
              onPageChanged: (_) {
                setState(() {
                  fetchdata = getNews();
                });
              },
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Image.network(
                      snapshot.data!.urlToImage,
                      fit: BoxFit.cover,
                      height: 300,
                      width: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 435,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 20,
                            bottom: 0,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.title,
                                  style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  deslen < 150
                                      ? snapshot.data!.des
                                      : '${snapshot.data!.des.substring(0, 150)}...',
                                  style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Text(
                                  cntlen < 200
                                      ? snapshot.data!.content
                                          .substring(0, cntlen - 13)
                                      : '${snapshot.data!.content.substring(0, 200)}...',
                                  style: GoogleFonts.notoSans(
                                    textStyle: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Source: ${snapshot.data!.sourceName}',
                                  style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => FullScreen(
                                url: snapshot.data!.url,
                              ),
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Text('Read More'),
                            SizedBox(width: 3),
                            Icon(Icons.arrow_right_alt)
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitThreeBounce(
                color: Colors.black,
                size: 30,
              ),
            );
          } else {
            return const Center(
              child: Text('Error Fetching Data!!!'),
            );
          }
        },
      ),
    );
  }
}
