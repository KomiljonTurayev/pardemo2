import 'package:flutter/material.dart';
import 'package:pardemo2/model/emplist_model.dart';
import 'package:pardemo2/model/empone_model.dart';

import '../model/emp_model.dart';
import '../model/user_model.dart';
import '../services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";
  late EmpOne empOne_;
  List<Employee> items = [];

  void _apiEmpList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response),
        });
  }

  void _apiEmpListId(int id) {
    Network.GET(Network.API_LIST_ONE + id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  void _apiEmpCreate(User user) {
    Network.POST(Network.API_EMP_CREATE, Network.paramsCreate(user))
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  void _apiEmpUpdate(User user) {
    Network.PUT(Network.API_EMP_UPDATE + user.id.toString(),
            Network.paramsUpdate(user))
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  void _apiEmpDelete(User user) {
    Network.DELETE(
            Network.API_EMP_DELETE + user.id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response),
            });
  }

  _showResponse(String? response) {
    // EmpList empList = Network.parseEmpList(response!);
    EmpOne empOne = Network.parseEmpOne(response!);
    setState(() {
      // data = response;
      // items = empList.data;
      empOne_  = empOne;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _apiEmpList();
    _apiEmpListId(1);
    var user = User(id: 21, name: 'Komiljon', salary: '500000', age: '25');
    // _apiEmpCreate(user);
    // _apiEmpUpdate(user);
    // _apiEmpDelete(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee title"),
      ),
      body: ListView.builder(
        itemCount: data.length,
          itemBuilder: (ctx,i){
          return itemOfList(empOne_);
          },
      )
    );
  }

  Widget itemOfList(EmpOne item) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${item.data.employee_name}(${item.data.employee_age})",
              style: const TextStyle(color: Colors.black,fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${item.data.employee_salary.toString()}\$",
              style: const TextStyle(color: Colors.black,fontSize: 18),
            ),
          ],
      ),
    );
  }
}


























