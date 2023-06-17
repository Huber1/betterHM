import 'dart:convert';

import 'package:better_hm/home/dashboard/mvg/departure.dart';
import 'package:better_hm/home/dashboard/mvg/service/api_mvg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Parsing departures works", () async {
    final Map<String, dynamic> json = jsonDecode(
        """{"error":"","departures":[{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:21","departureLive":"21:21","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:25","departureLive":"21:25","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\u00dfe","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:25","departureLive":"21:25","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:29","departureLive":"21:29","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:31","departureLive":"21:31","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\u00dfe","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:35","departureLive":"21:35","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:35","departureLive":"21:35","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:39","departureLive":"21:39","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:41","departureLive":"21:41","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\u00dfe","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:45","departureLive":"21:45","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:45","departureLive":"21:45","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:49","departureLive":"21:49","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:51","departureLive":"21:51","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:55","departureLive":"21:55","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\u00dfe","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:55","departureLive":"21:55","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"21:59","departureLive":"21:59","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:01","departureLive":"22:01","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\u00dfe","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:05","departureLive":"22:05","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:05","departureLive":"22:05","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:09","departureLive":"22:09","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:12","departureLive":"22:12","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:15","departureLive":"22:15","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:20","departureLive":"22:20","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:22","departureLive":"22:22","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\u00dfe","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:22","departureLive":"22:22","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:25","departureLive":"22:25","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:30","departureLive":"22:30","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:32","departureLive":"22:32","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\u00dfe","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:42","departureLive":"22:42","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:44","departureLive":"22:44","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:50","departureLive":"22:50","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"22:52","departureLive":"22:52","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\u00dfe","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"23:02","departureLive":"23:02","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"23:04","departureLive":"23:04","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"23:10","departureLive":"23:10","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"23:12","departureLive":"23:12","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\u00dfe","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"23:22","departureLive":"23:22","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"23:24","departureLive":"23:24","inTime":true,"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz (Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz (Stachus)","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"23:30","departureLive":"23:30","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Moosach Bf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"Moosach Bf.","station":{"id":"91000012","name":"Hochschule M\u00fcnchen (Lothstr.)"},"track":"","departureDate":"20230604","departurePlanned":"23:32","departureLive":"23:32","inTime":true,"notifications":[]}],"notifications":[{"text":"Tram 21/N19: Umleitung zwischen Max-Weber-Platz und Haidenauplatz (22.05. - 11.06.2023)","link":"https://www.mvg.de/api/ems/tickers/file/1484ddb0-ef5c-43ca-8e7b-fde50bb90546_-1326653268.jpg","type":"line"}]}""");

    final departures = ApiMvg().parseDepartures(json["departures"]);

    expect(
      departures,
      isA<List<Departure>>(),
    );
  });

  test("Parsing departures with some live departures not set", () {
    final Map<String, dynamic> json = jsonDecode(
        """{"error":"","departures":[{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:15","departureLive":"14:15","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:16","departureLive":"14:16","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Universit\\u00e4t","stateless":"swm:03153:G:H:013","name":"Bus"},"direction":"Universit\\u00e4t","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:17","departureLive":"14:17","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz(Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz(Stachus)","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:20","departureLive":"14:20","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"MoosachBf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"MoosachBf.","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:21","departureLive":"14:21","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Trappentreustra\\u00dfe","stateless":"swm:03153:G:R:013","name":"Bus"},"direction":"Trappentreustra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:21","departureLive":"14:25","inTime":false,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"HochschuleM\\u00fcnchen","stateless":"swm:02029:G:H:013","name":"Tram"},"direction":"HochschuleM\\u00fcnchen","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:23","departureLive":"14:24","inTime":false,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"Willibaldplatz","stateless":"swm:02029:G:R:013","name":"Tram"},"direction":"Willibaldplatz","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:24","departureLive":"Haltentf\\u00e4llt","inTime":false,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:25","departureLive":"14:25","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:26","departureLive":"14:26","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Universit\\u00e4t","stateless":"swm:03153:G:H:013","name":"Bus"},"direction":"Universit\\u00e4t","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:27","departureLive":"14:27","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz(Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz(Stachus)","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:30","departureLive":"14:30","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Trappentreustra\\u00dfe","stateless":"swm:03153:G:R:013","name":"Bus"},"direction":"Trappentreustra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:31","departureLive":"14:31","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"MoosachBf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"MoosachBf.","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:31","departureLive":"14:31","inTime":true,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"HochschuleM\\u00fcnchen","stateless":"swm:02029:G:H:013","name":"Tram"},"direction":"HochschuleM\\u00fcnchen","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:33","departureLive":"14:34","inTime":false,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"Willibaldplatz","stateless":"swm:02029:G:R:013","name":"Tram"},"direction":"Willibaldplatz","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:34","departureLive":"14:34","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:35","departureLive":"14:35","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:36","departureLive":"14:36","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Universit\\u00e4t","stateless":"swm:03153:G:H:013","name":"Bus"},"direction":"Universit\\u00e4t","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:37","departureLive":"14:37","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz(Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz(Stachus)","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:40","departureLive":"14:40","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Trappentreustra\\u00dfe","stateless":"swm:03153:G:R:013","name":"Bus"},"direction":"Trappentreustra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:41","departureLive":"14:41","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"MoosachBf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"MoosachBf.","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:41","departureLive":"14:41","inTime":true,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"HochschuleM\\u00fcnchen","stateless":"swm:02029:G:H:013","name":"Tram"},"direction":"HochschuleM\\u00fcnchen","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:43","departureLive":"Haltentf\\u00e4llt","inTime":false,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"Willibaldplatz","stateless":"swm:02029:G:R:013","name":"Tram"},"direction":"Willibaldplatz","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:44","departureLive":"14:44","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:45","departureLive":"14:45","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:46","departureLive":"14:46","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Universit\\u00e4t","stateless":"swm:03153:G:H:013","name":"Bus"},"direction":"Universit\\u00e4t","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:47","departureLive":"Haltentf\\u00e4llt","inTime":false,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz(Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz(Stachus)","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:50","departureLive":"14:50","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Trappentreustra\\u00dfe","stateless":"swm:03153:G:R:013","name":"Bus"},"direction":"Trappentreustra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:51","departureLive":"14:51","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"MoosachBf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"MoosachBf.","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:51","departureLive":"14:51","inTime":true,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"HochschuleM\\u00fcnchen","stateless":"swm:02029:G:H:013","name":"Tram"},"direction":"HochschuleM\\u00fcnchen","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:53","departureLive":"14:53","inTime":true,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"Willibaldplatz","stateless":"swm:02029:G:R:013","name":"Tram"},"direction":"Willibaldplatz","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:54","departureLive":"Haltentf\\u00e4llt","inTime":false,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"Westfriedhof","stateless":"swm:02021:G:R:013","name":"Tram"},"direction":"Westfriedhof","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:55","departureLive":"14:55","inTime":true,"notifications":[]},{"line":{"number":"21","symbol":"02021.svg","direction":"St.-Veit-Stra\\u00dfe","stateless":"swm:02021:G:H:013","name":"Tram"},"direction":"St.-Veit-Stra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:56","departureLive":"14:56","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Universit\\u00e4t","stateless":"swm:03153:G:H:013","name":"Bus"},"direction":"Universit\\u00e4t","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"14:57","departureLive":"14:57","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"Karlsplatz(Stachus)","stateless":"swm:02020:G:H:013","name":"Tram"},"direction":"Karlsplatz(Stachus)","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"15:00","departureLive":"15:00","inTime":true,"notifications":[]},{"line":{"number":"153","symbol":"03153.svg","direction":"Trappentreustra\\u00dfe","stateless":"swm:03153:G:R:013","name":"Bus"},"direction":"Trappentreustra\\u00dfe","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"15:01","departureLive":"15:01","inTime":true,"notifications":[]},{"line":{"number":"20","symbol":"02020.svg","direction":"MoosachBf.","stateless":"swm:02020:G:R:013","name":"Tram"},"direction":"MoosachBf.","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"15:01","departureLive":"15:01","inTime":true,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"HochschuleM\\u00fcnchen","stateless":"swm:02029:G:H:013","name":"Tram"},"direction":"HochschuleM\\u00fcnchen","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"15:03","departureLive":"Haltentf\\u00e4llt","inTime":false,"notifications":[]},{"line":{"number":"29","symbol":"22029.svg","direction":"Willibaldplatz","stateless":"swm:02029:G:R:013","name":"Tram"},"direction":"Willibaldplatz","station":{"id":"91000012","name":"HochschuleM\\u00fcnchen(Lothstr.)"},"track":"","departureDate":"20230613","departurePlanned":"15:04","departureLive":"15:04","inTime":true,"notifications":[]}],"notifications":[]}""");

    final departures = ApiMvg().parseDepartures(json["departures"]);

    expect(
      departures,
      isA<List<Departure>>(),
    );
  });
}
