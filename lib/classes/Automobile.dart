import 'package:task_1/classes/Engine.dart';
import 'package:task_1/util/Enums.dart';
class Automobile{
  String _manufacturerCompany;
  DateTime _manufactureDate;
  String _model;
  Engine _engine;
  int _plateNumber;
  GearType _gearType;
  int _bodySerialNumber;



  //getters for private variables
  String getManufacturerCompany() => _manufacturerCompany;
  DateTime getManufactureDate() => _manufactureDate;
  String getModel() => _model;
  Engine getEngine() => _engine;
  int getPlateNumber() => _plateNumber;
  GearType getGearType() => _gearType;
  int getBodySerialNumber() => _bodySerialNumber;


  //setters for private variables
  void setManufacturerCompany(String manufacturerCompany) {
    _manufacturerCompany = manufacturerCompany;
  } 
  void setManufactureDate(DateTime manufactureDate) {
    _manufactureDate = manufactureDate;
  }
  void setModel(String model) {
    _model = model;
  } 
  void setEngine(Engine engine) {
    _engine = engine;
  }
  void setPlateNumber(int plateNumber) {
    _plateNumber = plateNumber;
  }

  void setGearType(GearType gearType) {
    _gearType = gearType;
  }
  void setBodySerialNumber(int bodySerialNumber) {
    _bodySerialNumber = bodySerialNumber; 
  }

  //default constructor
  Automobile.defaultAutomobile():    _manufacturerCompany = "Default Company",
    _manufactureDate = DateTime.now(),
    _model = "Default Model",
    _engine = Engine.defaultEngine(),
    _plateNumber = 0000,
    _gearType = GearType.normal,
    _bodySerialNumber = 000000; 


    //fully parameterized constructor
  Automobile.parameterizedAutomobile(this._manufacturerCompany, this._manufactureDate, this._model, this._engine, this._plateNumber, this._gearType, this._bodySerialNumber);

  Map<String, dynamic> toJson() {
    return {
      'manufacturerCompany': _manufacturerCompany,
      'manufactureDate': _manufactureDate.toIso8601String(),
      'model': _model,
      'engine': _engine.toJson(),
      'plateNumber': _plateNumber,
      'gearType': _gearType.toString().split('.').last,
      'bodySerialNumber': _bodySerialNumber,
    };
  }

    factory Automobile.fromJson(Map<String, dynamic> json) {
      return Automobile.parameterizedAutomobile(
        json['manufacturerCompany'],
        DateTime.parse(json['manufactureDate']),
        json['model'],
        Engine.fromJson(json['engine']),
        json['plateNumber'],
        GearType.values.firstWhere((e) => e.toString().split('.').last == json['gearType']),
        json['bodySerialNumber'],
      );
    }
    @override
    String toString() {
      return 'Automobile(manufacturerCompany: $_manufacturerCompany, manufactureDate: $_manufactureDate, model: $_model, engine: $_engine, plateNumber: $_plateNumber, gearType: $_gearType, bodySerialNumber: $_bodySerialNumber)';
    }
}
