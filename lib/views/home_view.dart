import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:wheather_app/cubits/get_weather_cubit/get_wheather_state.dart';
import 'package:wheather_app/main.dart';
import 'package:wheather_app/views/search_view.dart';
import 'package:wheather_app/widgets/no_weather_body.dart';
import 'package:wheather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
            .weatherModel
            ?.weatherCondition),
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) {
          return NoWeatherBody();
        } else if (state is WeatherLoadedState)
          return WeatherInfoBody(
            weather: state.weatherModel,
          );
        else
          return Text('opps there was an error');
      }),
    );
  }
}
