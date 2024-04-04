import 'package:flutter/material.dart';
import 'insert_update.dart';
import 'api.dart';
class user extends StatefulWidget {
  const user({super.key});


  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  Api api=Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API CURD",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: api.getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        selectedColor: Colors.blue,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return insert_update(
                              map: snapshot.data![index],
                            );
                          },)).then((value) {
                            setState(() {});
                          });
                        },
                        leading: Image.network(snapshot.data![index]['image']),
                        title: Text(snapshot.data![index]['name']),
                        subtitle: Text(snapshot.data![index]['spi'].toString()),
                        trailing: IconButton(onPressed:() {
                          api.deleteData(snapshot.data![index]['id'].toString())
                              .then((value) {setState(() {});
                          });
                        },icon: Icon(Icons.delete_forever_sharp),color: Colors.red,),
                      ),
                    );
            },);
          }
          else{
            return Center(child: CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return insert_update();
          },)).then((value) {setState(() {
          });});
        },child: Icon(Icons.add),
      ),
    );
  }
}
