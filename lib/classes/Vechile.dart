import 'Automobile.dart';
import 'Engine.dart';
import 'package:task_1/util/Enums.dart';
class Vechicle extends Automobile{
  int _length;
  int _width;
  String _color;

  Vechicle.defaultVechicle(): _length =0 , _width=0, _color = "red", super.defaultAutomobile();

  Vechicle.parameterizedVechicle(super.manufacturerCompany, super.manufactureDate, super.model, super.engine, super.plateNumber, super.gearType, super.bodySerialNumber, this._width, this._length, this._color)
  : super.parameterizedAutomobile();

  //getters for private variables
  int getLength() => _length;
  int getWidth() => _width;
  String getColor() => _color;

  //setters for private variables
  void setLength(int length) {
    _length = length; 
  } 
  void setWidth(int width) {
    _width = width;
  }
  void setColor(String color) {
    _color = color;
  }

  @override
  Map<String, dynamic> toJson() {
    final automobileJson = super.toJson();
    automobileJson.addAll({
      'length': _length,
      'width': _width,
      'color': _color,
    });
    return automobileJson;
  }

  factory Vechicle.fromJson(Map<String, dynamic> json) {
    return Vechicle.parameterizedVechicle(
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
    );
  }

  @override
  String toString() {
    return 'Vechicle(${super.toString()}, length: $_length, width: $_width, color: $_color)';
  } 
}
