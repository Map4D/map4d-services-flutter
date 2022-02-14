package vn.map4d.services.map4d_services;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;
import java.util.Map;

class SConverter {

  private static Map<?, ?> toMap(Object o) {
    return (Map<?, ?>) o;
  }

  private static List<?> toList(Object o) {
    return (List<?>) o;
  }

  private static boolean toBoolean(Object o) {
    return (Boolean) o;
  }

  private static int toInt(Object o) {
    return ((Number) o).intValue();
  }

  private static long toLong(Object o) {
    return ((Number) o).longValue();
  }

  private static double toDouble(Object o) {
    return ((Number) o).doubleValue();
  }

  private static String toString(Object o) {
    return (String) o;
  }

  private static String toAvoidPath(Object o) {
    if (o == null) {
      return null;
    }
    StringBuilder resultBuilder = new StringBuilder();
    List<?> points = toList(o);
    for (int i = 0; i < points.size(); ++i) {
      resultBuilder.append(toLocation(points.get(i)));
      if (i < points.size() - 1) {
        resultBuilder.append(",");
      }
    }
    return resultBuilder.toString();
  }

  static String toRadius(Object o) {
    if (o == null) {
      return null;
    }
    int radius = toInt(o);
    return String.valueOf(radius);
  }

  static String toLocation(Object o) {
    if (o == null) {
      return null;
    }
    Map<?, ?> data = toMap(o);
    double lat = toDouble(data.get("lat"));
    double lng = toDouble(data.get("lng"));
    return lat + "," + lng;
  }

  static String toLocationAlias(Object o) {
    if (o == null) {
      return null;
    }
    Map<?, ?> data = toMap(o);
    String alias = toString(data.get("alias"));
    return alias;
  }

  static String toViewbox(Object o) {
    if (o == null) {
      return null;
    }
    Map<?, ?> data = toMap(o);
    String southWest = toLocation(data.get("southwest"));
    String northEast = toLocation(data.get("northeast"));
    return southWest + "," + northEast;
  }

  static String toDatetime(Object o) {
    if (o == null) {
      return null;
    }
    long datetime = toLong(o);
    return String.valueOf(datetime);
  }

  static String toTypes(Object o) {
    if (o == null) {
      return null;
    }
    StringBuilder result = new StringBuilder();
    List<?> data = toList(o);
    for (int i = 0; i < data.size(); ++i) {
      if (i > 0) {
        result.append("&types=");
      }
      result.append(data.get(i));
    }
    return result.toString();
  }

  static String toTags(Object o) {
    if (o == null) {
      return null;
    }
    StringBuilder result = new StringBuilder();
    List<?> data = toList(o);
    for (int i = 0; i < data.size(); ++i) {
      if (i > 0) {
        result.append("&tags=");
      }
      result.append(data.get(i));
    }
    return result.toString();
  }

  static String toAcronym(Object o) {
    if (o == null) {
      return null;
    }
    Boolean acronym = toBoolean(o);
    return acronym.toString();
  }

  static String toMode(Object o) {
    if (o == null) {
      return null;
    }
    Integer mode = toInt(o);
    switch (mode) {
      case 0:
        return "car";
      case 1:
        return "bike";
      case 2:
        return "foot";
      case 3:
        return "motorcycle";
      default:
        return null;
    }
  }

  static String toWeighting(Object o) {
    if (o == null) {
      return null;
    }
    Integer weighting = toInt(o);
    return weighting.toString();
  }

  static String toLanguage(Object o) {
    if (o == null) {
      return null;
    }
    Integer language = toInt(o);
    switch (language) {
      case 0:
        return "en";
      case 1:
        return "vi";
      default:
        return null;
    }
  }

  static String toLocationList(Object o) {
    if (o == null) {
      return null;
    }
    StringBuilder resultBuilder = new StringBuilder();
    List<?> waypoints = toList(o);
    for (int i = 0; i < waypoints.size(); ++i) {
      resultBuilder.append(toLocation(waypoints.get(i)));
      if (i < waypoints.size() - 1) {
        resultBuilder.append(";");
      }
    }
    return resultBuilder.toString();
  }

  static JSONArray toOriginJsonArray(Object o) {
    if (o == null) {
      return null;
    }
    JSONArray originsJsonArray = null;
    List<?> origins = toList(o);
    if (origins != null && origins.size() > 0) {
      originsJsonArray = new JSONArray();
    }
    for (int i = 0; i < origins.size(); ++i) {
      try {
        JSONObject originJsonObject = new JSONObject();
        String alias = toLocationAlias(origins.get(i));
        originJsonObject.put("alias", alias);
        StringBuilder locationStringBuilder = new StringBuilder();
        originJsonObject.put("location", toLocation(origins.get(i)));
        originsJsonArray.put(originJsonObject);
      } catch (JSONException e) {
        e.printStackTrace();
      }
    }
    return originsJsonArray;
  }

  static String toAvoid(Object o) {
    if (o == null) {
      return null;
    }
    StringBuilder resultBuilder = new StringBuilder();
    Map<?, ?> data = toMap(o);
    String location = toLocation(data.get("location"));
    if (location != null) {
      resultBuilder.append(location);
      if (data.get("radius") != null) {
        Integer radius = toInt(data.get("radius"));
        resultBuilder.append(",").append(radius);
      }
    }
    else if (data.get("viewbox") != null) {
      resultBuilder.append(toViewbox(data.get("viewbox")));
    }
    else if (data.get("path") != null) {
      resultBuilder.append(toAvoidPath(data.get("path")));
    }
    return resultBuilder.toString();
  }

  static String toAvoidRoads(Object o) {
    if (o == null) {
      return null;
    }
    Map<?, ?> data = toMap(o);
    if (data.get("types") != null) {
      StringBuilder resultBuilder = new StringBuilder();
      List<?> types = toList(data.get("types"));
      for (int i = 0; i < types.size(); ++i) {
        Integer type = toInt(types.get(i));
        switch (type) {
          case 0:
            resultBuilder.append("motorway");
            break;
          case 1:
            resultBuilder.append("trunk");
            break;
          case 2:
            resultBuilder.append("ferry");
            break;
          case 3:
            resultBuilder.append("bridge");
            break;
          case 4:
            resultBuilder.append("tunnel");
            break;
        }
        if (i < types.size() - 1) {
          resultBuilder.append(",");
        }
      }
      return resultBuilder.toString();
    }
    return null;
  }
}
