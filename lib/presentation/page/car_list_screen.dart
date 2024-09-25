import 'package:flutter/material.dart';
import 'package:rentapp/data.models/car.dart';
import 'package:rentapp/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> cars =[
    Car(model: 'Fortuner', distance: 696, fuelCapacity: 50, pricePerHour: 45),
    Car(model: 'Honda City', distance: 666, fuelCapacity: 50, pricePerHour: 35),
    Car(model: 'KIA K3', distance: 600, fuelCapacity: 40, pricePerHour: 25),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: cars.length,
        itemBuilder: (context, index){
            return CarCard(car: cars[index]);
        }
      ),
    );
  }
}
