

import 'dart:convert';

FutureWheaterApiResponse wheaterApiResponseFutureFromJson(String str) => FutureWheaterApiResponse.fromJson(json.decode(str));

String wheaterApiResponseFutureToJson(FutureWheaterApiResponse data) => json.encode(data.toJson());

class FutureWheaterApiResponse {
    final FutureLocation location;
    final FutureForecast forecast;

    FutureWheaterApiResponse({
        required this.location,
        required this.forecast,
    });

    factory FutureWheaterApiResponse.fromJson(Map<String, dynamic> json) => FutureWheaterApiResponse(
        location: FutureLocation.fromJson(json["location"]),
        forecast: FutureForecast.fromJson(json["forecast"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "forecast": forecast.toJson(),
    };
}

class FutureForecast {
    final List<FutureForecastday> forecastday;

    FutureForecast({
        required this.forecastday,
    });

    factory FutureForecast.fromJson(Map<String, dynamic> json) => FutureForecast(
        forecastday: List<FutureForecastday>.from(json["forecastday"].map((x) => FutureForecastday.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
    };
}

class FutureForecastday {
    final DateTime date;
    final FutureDay day;
    final FutureAstro astro;
    final List<FutureHour> hour;

    FutureForecastday({
        required this.date,
        required this.day,
        required this.astro,
        required this.hour,
    });

    factory FutureForecastday.fromJson(Map<String, dynamic> json) => FutureForecastday(
        date: DateTime.parse(json["date"]),
        day: FutureDay.fromJson(json["day"]),
        astro: FutureAstro.fromJson(json["astro"]),
        hour: List<FutureHour>.from(json["hour"].map((x) => FutureHour.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day.toJson(),
        "astro": astro.toJson(),
        "hour": List<dynamic>.from(hour.map((x) => x.toJson())),
    };
}

class FutureAstro {
    FutureAstro();

    factory FutureAstro.fromJson(Map<String, dynamic> json) => FutureAstro(
    );

    Map<String, dynamic> toJson() => {
    };
}

class FutureDay {
    final FutureCondition condition;

    FutureDay({
        required this.condition,
    });

    factory FutureDay.fromJson(Map<String, dynamic> json) => FutureDay(
        condition: FutureCondition.fromJson(json["condition"]),
    );

    Map<String, dynamic> toJson() => {
        "condition": condition.toJson(),
    };
}

class FutureCondition {
    final String text;
    final String icon;

    FutureCondition({
        required this.text,
        required this.icon,
    });

    factory FutureCondition.fromJson(Map<String, dynamic> json) => FutureCondition(
        text: json["text"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
    };
}

class FutureHour {
    final FutureAstro condition;

    FutureHour({
        required this.condition,
    });

    factory FutureHour.fromJson(Map<String, dynamic> json) => FutureHour(
        condition: FutureAstro.fromJson(json["condition"]),
    );

    Map<String, dynamic> toJson() => {
        "condition": condition.toJson(),
    };
}

class FutureLocation {
    final String name;
    final String region;
    final String country;
    final double lat;
    final double lon;
    final String tzId;
    final int localtimeEpoch;
    final String localtime;

    FutureLocation({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    factory FutureLocation.fromJson(Map<String, dynamic> json) => FutureLocation(
        name: json["name"],
        region: json["region"],
        country: json["country"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        tzId: json["tz_id"],
        localtimeEpoch: json["localtime_epoch"],
        localtime: json["localtime"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "region": region,
        "country": country,
        "lat": lat,
        "lon": lon,
        "tz_id": tzId,
        "localtime_epoch": localtimeEpoch,
        "localtime": localtime,
    };
}
