import 'Automobile.dart';
import 'Engine.dart';
import 'package:task_1/util/Enums.dart';
class Motorcycle extends Automobile{
  double _tierDiameter;
  double _length;

  Motorcycle.defaultMotorcycle(): _tierDiameter =0.0 , _length=0.0, super.defaultAutomobile();

  Motorcycle.parameterizedMotorcycle(super.manufacturerCompany, super.manufactureDate, super.model, super.engine, super.plateNumber, super.gearType, super.bodySerialNumber, this._tierDiameter, this._length)
  : super.parameterizedAutomobile();



  //getters for private variables
  double getTierDiameter() => _tierDiameter;
  double getLength() => _length;

  //setters for private variables
  void setTierDiameter(double tierDiameter) {
    _tierDiameter = tierDiameter;
  }
  void setLength(double length) {
    _length = length;
  }

  @override
  Map<String, dynamic> toJson() {
    final automobileJson = super.toJson();
    automobileJson.addAll({
      'tierDiameter': _tierDiameter,
      'length': _length,
    });
    return automobileJson;
  }

  factory Motorcycle.fromJson(Map<String, dynamic> json) {
    return Motorcycle.parameterizedMotorcycle(
      json['manufacturerCompany'],
      DateTime.parse(json['manufactureDate']),
      json['model'],
      Engine.fromJson(json['engine']),
      json['plateNumber'],
      GearType.values.firstWhere((e) => e.toString().split('.').last == json['gearType']),
      json['bodySerialNumber'],
      json['tierDiameter'],
      json['length'],
    );
  }

  @override
  String toString() {
    return 'Motorcycle(${super.toString()}, tierDiameter: $_tierDiameter, length: $_length)';
  } 
}
