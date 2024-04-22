
import 'dart:convert';

WheaterApiResponse wheaterApiResponseFromJson(String str) => WheaterApiResponse.fromJson(json.decode(str));

String wheaterApiResponseToJson(WheaterApiResponse data) => json.encode(data.toJson());

class WheaterApiResponse {
    final Location location;
    final Current current;
    final Forecast forecast;

    WheaterApiResponse({
        required this.location,
        required this.current,
        required this.forecast,
    });

    factory WheaterApiResponse.fromJson(Map<String, dynamic> json) => WheaterApiResponse(
        location: Location.fromJson(json["location"]),
        current: Current.fromJson(json["current"]),
        forecast: Forecast.fromJson(json["forecast"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "current": current.toJson(),
        "forecast": forecast.toJson(),
    };
}

class Current {
    final Condition condition;

    Current({
        required this.condition,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        condition: Condition.fromJson(json["condition"]),
    );

    Map<String, dynamic> toJson() => {
        "condition": condition.toJson(),
    };
}

class Condition {
    final String text;
    final String icon;

    Condition({
        required this.text,
        required this.icon,
    });

    factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json["text"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "icon": icon,
    };
}

class Forecast {
    final List<Forecastday> forecastday;

    Forecast({
        required this.forecastday,
    });

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        forecastday: List<Forecastday>.from(json["forecastday"].map((x) => Forecastday.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
    };
}

class Forecastday {
    final DateTime date;
    final Day day;
    final Astro astro;
    final List<Hour> hour;

    Forecastday({
        required this.date,
        required this.day,
        required this.astro,
        required this.hour,
    });

    factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
        date: DateTime.parse(json["date"]),
        day: Day.fromJson(json["day"]),
        astro: Astro.fromJson(json["astro"]),
        hour: List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "day": day.toJson(),
        "astro": astro.toJson(),
        "hour": List<dynamic>.from(hour.map((x) => x.toJson())),
    };
}

class Astro {
    Astro();

    factory Astro.fromJson(Map<String, dynamic> json) => Astro(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Day {
    final int dailyWillItRain;
    final int dailyChanceOfRain;
    final Condition condition;

    Day({
        required this.dailyWillItRain,
        required this.dailyChanceOfRain,
        required this.condition,
    });

    factory Day.fromJson(Map<String, dynamic> json) => Day(
        dailyWillItRain: json["daily_will_it_rain"],
        dailyChanceOfRain: json["daily_chance_of_rain"],
        condition: Condition.fromJson(json["condition"]),
    );

    Map<String, dynamic> toJson() => {
        "daily_will_it_rain": dailyWillItRain,
        "daily_chance_of_rain": dailyChanceOfRain,
        "condition": condition.toJson(),
    };
}

class Hour {
    final Astro condition;

    Hour({
        required this.condition,
    });

    factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        condition: Astro.fromJson(json["condition"]),
    );

    Map<String, dynamic> toJson() => {
        "condition": condition.toJson(),
    };
}

class Location {
    final String name;
    final String region;
    final String country;
    final double lat;
    final double lon;
    final String tzId;
    final int localtimeEpoch;
    final String localtime;

    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.lat,
        required this.lon,
        required this.tzId,
        required this.localtimeEpoch,
        required this.localtime,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
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
