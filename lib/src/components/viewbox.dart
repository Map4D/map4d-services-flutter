import '../components.dart';

class MFViewboxComponent {
  /// The southwest corner of the rectangle.
  final MFLocationComponent southwest;

  /// The northeast corner of the rectangle.
  final MFLocationComponent northeast;

  /// Creates geographical bounding box with the specified corners.
  const MFViewboxComponent({required this.southwest, required this.northeast});

  Object toJson() {
    return <String, Object>{
      'southwest': southwest.toJson(),
      'northeast': northeast.toJson(),
    };
  }
}
