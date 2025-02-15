import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/apis/api_manager.dart';
import 'package:movies_app/home_content/tabs/home_tab/movie_carousel.dart';
import 'package:movies_app/models/MoviesDataResponse.dart';
import 'package:movies_app/theme/app_colors.dart';
import 'package:movies_app/theme/app_image.dart';


class HomeTab extends StatefulWidget {

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<HomeTab> {
  List movies = [];
  late Future<MoviesDataResponse> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = ApiManager.fetchMovies();
  }
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      body:
           FutureBuilder(
             future: ApiManager.fetchMovies(),
          builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(color: AppColors.yellowColor),
              );
            }
            else if(snapshot.hasError){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Something went wrong!"),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {}); // Refresh the FutureBuilder
                      },
                      child: const Text("Try again"),
                    ),
                  ],
                ),
              );
            }
          else if (!snapshot.hasData || snapshot.data!.status != 'ok') {

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data?.statusMessage?? "No data available"),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {}); // Refresh the FutureBuilder
                      },
                      child: const Text("Try again"),
                    ),
                  ],
                ),
              );
            }
            var moviesList = snapshot.data!.data!.movies ?? [];
            if (moviesList.isEmpty) {
              return const Center(
                child: Text("No Movies found for this source."),
              );
            }
            return Container(
              height: height*.68,
              child: Stack(

               children: [
                Image.asset(AppImage.homeBg,fit: BoxFit.cover,width: double.infinity,),
                 Align(
                     child: MovieCarousel(movies: moviesList)),
                 SizedBox(
                   height: .1,
                 )


               ],
              ),
            );
          },)
      ,
      
      // ListView.builder(
      //   itemCount: movies.length,
      //   itemBuilder: (context, index) {
      //     final movie = movies[index];
      //     return ListTile(
      //       leading: CachedNetworkImage(
      //         imageUrl: "http://via.placeholder.com/350x150",
      //         progressIndicatorBuilder: (context, url, downloadProgress) =>
      //             CircularProgressIndicator(value: downloadProgress.progress),
      //         errorWidget: (context, url, error) => Icon(Icons.error),
      //       ),
      //       title: Text(movie['title']),
      //       subtitle: Text('Year: ${movie['year']}'),
      //     );
      //   },
      // ),
    );
  }
}
