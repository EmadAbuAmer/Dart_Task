import 'package:task_1/classes/Engine.dart';
import 'package:task_1/util/Enums.dart';
import 'package:task_1/classes/Motorcycle.dart';
import 'package:task_1/classes/Car.dart';
import 'package:task_1/classes/Truck.dart';
import 'package:task_1/VehicleManagementSystem.dart';



void main() {
  final vms = VehicleManagementSystem();
  
  // Create sample data
  final engine1 = Engine.parameterizedEngine(
    'Honda', 
    DateTime(2020, 1, 15), 
    'CBR600', 
    600, 
    4, 
    FuelType.gasoline
  );
  
  final motorcycle1 = Motorcycle.parameterizedMotorcycle(
    'Honda',
    DateTime(2020, 2, 1),
    'CBR600RR',
    engine1,
    1234,
    GearType.normal,
    1001,
    17.5,
    2.1
  );
  
  final engine2 = Engine.parameterizedEngine(
    'Toyota', 
    DateTime(2022, 5, 10), 
    '2JZ', 
    3000, 
    6, 
    FuelType.gasoline
  );
  
  final car1 = Car.parameterizedCar(
    'Toyota',
    DateTime(2022, 6, 1),
    'Supra',
    engine2,
    5678,
    GearType.automatic,
    2001,
    180,
    450,
    'Red',
    2,
    true
  );
  
  final engine3 = Engine.parameterizedEngine(
    'Cummins', 
    DateTime(2021, 3, 20), 
    'ISX15', 
    15000, 
    6, 
    FuelType.diesel
  );
  
  final truck1 = Truck.parameterizedTruck(
    'Freightliner',
    DateTime(2021, 4, 1),
    'Cascadia',
    engine3,
    9012,
    GearType.automatic,
    3001,
    250,
    800,
    'Blue',
    8000.0,
    25000.0
  );
  
  // Add vehicles to lists
  vms.motorcycles.add(motorcycle1);
  vms.cars.add(car1);
  vms.trucks.add(truck1);
  
  // Test display functions
  print('=== TESTING DISPLAY FUNCTIONS ===');
  vms.printAll();
  
  // Test search functions
  print('\n=== TESTING SEARCH FUNCTIONS ===');
  vms.searchByManufacturer('Toyota');
  print('');
  vms.searchByManufactureDate(DateTime(2022, 6, 1));
  print('');
  vms.searchByPlateNumber(5678);
  
  // Test data persistence
  print('\n=== TESTING DATA PERSISTENCE ===');
  vms.saveToFile('vehicles.json');
  
  // Create a new instance and load data
  final vms2 = VehicleManagementSystem();
  vms2.loadFromFile('vehicles.json');
  vms2.printAll();
  
  // Test modifying body serial number
  print('\n=== TESTING BODY SERIAL NUMBER MODIFICATION ===');
  print('Before modification: ${vms.motorcycles[0].getBodySerialNumber()}');
  vms.motorcycles[0].setBodySerialNumber(9999);
  print('After modification: ${vms.motorcycles[0].getBodySerialNumber()}');
  
  // Test adding more vehicles
  print('\n=== TESTING ADD/INSERT/DELETE OPERATIONS ===');
  
  // Add new motorcycle
  final motorcycle2 = Motorcycle.defaultMotorcycle();
  vms.motorcycles.add(motorcycle2);
  print('Added default motorcycle');
  
  // Insert car at specific position
  final car2 = Car.defaultCar();
  vms.cars.insert(0, car2);
  print('Inserted default car at position 0');
  
  // Delete truck
  vms.trucks.removeAt(0);
  print('Deleted first truck');
  
  vms.printAll();
}
