import 'package:better_hm/home/dashboard/dashboard_card.dart';
import 'package:better_hm/home/dashboard/mvg/departure.dart';
import 'package:better_hm/home/dashboard/mvg/next_departures.dart';
import 'package:better_hm/home/dashboard/mvg/service/api_mvg.dart';
import 'package:better_hm/home/dashboard/semester_status/api_semester_status.dart';
import 'package:better_hm/home/dashboard/semester_status/models/semester_event.dart';
import 'package:better_hm/home/dashboard/semester_status/semester_status.dart';
import 'package:better_hm/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final cards = <DashboardCard>{
  DashboardCard<List<SemesterEvent>>(
    title: t.dashboard.statusCard.title,
    cardId: "SEMESTER_STATUS",
    card: (events) => SemesterStatus(events: events),
    future: () => ApiSemesterStatus().getEvents(),
  ),
  DashboardCard<List<Departure>>(
    title: t.dashboard.mvg.title,
    cardId: "NEXT_DEPARTURES",
    card: (departures) => NextDepartures(departures: departures),
    future: () =>
        ApiMvg().getDepartures(stopId: stopIdLothstr, lineIds: lineIdsLothstr),
  ),
  DashboardCard(
    title: "TESTCARD",
    cardId: "TESTCARD",
    card: (_) => SvgPicture.network(
      "https://www.mvv-muenchen.de/fileadmin/lines/02021.svg",
    ),
    future: () => Future.value(),
  ),
};
