import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:intl/intl.dart';



class WorldTime{

  late String location; //location name for the UI
  late String time; //the time in that location
  late String flag; //url to an asset flag icon
  late String url1; //location url for api end-points
  late bool isDayTime; //if day time true else no
  WorldTime({required this.location,required this.flag,required this.url1});

  Future<void> getTime() async {
    try{
      //make the request to show the data
      var url = Uri.parse('https://worldtimeapi.org/api/timezone/$url1');
     // print("check");
      var response = await http.get(url);

      Map data = jsonDecode(response.body);
      //print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset=data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);

      // Create a date time object
      DateTime now=DateTime.parse(datetime);
      now=now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDayTime = now.hour>=6 && now.hour<18 ? true: false;
      time = DateFormat.jm().format(now);

    }
    catch(e){
      print("caught error $e");
      time="could not get time data";
    }



  }

}

