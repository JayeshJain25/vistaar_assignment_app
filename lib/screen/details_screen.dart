import 'package:flutter/material.dart';
import 'package:vistaar_assignment_app/model/movie_data.dart';
import 'package:vistaar_assignment_app/widgets/common_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movieData,
  });

  final MovieData movieData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text(
          text: movieData.title!,
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    "https://parade.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTkwNTgxMjkxNjk3NDQ4ODI4/marveldisney.jpg"),
              ),
              const SizedBox(
                height: 15,
              ),
              text(
                text: movieData.desc!,
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  text(
                    text: "Run Time : ",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  text(
                    text: "${movieData.runtime} mins",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  text(
                    text: "Release Date : ",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  text(
                    text: "${movieData.month}, ${movieData.year}",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
