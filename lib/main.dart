import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<WorldTime> fetchWorldTime(String url) async {
  final response = await http
      .get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return WorldTime.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load WorldTime');
  }
}

class WorldTime {
  final String datetime;
  final String timezone;
  final String utc_offset;

  const WorldTime({
    required this.datetime,
    required this.timezone,
    required this.utc_offset, 
  });

  factory WorldTime.fromJson(Map<String, dynamic> json) {
    return WorldTime(
      datetime: json['datetime'],
      timezone: json['timezone'],
      utc_offset: json['utc_offset'],
    );
  }
}

void main() => runApp(const MaterialApp(home: SearchTime()));

class SearchTime extends StatefulWidget {
  const SearchTime({super.key});

  @override
  State<SearchTime> createState() => _SearchTimeState();
}

class _SearchTimeState extends State<SearchTime> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Search World Time")
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Jakarta'))
                    );
                  },
                  child: const Text("Time in Jakarta"),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Manila'))
                    );
                  },
                  child: const Text("Time in Manila"),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Dubai'))
                    );
                  },
                  child: const Text("Time in Dubai"),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Singapore'))
                    );
                  },
                  child: const Text("Time in Singapore"),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Shanghai'))
                    );
                  },
                  child: const Text("Time in Shanghai"),
                ),
              ]
            )
          )
        )
      )
    );
  }
}

class LocationTime extends StatefulWidget {
  late String url;
  LocationTime({
    super.key,
    required this.url,
  });

  @override
  State<LocationTime> createState() => _LocationTimeState();
}

class _LocationTimeState extends State<LocationTime> {
  late Future<WorldTime> futureWorldTime;

  @override
  void initState() {
    super.initState();
    futureWorldTime = fetchWorldTime(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('World Time'),
        ),
        body: Center(
          child: FutureBuilder<WorldTime>(
            future: futureWorldTime,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          snapshot.data!.timezone.substring(5),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                        const SizedBox(height: 5.0),
                        Text(snapshot.data!.datetime.substring(11, 16)),
                        const SizedBox(height: 5.0),
                        Text("GMT+${snapshot.data!.utc_offset.substring(2, 3)}"),
                      ]
                    )
                  )
                );
              } else if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error fetching data. Please restart'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SearchTime())
                        );
                      },
                      child: Text("Back")
                    )
                  ],
                );
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}