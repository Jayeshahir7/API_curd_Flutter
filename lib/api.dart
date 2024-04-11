import 'dart:convert';
import 'package:http/http.dart' as http;
class Api{
  Future<List<dynamic>> getData() async {
    var res= await http.get(Uri.parse("https://660d52b86ddfa2943b3418c7.mockapi.io/faculty"));
    List<dynamic> facultyList= jsonDecode(res.body);
    return facultyList;
  }
  Future<void> deleteData(String id) async {
    var res=await http.delete(Uri.parse("https://660d52b86ddfa2943b3418c7.mockapi.io/faculty/$id"));
    return;
  }

  Future<Map> insertData(Map<dynamic,dynamic>map) async {
    var res=await http.post(Uri.parse("https://660d52b86ddfa2943b3418c7.mockapi.io/faculty"),body:map);
    Map<dynamic,dynamic> insert= jsonDecode(res.body);
    return insert;
  }

  updateData(Map<dynamic,dynamic> map) async {
    var res= await http.put(Uri.parse("https://660d52b86ddfa2943b3418c7.mockapi.io/faculty/${map['id'].toString()}"),body: map);
    Map<dynamic,dynamic> update=jsonDecode(res.body);
    return update;
  }

}