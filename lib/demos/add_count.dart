import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// class AddCountPage extends StatefulWidget {
//   AddCountPage({Key key}) : super(key: key);
//   _AddCountPageState createState() => _AddCountPageState();
// }

// class _AddCountPageState extends State<AddCountPage> {
//   int _count = 0;

//   void _increaseCount() {
//     setState(() {
//       _count++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CountProvider(
//       count: _count,
//       increaseCount: _increaseCount,
//       child: Scaffold(
//       appBar: AppBar(
//         title: Text("添加"),
//       ),
//       body: CenterBody(),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: _increaseCount,
//       ),
//     ),
//     );
//   }
// }

class AddCountPage extends StatelessWidget {
  const AddCountPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("添加"),
        ),
        body: CenterBody(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: model.increaseCount,
          ),
          rebuildOnChange: false,
        ),
      ),
    );
  }
}

class ContainerBody extends StatelessWidget {
  const ContainerBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CenterBody(),
    );
  }
}

class CenterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final int count = CountProvider.of(context).count;
    // final VoidCallback callback = CountProvider.of(context).increaseCount;
    // return Center(
    //   child: ActionChip(
    //     label: Text("$count"),
    //     onPressed: callback,
    //   ),
    // );

    return ScopedModelDescendant<CounterModel>(
      builder: (context,_,model)=>Center(
        child: ActionChip(
        label: Text("${model.count}"),
        onPressed: model.increaseCount,
      ),
      ),
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child);

  final Widget child;
  final int count;
  final VoidCallback increaseCount;

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
