import 'Vechile.dart';
import 'Engine.dart';
import '../util/Enums.dart';
class Truck extends Vechicle{
  double _freeWeight;
  double _fullWeight;
  Truck.defaultTruck():_freeWeight =0.0, _fullWeight=0.0,super.defaultVechicle();

  Truck.parameterizedTruck(super.manufacturerCompany, super.manufactureDate, super.model, super.engine, super.plateNumber, super.gearType, super.bodySerialNumber, super.width, super.length, super.color, this._freeWeight, this._fullWeight)
  : super.parameterizedVechicle();

  //getters for private variables
  double getFreeWeight() => _freeWeight;
  double getFullWeight() => _fullWeight;

  //setters for private variables
  void setFreeWeight(double freeWeight) {
    _freeWeight = freeWeight;
  }
  void setFullWeight(double fullWeight) {
    _fullWeight = fullWeight;
  }

  @override
  Map<String, dynamic> toJson() {
    final vechicleJson = super.toJson();
    vechicleJson.addAll({
      'freeWeight': _freeWeight,
      'fullWeight': _fullWeight,
    });
    return vechicleJson;
  }

  factory Truck.fromJson(Map<String, dynamic> json) {
    return Truck.parameterizedTruck(
      json['manufacturerCompany'],
      DateTime.parse(json['manufactureDate']),
      json['model'],
      Engine.fromJson(json['engine']),
      json['plateNumber'],
      GearType.values.firstWhere((e) => e.toString().split('.').last == json['gearType']),
      json['bodySerialNumber'],
      json['width'],
      json['length'],
      json['color'],
      json['freeWeight'],
      json['fullWeight'],
    );
  }

  @override
  String toString() {
    return 'Truck(${super.toString()}, freeWeight: $_freeWeight, fullWeight: $_fullWeight)';
  } 
}
