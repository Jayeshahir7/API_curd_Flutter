import 'package:flutter/material.dart';
import 'api.dart';

class insert_update extends StatelessWidget {

  Map? map;

  TextEditingController img=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController spi=TextEditingController();
  Api db=Api();

  insert_update({this.map})  {
    img.text = map != null ? map!['image'] : '';
    name.text = map != null ? map!['name']: '';
    spi.text = map != null ? map!['spi'].toString() : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${map != null? "EDIT":"ADD"} Page"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: img,
            decoration: InputDecoration(label: Text("Enter Image")),
          ),
          TextFormField(
            controller: name,
            decoration: InputDecoration(label: Text("Enter Name")),
          ),
          TextFormField(
            controller: spi,
            decoration: InputDecoration(label: Text("Enter Spi")),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {
            if(map==null){
              final newFaculty={
                'image':img.text,
                'name':name.text,
                'spi':spi.text.toString(),
              };
              db.insertData(newFaculty).then((value) {
                Navigator.pop(context);
              });
            }
            else{
              final update={
                'id':map!['id'].toString(),
                'image':img.text,
                'name':name.text,
                'spi':spi.text.toString(),
              };
              db.updateData(update).then((value) {
                Navigator.pop(context);
              });
            }
          }, child: Text('Submit'))
        ],
      ),
    );
  }
}
