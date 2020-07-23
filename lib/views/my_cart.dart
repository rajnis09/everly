import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var _counter = 1;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter != 1) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: Builder(
        builder: (context) {
          return ListView(
            children: <Widget>[
              Container(
                height: 50,
                margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text(
                        "Total X Item",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Text(
                        "\u20B9 200.00",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, position) {
                  return Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              right: 8, left: 8, top: 8, bottom: 8),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(14)),
                              color: Colors.grey.shade200,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/1.png",
                                ),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.only(right: 8, top: 4),
                                      child: Text(
                                        "Item Name",
                                        
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        onTap: () => _increment(),
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                              right: 10, top: 8),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              color: Color(0xff31354B)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "X quantity",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,    
                                    children: <Widget>[
                                      Text(
                                        "\u20B9 200.00",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(Icons.remove),
                                              onPressed: () => _decrement(),
                                              color: Colors.grey.shade700,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                  right: 12,
                                                  left: 12),
                                              child: Text(
                                                '$_counter',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () => _increment(),
                                              color: Colors.grey.shade700,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          flex: 100,
                        )
                      ],
                    ),
                  );
                },
                itemCount: 8,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                alignment: Alignment.center,
                child: RaisedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     new MaterialPageRoute(builder: (context) => CheckOutPage()));
                  },
                  color: Theme.of(context).primaryColor,
                  padding:
                      EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
