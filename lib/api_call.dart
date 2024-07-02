import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

//Auth token we will use to generate a meeting and connect to it

const token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiIwYWVkNWU2NS01NmVhLTRkMGUtOTZmMC1lMDQyZDZlMDE2YmEiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTcxOTk0MjY2NSwiZXhwIjoxNzI3NzE4NjY1fQ.O1Ah8CRpb-hdBvqgTn-jDRyq0cg0VqiaZ7-xr_88PXE';

// API call to create meeting
Future<String> createMeeting() async {
  final http.Response httpResponse = await http.post(
    Uri.parse('https://api.videosdk.live/v2/rooms'),
    headers: {'Authorization': token},
  );

  log(httpResponse.body);

//Destructuring the roomId from the response
  return json.decode(httpResponse.body)['roomId'];
}
