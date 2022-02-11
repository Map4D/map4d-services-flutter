import '../components.dart';

class MFViewboxComponent {

  final MFLocationComponent southwest;
  final MFLocationComponent northeast;

  const MFViewboxComponent({
    required this.southwest,
    required this.northeast
  });

  Object toJson() {
    return <String, Object>{
      'southwest': southwest.toJson(),
      'northeast': northeast.toJson(),
    };
  }
}