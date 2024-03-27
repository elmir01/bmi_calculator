import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable(
              decoration: BoxDecoration(
                  color: Color.fromARGB(29, 30, 51, 255),
                  borderRadius: BorderRadius.circular(30)),
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Degree',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      '18.5 and below',
                      style: Styles().textStyle,
                    )),
                    DataCell(Text('Weak', style: Styles().textStyle1)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      'Between 18.5 and 24.9',
                      style: Styles().textStyle,
                    )),
                    DataCell(Text('Normal', style: Styles().textStyle2)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      'Between 25 and 29.9',
                      style: Styles().textStyle,
                    )),
                    DataCell(Text('Overweight', style: Styles().textStyle3)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      'Between 30 and 34.9',
                      style: Styles().textStyle,
                    )),
                    DataCell(Text('Fat (obesity class 1)',
                        style: Styles().textStyle4)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      'Between 35 and 39.9',
                      style: Styles().textStyle,
                    )),
                    DataCell(Text('Overweight (obesity class 2)',
                        style: Styles().textStyle5)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text(
                      '40 and above:',
                      style: Styles().textStyle,
                    )),
                    DataCell(Text('Extremely obese (obesity class 3)',
                        style: Styles().textStyle6)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Styles {
  final TextStyle textStyle1 = TextStyle(color: Colors.blue);
  final TextStyle textStyle2 = TextStyle(color: Colors.green);
  final TextStyle textStyle3 = TextStyle(color: Colors.yellow);
  final TextStyle textStyle4 = TextStyle(color: Colors.orange);
  final TextStyle textStyle5 = TextStyle(color: Colors.redAccent);
  final TextStyle textStyle6 = TextStyle(color: Colors.red);
  final TextStyle textStyle = TextStyle(color: Colors.white);
}
