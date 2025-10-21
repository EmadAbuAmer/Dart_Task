# 🚗 Vehicle Management System

A comprehensive Dart-based Object-Oriented Programming (OOP) system for managing different types of vehicles with full CRUD operations, search functionality, and data persistence.

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
- [Class Hierarchy](#class-hierarchy)
- [Installation & Usage](#installation--usage)
- [API Documentation](#api-documentation)
- [OOP Principles](#oop-principles)
- [Examples](#examples)
- [Contributing](#contributing)

## 🌟 Overview

This project implements a complete vehicle management system using Dart's Object-Oriented Programming features. It demonstrates inheritance, encapsulation, polymorphism, and data persistence through a hierarchical class structure for different vehicle types.

## ✨ Features

- **🏗️ Complete OOP Implementation** - Inheritance, encapsulation, polymorphism
- **🚘 Multiple Vehicle Types** - Cars, Motorcycles, Trucks
- **🔍 Advanced Search** - By manufacturer, date, plate number
- **💾 Data Persistence** - JSON serialization/deserialization
- **🛠️ CRUD Operations** - Create, Read, Update, Delete vehicles
- **📱 Console Interface** - Easy-to-use command-line interface

## 📁 Project Structure

```
dart_tool/
├── bin/                    # Executable directory
├── lib/                    # Library directory
│   ├── util/
│   │   ├── Enums.dart
│   ├── classes/            # All class definitions
│   │   ├── Engine.dart
│   │   ├── Automobile.dart
│   │   ├── Vehicle.dart
│   │   ├── Motorcycle.dart
│   │   ├── Car.dart
│   │   ├── Truck.dart
│   ├── VehicleManagementSystem.dart # manager logic
│   └── task_1.dart         # Main application file
```

### File Descriptions

- **`Enums.dart`** - Defines `FuelType` and `GearType` enumerations
- **`Engine.dart`** - Core engine component with specifications
- **`Automobile.dart`** - Base class for all vehicles
- **`Vehicle.dart`** - Intermediate class for land vehicles
- **`Motorcycle.dart`** - Motorcycle-specific implementation
- **`Car.dart`** - Car-specific implementation  
- **`Truck.dart`** - Truck-specific implementation
- **`VehicleManagementSystem.dart`** - Main management logic and operations
- **`task_1.dart`** - Application entry point and testing

## 🏗️ Class Hierarchy


Automobile (Base Class)
├── Motorcycle
└── Vehicle (Intermediate Class)
    ├── Car
    └── Truck
```

### Class Relationships

| Class | Parent | Key Properties |
|-------|--------|----------------|
| **Engine** | - | manufacturer, capacity, fuelType |
| **Automobile** | - | company, model, engine, plateNumber |
| **Motorcycle** | Automobile | tierDiameter, length |
| **Vehicle** | Automobile | length, width, color |
| **Car** | Vehicle | chairNumber, isFurnitureLeather |
| **Truck** | Vehicle | freeWeight, fullWeight |

## 🚀 Installation & Usage

### Prerequisites
- Dart SDK version: (3.7.0)
- Git

### Installation

# Clone the repository
git clone https://github.com/EmadAbuAmer/Dart_Task.git

# Navigate to project directory
cd task_1

# Run the application
dart run lib/task_1.dart
```

### Running Tests
```bash
# Run the main application with sample data
dart run lib/task_1.dart

# Or compile and run
dart compile exe lib/task_1.dart -o bin/vehicle_manager
./bin/vehicle_manager
```

## 📚 API Documentation

### Core Classes

#### Engine Class
```dart
final engine = Engine.parameterizedEngine(
  'Toyota', 
  DateTime(2022, 1, 1), 
  'V6', 
  3000, 
  6, 
  FuelType.gasoline
);
```

#### Vehicle Management
```dart
final vms = VehicleManagementSystem();

// Add vehicles
vms.addCar(car);
vms.addMotorcycle(motorcycle);
vms.addTruck(truck);

// Search operations
vms.searchByManufacturer('Toyota');
vms.searchByPlateNumber(1234);
vms.searchByManufactureDate(DateTime(2022, 1, 1));

// Data persistence
vms.saveToFile('vehicles.json');
vms.loadFromFile('vehicles.json');
```

### Key Methods

| Method | Description | Parameters |
|--------|-------------|------------|
| `addVehicle()` | Add new vehicle | Vehicle object |
| `searchByManufacturer()` | Search by company | String manufacturer |
| `searchByPlateNumber()` | Search by plate | int plateNumber |
| `saveToFile()` | Save to JSON | String filename |
| `loadFromFile()` | Load from JSON | String filename |
| `printAll()` | Display all vehicles | - |

## 🎯 OOP Principles Implemented

### 1. **Encapsulation**
- All fields are private (prefixed with `_`)
- Controlled access via getter/setter methods
- Data validation in setters

### 2. **Inheritance**
- Hierarchical class structure
- Code reuse through parent classes
- Method overriding in child classes

### 3. **Polymorphism**
- Overridden `toString()` methods
- Custom JSON serialization per class
- Unified interface for different vehicle types

### 4. **Abstraction**
- Clear separation between interface and implementation
- Abstract common functionality in base classes

## 💡 Examples

### Creating a Car
```dart
final engine = Engine.parameterizedEngine(
  'BMW', 
  DateTime(2023, 5, 15), 
  'B58', 
  3000, 
  6, 
  FuelType.gasoline
);

final car = Car.parameterizedCar(
  'BMW',
  DateTime(2023, 6, 1),
  'M340i',
  engine,
  8888,
  GearType.automatic,
  5001,
  182,
  471,
  'Black',
  5,
  true
);
```

### Search Operations
```dart
// Search by manufacturer
vms.searchByManufacturer('BMW');

// Search by date
vms.searchByManufactureDate(DateTime(2023, 6, 1));

// Search by plate number
vms.searchByPlateNumber(8888);
```

## 🔄 Data Persistence

The system uses JSON serialization for data persistence:

```json
{
  "motorcycles": [...],
  "cars": [...],
  "trucks": [...]
}
```

**Features:**
- Automatic save/load functionality
- Type-safe serialization/deserialization
- Error handling for file operations

## 🛠️ Development

### Adding New Vehicle Types
1. Create new class extending appropriate parent
2. Implement required constructors
3. Add JSON serialization methods
4. Update VehicleManagementSystem if needed

### Code Style
- Follow Dart style guide
- Use meaningful variable names
- Add comments for complex logic
- Maintain consistent formatting

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request



## 👥 Authors

- **Emad Daraghmeh** - (https://github.com/EmadAbuAmer)

