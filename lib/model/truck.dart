
import 'package:meta/meta.dart';

class Truck{
 final int id;
 final String truckName;
 final String plateNumber;
 final String driverName;
 final String truckCapacity;
 final double truckRating;
 final String truckImageUrl;

 Truck({
   @required this.id,
   @required this.truckName,
   @required this.plateNumber,
   @required this.driverName,
   @required this.truckCapacity,
   @required this.truckRating,
   @required this.truckImageUrl,
  });
}


