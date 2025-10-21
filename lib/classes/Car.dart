import 'Vechile.dart';
import 'Engine.dart';
import 'package:task_1/util/Enums.dart';
class Car extends Vechicle{
  int _chairNumber;
  bool _isFurnitureLeather;

  Car.defaultCar(): _chairNumber =4,_isFurnitureLeather= false , super.defaultVechicle();

  Car.parameterizedCar(super.manufacturerCompany, super.manufactureDate, super.model, super.engine, super.plateNumber, super.gearType, super.bodySerialNumber, super.width, super.length, super.color, this._chairNumber, this._isFurnitureLeather)
  : super.parameterizedVechicle();

  //getter for private variable
  int getNumberOfDoors() => _chairNumber;
  bool getIsFurnitureLeather() => _isFurnitureLeather;
  //setter for private variable
  void setNumberOfDoors(int chairNumber) {
    _chairNumber = chairNumber;
  }
  void setIsFurnitureLeather(bool isFurnitureLeather) {
    _isFurnitureLeather = isFurnitureLeather; 
  }


  @override
  Map<String, dynamic> toJson() {
    final vechicleJson = super.toJson();
    vechicleJson.addAll({
      'chairNumber': _chairNumber,
      'isFurnitureLeather': _isFurnitureLeather,
    });
    return vechicleJson;
  }

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car.parameterizedCar(
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
      json['chairNumber'],
      json['isFurnitureLeather'],
    );
  }

  @override
  String toString() {
    return 'Car(${super.toString()}, chairNumber: $_chairNumber, isFurnitureLeather: $_isFurnitureLeather)';
  } 
}

