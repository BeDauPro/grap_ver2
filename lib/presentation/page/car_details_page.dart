import 'package:flutter/material.dart';
import 'package:rentapp/data.models/car.dart';
import 'package:rentapp/presentation/page/MapDetailsPage.dart';
import 'package:rentapp/presentation/widgets/car_card.dart';
import 'package:rentapp/presentation/widgets/more_card.dart';

class CarDetailsPage extends StatelessWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outlined),
            Text(' Information')
          ],
        ),
      ),
      body: Column(
        children: [
          //thẻ ô tô đầu tiên
          CarCard(car: Car(model: car.model, distance: car.distance, fuelCapacity: car.fuelCapacity, pricePerHour: car.pricePerHour)),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                //thẻ thông tin người chở
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5
                          )
                        ]
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/user.png'),),
                        SizedBox(height: 10,),
                        Text('Duc Truong', style: TextStyle(fontSize:24, fontWeight: FontWeight.bold),),
                        Text('\$150', style: TextStyle(color: Colors.grey),),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                //thẻ bản đồ
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> Mapdetailspage(car: car))
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('assets/maps.png'),
                              fit: BoxFit.cover
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 5
                            )
                          ]
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(car: Car(model: car.model + " -1", distance: car.distance+213, fuelCapacity: car.fuelCapacity, pricePerHour: car.pricePerHour+30)),
                SizedBox(height: 10,),
                MoreCard(car: Car(model: car.model+ " -2", distance: car.distance+222, fuelCapacity: car.fuelCapacity, pricePerHour: car.pricePerHour)),
                SizedBox(height: 10,),
                MoreCard(car: Car(model: car.model+ " -3", distance: car.distance, fuelCapacity: car.fuelCapacity+200, pricePerHour: car.pricePerHour+70)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
