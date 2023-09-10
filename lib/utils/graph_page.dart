import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  var maxAmount = 0;
  var graphData = [
    {"name": "Jan", "amt": 1200},
    {"name": "Feb", "amt": 2200},
    {"name": "Mar", "amt": 2500},
    {"name": "Apr", "amt": 1000},
    {"name": "May", "amt": 500},
    {"name": "Jun", "amt": 1800},
    {"name": "Jul", "amt": 1500},
    {"name": "Aug", "amt": 900},
    {"name": "Sep", "amt": 1200},
    {"name": "Oct", "amt": 800},
    {"name": "Nov", "amt": 1200},
    {"name": "Dec", "amt": 200},
  ];
  void maxAmountData() {
    // for (Map<String, dynamic> eachData in graphData) {
    //   if (maxAmount < (eachData['amt'] as int)) {
    //     maxAmount += (eachData['amt'] as int);
    //   }
    // }
    graphData.forEach((element) {
      if ((element['amt'] as int) > maxAmount) {
        maxAmount += (element['amt'] as int);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    maxAmountData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Graph"),
      ),
      body: Container(
        width: double.infinity,
        height: 400,
        color: Colors.blue.shade100,
        child: LayoutBuilder(
          builder: (_, constarins) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: graphData
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.only(right: 11),
                          width: 50,
                          height: constarins.maxHeight *
                              ((e['amt'] as int) / maxAmount),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(11))),
                          child: Text('${e['name']}'),
                        ),
                      )
                      .toList()),
            );
          },
        ),
      ),
    );
  }
}
