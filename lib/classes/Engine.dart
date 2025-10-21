// ignore: file_names
import 'package:task_1/util/Enums.dart';
class Engine{
  String _manufacturer;
  DateTime _manufactureDate;
  String _model;
  int _capacity;
  int cylinders;
  FuelType _fuelType;


  //getters for private variables 
  String getManufacturer() => _manufacturer;
  DateTime getManufactureDate() => _manufactureDate;
  String getModel() => _model;
  int getCapacity() => _capacity;
  FuelType getFuelType() => _fuelType;


  //setters for private variables
  void setManufacturer(String manufacturer) {
    _manufacturer = manufacturer;
  }
  void setManufactureDate(DateTime manufactureDate) {
    _manufactureDate = manufactureDate;
  }
  void setModel(String model) {
    _model = model;
  }
  void setCapacity(int capacity) {
    _capacity = capacity;
  }
  void setFuelType(FuelType fuelType) {
    _fuelType = fuelType;
  }
  
  Engine.defaultEngine():
    _manufacturer = "Default Manufacturer",
    _manufactureDate = DateTime.now(),
    _model = "Default Model",
    _capacity = 1000,
    cylinders = 4,
    _fuelType = FuelType.gasoline;
  Engine.parameterizedEngine(this._manufacturer, this._manufactureDate, this._model, this._capacity, this.cylinders, this._fuelType);

  Map<String, dynamic> toJson() {
    return {
      'manufacturer': _manufacturer,
      'manufactureDate': _manufactureDate.toIso8601String(),
      'model': _model,
      'capacity': _capacity,
      'cylinders': cylinders,
      'fuelType': _fuelType.toString().split('.').last,
    };
  }

    factory Engine.fromJson(Map<String, dynamic> json) {
      return Engine.parameterizedEngine(
        json['manufacturer'],
        DateTime.parse(json['manufactureDate']),
        json['model'],
        json['capacity'],
        json['cylinders'],
        FuelType.values.firstWhere((e) => e.toString().split('.').last == json['fuelType']),
      );
    }

    @override
    String toString() {
      return 'Engine(manufacturer: $_manufacturer, manufactureDate: $_manufactureDate, model: $_model, capacity: $_capacity, cylinders: $cylinders, fuelType: $_fuelType)';
    }
}

