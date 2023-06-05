import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "ingatSholat",
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600
              )
            )
          )
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromARGB(255, 235, 247, 255),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 15.0),
                Text(
                  "Don't forget to pray wherever you are",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  )
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 400.0,
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Jakarta'))
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 25.0, 20.0, 25.0),
                            child: Text(
                              "Find how many hours before pray in: ",
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400
                              )
                            ),
                          ),
                          Text(
                            "Jakarta",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400.0,
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Tokyo'))
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 25.0, 20.0, 25.0),
                            child: Text(
                              "Find how many hours before pray in: ",
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400
                              )
                            ),
                          ),
                          Text(
                            "Tokyo",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400.0,
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Manila'))
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 25.0, 20.0, 25.0),
                            child: Text(
                              "Find how many hours before pray in: ",
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400
                              )
                            ),
                          ),
                          Text(
                            "Manila",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400.0,
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Dubai'))
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 25.0, 20.0, 25.0),
                            child: Text(
                              "Find how many hours before pray in: ",
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400
                              )
                            ),
                          ),
                          Text(
                            "Dubai",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400.0,
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Taipei'))
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 25.0, 20.0, 25.0),
                            child: Text(
                              "Find how many hours before pray in: ",
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400
                              )
                            ),
                          ),
                          Text(
                            "Taipei",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 400.0,
                  child: Card(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocationTime(url: 'https://worldtimeapi.org/api/timezone/Asia/Seoul'))
                        );
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12.0, 25.0, 20.0, 25.0),
                            child: Text(
                              "Find how many hours before pray in: ",
                              style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w400
                              )
                            ),
                          ),
                          Text(
                            "Seoul",
                            style: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.0,
                            )
                          )
                        ],
                      ),
                    ),
                  ),
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

  // Calculate how many hours away
  String fajr = "04:35";
  String dhuhr = "11:51";
  String asr = "15:14";
  String maghrib = "17:45";
  String isha = "18:59";

  late int fajrHours, dhuhrHours, asrHours, maghribHours, ishaHours;
  late int fajrMinutes, dhuhrMinutes, asrMinutes, maghribMinutes, ishaMinutes;
  late DateTime now;

  late DateTime fajrEnd, dhuhrEnd, asrEnd, maghribEnd, ishaEnd;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'ingatSholat',
              style: GoogleFonts.plusJakartaSans(
                fontWeight: FontWeight.w600
              )
            ),
          ),
        ),
        body: Center(
          child: FutureBuilder<WorldTime>(
            future: futureWorldTime,
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                
                now = DateFormat("HH:mm").parse(snapshot.data!.datetime.substring(11, 16), true);

                // Calculate time before Fajr
                fajrEnd = DateFormat("HH:mm").parse(fajr, true);
                if (fajrEnd.isBefore(now)) {
                  fajrEnd = fajrEnd.add(Duration(days: 1));
                }
                Duration fajrDurationDifference = fajrEnd.difference(now);
                fajrHours = fajrDurationDifference.inHours.abs();
                fajrMinutes = fajrDurationDifference.inMinutes % 60;

                // Calculate time before Dhuhr
                dhuhrEnd = DateFormat("HH:mm").parse(dhuhr, true);
                if (dhuhrEnd.isBefore(now)) {
                  dhuhrEnd = dhuhrEnd.add(Duration(days: 1));
                }
                Duration dhuhrDurationDifference = dhuhrEnd.difference(now);
                dhuhrHours = dhuhrDurationDifference.inHours.abs();
                dhuhrMinutes = dhuhrDurationDifference.inMinutes % 60;

                // Calculate time before Asr
                asrEnd = DateFormat("HH:mm").parse(asr, true);
                if (asrEnd.isBefore(now)) {
                  asrEnd = asrEnd.add(Duration(days: 1));
                }
                Duration asrDurationDifference = asrEnd.difference(now);
                asrHours = asrDurationDifference.inHours.abs();
                asrMinutes = asrDurationDifference.inMinutes % 60;

                // Calculate time before Maghrib
                maghribEnd = DateFormat("HH:mm").parse(maghrib, true);
                if (maghribEnd.isBefore(now)) {
                  maghribEnd = maghribEnd.add(Duration(days: 1));
                }
                Duration maghribDurationDifference = maghribEnd.difference(now);
                maghribHours = maghribDurationDifference.inHours.abs();
                maghribMinutes = maghribDurationDifference.inMinutes % 60;
                
                // Calculate time before Isha
                ishaEnd = DateFormat("HH:mm").parse(isha, true);
                if (ishaEnd.isBefore(now)) {
                  ishaEnd = ishaEnd.add(Duration(days: 1));
                }
                Duration ishaDurationDifference = ishaEnd.difference(now);
                ishaHours = ishaDurationDifference.inHours.abs();
                ishaMinutes = ishaDurationDifference.inMinutes % 60;

                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "It's ${snapshot.data!.datetime.substring(11, 16)} in ${snapshot.data!.timezone.substring(5)}",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          "It's $fajrHours hours and $fajrMinutes minutes away from Fajr",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "It's $dhuhrHours hours and $dhuhrMinutes minutes away from Dhuhr",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "It's $asrHours hours and $asrMinutes minutes away from Asr",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "It's $maghribHours hours and $maghribMinutes minutes away from Maghrib",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "It's $ishaHours hours and $ishaMinutes minutes away from Isha",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          )
                        ),
                        const SizedBox(height: 18.0),
                        Text(
                          "Don't forget to pray today :)",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          )
                        ),
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