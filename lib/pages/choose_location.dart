import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url1: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url1: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url1: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url1: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url1: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url1: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url1: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url1: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    // navigate to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDayTime':instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build funtion run");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
              ),
            ),
          );
        },
      ),
    );
  }
}
