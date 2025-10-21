import 'dart:convert';
import 'dart:io';
import 'package:task_1/classes/Motorcycle.dart';
import 'package:task_1/classes/Car.dart';
import 'package:task_1/classes/Truck.dart';

class VehicleManagementSystem{
  List<Motorcycle> motorcycles = [];
  List<Car> cars = [];
  List<Truck> trucks = [];

  void printMotorcycle(Motorcycle m) {
    print('Motorcycle: $m');
  }

  void addMotorcycle(Motorcycle motorcycle) {
    motorcycles.add(motorcycle);
  }

  void addCar(Car car) {
    cars.add(car);
  }

  void printCar(Car c) {
    print('Car: $c');
  }

  void addTruck(Truck truck) {
    trucks.add(truck);
  }

  void printTruck(Truck t) {
    print('Truck: $t');
  }

  void printAll() {
    print('=== ALL VEHICLES ===');
    print('\n--- Motorcycles ---');
    for (var motorcycle in motorcycles) {
      printMotorcycle(motorcycle);
    }
    print('\n--- Cars ---');
    for (var car in cars) {
      printCar(car);
    }
    print('\n--- Trucks ---');
    for (var truck in trucks) {
      printTruck(truck);
    }
  }

  void searchByManufacturer(String manufacturer) {
    print('Search results for manufacturer: $manufacturer');
    
    for (var motorcycle in motorcycles) {
      if (motorcycle.getManufacturerCompany().toLowerCase().contains(manufacturer.toLowerCase())) {
        printMotorcycle(motorcycle);
      }
    }
    
    for (var car in cars) {
      if (car.getManufacturerCompany().toLowerCase().contains(manufacturer.toLowerCase())) {
        printCar(car);
      }
    }
    
    for (var truck in trucks) {
      if (truck.getManufacturerCompany().toLowerCase().contains(manufacturer.toLowerCase())) {
        printTruck(truck);
      }
    }
  }

  void searchByManufactureDate(DateTime date) {
    print('Search results for manufacture date: $date');
    
    for (var motorcycle in motorcycles) {
      if (motorcycle.getManufactureDate().year == date.year &&
          motorcycle.getManufactureDate().month == date.month &&
          motorcycle.getManufactureDate().day == date.day) {
        printMotorcycle(motorcycle);
      }
    }
    
    for (var car in cars) {
      if (car.getManufactureDate().year == date.year &&
          car.getManufactureDate().month == date.month &&
          car.getManufactureDate().day == date.day) {
        printCar(car);
      }
    }
    
    for (var truck in trucks) {
      if (truck.getManufactureDate().year == date.year &&
          truck.getManufactureDate().month == date.month &&
          truck.getManufactureDate().day == date.day) {
        printTruck(truck);
      }
    }
  }

  void searchByPlateNumber(int plateNumber) {
    print('Search results for plate number: $plateNumber');
    
    for (var motorcycle in motorcycles) {
      if (motorcycle.getPlateNumber() == plateNumber) {
        printMotorcycle(motorcycle);
      }
    }
    
    for (var car in cars) {
      if (car.getPlateNumber() == plateNumber) {
        printCar(car);
      }
    }
    
    for (var truck in trucks) {
      if (truck.getPlateNumber() == plateNumber) {
        printTruck(truck);
      }
    }
  }

  void saveToFile(String filename) {
    final data = {
      'motorcycles': motorcycles.map((m) => m.toJson()).toList(),
      'cars': cars.map((c) => c.toJson()).toList(),
      'trucks': trucks.map((t) => t.toJson()).toList(),
    };
    
    final jsonString = jsonEncode(data);
    File(filename).writeAsStringSync(jsonString);
    print('Data saved to $filename');
  }


  void loadFromFile(String filename) {
    try {
      final jsonString = File(filename).readAsStringSync();
      final data = jsonDecode(jsonString);
      
      motorcycles = (data['motorcycles'] as List)
          .map((json) => Motorcycle.fromJson(json))
          .toList();
          
      cars = (data['cars'] as List)
          .map((json) => Car.fromJson(json))
          .toList();
          
      trucks = (data['trucks'] as List)
          .map((json) => Truck.fromJson(json))
          .toList();
          
      print('Data loaded from $filename');
    } catch (e) {
      print('Error loading file: $e');
    }
  }
}

