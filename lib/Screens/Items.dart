import 'package:flutter/material.dart';

class ItemClass extends StatefulWidget {
  @override
  State<ItemClass> createState() => _ItemClassState();
}

class _ItemClassState extends State<ItemClass> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState(

    );
  }
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
 final List<String> _items = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Flutter Mapp"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                _addItem();
              });
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
               // reverse: true,
                key: _listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  return AnimatedSize(
                    duration: const Duration(milliseconds: 400),
                  child: SizeTransition(
                     sizeFactor: animation,
                      child: Column(
                        children: [
                        listTile(index),
                          const SizedBox(height: 16,),
                        ],
                      ),
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

  Widget listTile(index)
  {
    return   ListTile(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))) ,
      tileColor: Colors.amber,
      textColor: Colors.white,
      trailing: IconButton(
        onPressed: () {
          _removeItem(index);
        },
        iconSize: 40,
        icon: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      title: Text(
        _items[index],
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  void _addItem() {
    final newIndex = _items.length;
    _items.insert(0, 'Item ${newIndex+1}');
    _listKey.currentState!.insertItem(0);
  }

 /* void _addItem() {
    final newIndex = _items.length;
    _items.add('Item ${newIndex+1}');
    _listKey.currentState!.insertItem(0);
  }*/

  void _removeItem(int index) {
    _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
          (context, animation) => SizeTransition(
      sizeFactor: animation,
        child: ListTile(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))) ,

          tileColor: Colors.red,
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
            'Deleted',
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
