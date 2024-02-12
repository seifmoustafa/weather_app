// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wheather_app/main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.weatherCondition),
        title: const Text(
          'Search City',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              // log(weatherModel.cityName);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              hintText: 'Enter city name',
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition),
                ),
              ),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(
              //     color: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
              //         .weatherModel
              //         ?.weatherCondition),
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
