import 'package:flutter/material.dart';
import '../model/post_data.dart';

class DataTablePage extends StatefulWidget {
  DataTablePage({Key key}) : super(key: key);

  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {
  int _sortColumn = 1;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表格视图"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: DataTable(
            sortColumnIndex: _sortColumn, //排序的index
            sortAscending: _sortAscending, //true是升序排列，false是降序排列
            columns: [
              DataColumn(
                label: Text("时间"),
              ),
              DataColumn(
                label: Text("名称"),
                onSort: (int index, bool ascending) {
                  setState(() {
                    _sortAscending = ascending;
                    _sortColumn = index;
                    posts.sort((a, b) {
                      if (!ascending) {
                        final c = b;
                        b = a;
                        a = c;
                      }
                      return a["name"].length.compareTo(b["name"].length);
                    });
                  });
                },
              ),
              DataColumn(
                label: Text("图片"),
              )
            ],
            rows: posts.map((data) {
              return DataRow(cells: [
                DataCell(
                  Text(data["date"]),
                ),
                DataCell(Text(data["name"])),
                DataCell(Image.network(
                  data["imageUrl"],
                  width: 50,
                  fit: BoxFit.fitWidth,
                ))
              ]);
            }).toList()),
      ),
    );
  }
}
