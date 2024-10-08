import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
 //apple Api
  Future<Map> appleFetchData()
  async {
    String data ="https://newsapi.org/v2/everything?q=apple&from=2024-08-12&to=2024-08-12&sortBy=popularity&apiKey=33c4822c1ce1477a9670ac64c23e1165";
    Uri url= Uri.parse(data);
    Response response = await http.get(url);
    if(response.statusCode==200)
      {
        final json=response.body;
         Map data= jsonDecode(json);
         return data;

      }
    else
      {
        return{};
      }
  }
  //tesla Api
  Future<Map> teslaFetchData()
  async {
    String data ="https://newsapi.org/v2/everything?q=tesla&from=2024-07-13&sortBy=publishedAt&apiKey=33c4822c1ce1477a9670ac64c23e1165";
    Uri url= Uri.parse(data);
    Response response = await http.get(url);
    if(response.statusCode==200)
    {
      final json=response.body;
      Map data= jsonDecode(json);
      return data;

    }
    else
    {
      return{};
    }
  }
  //country Api
  Future<Map> countryFetchData()
  async {
    String data ="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=33c4822c1ce1477a9670ac64c23e1165";
    Uri url= Uri.parse(data);
    Response response = await http.get(url);
    if(response.statusCode==200)
    {
      final json=response.body;
      Map data= jsonDecode(json);
      return data;

    }
    else
    {
      return{};
    }
  }
  //headlines Api
  Future<Map> headlinesFetchData()
  async {
    String data ="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=33c4822c1ce1477a9670ac64c23e1165";
    Uri url= Uri.parse(data);
    Response response = await http.get(url);
    if(response.statusCode==200)
    {
      final json=response.body;
      Map data= jsonDecode(json);
      return data;

    }
    else
    {
      return{};
    }
  }
  //Eveything Api
  Future<Map> everythingFetchData()
  async {
    String data ="https://newsapi.org/v2/everything?domains=wsj.com&apiKey=33c4822c1ce1477a9670ac64c23e1165";
    Uri url= Uri.parse(data);
    Response response = await http.get(url);
    if(response.statusCode==200)
    {
      final json=response.body;
      Map data= jsonDecode(json);
      return data;

    }
    else
    {
      return{};
    }
  }

}