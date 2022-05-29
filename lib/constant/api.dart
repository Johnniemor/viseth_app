//import
import 'package:hasura_connect/hasura_connect.dart';

String url = 'https://emergency-rescue.herokuapp.com/v1/graphql';
HasuraConnect api = HasuraConnect(url,
    headers: {'x-hasura-admin-secret': '875e4ryhgfhfhtry5ry45654763452456'});
