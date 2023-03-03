import 'package:flutter/material.dart';

class ItemClass extends StatefulWidget {
  @override
  State<ItemClass> createState() => _ItemClassState();
}

class _ItemClassState extends State<ItemClass> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> _items = ['Item 0'];

  int pressedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Flutter Mapp"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              _addItem();
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  return FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: Column(
                      children: [
                        ListTile(
                          tileColor: Colors.amber,
                          textColor: Colors.white,
                          trailing: IconButton(
                            onPressed: () {
                              _removeItem(index);
                            },
                            iconSize: 40,
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            _items[index],
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 16,),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addItem() {
    final newIndex = _items.length;
    _items.add('Item $newIndex');
    _listKey.currentState!.insertItem(newIndex);
  }

  void _removeItem(int index) {
    _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
          (context, animation) => FadeTransition(
        opacity: Tween<double>(
          begin: 1,
          end: 0,
        ).animate(animation),
        child: ListTile(
          tileColor: Colors.amber,
          textColor: Colors.white,
          trailing: IconButton(
            onPressed: () {},
            iconSize: 40,
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          title: Text(
            '',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
