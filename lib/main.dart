import 'package:flutter/material.dart';

void main() => runApp(SplitTheBill());

class SplitTheBill extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purple
        )
      ),
      home: MyHomePage(title: 'Bill Split'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double amount, split;
  int person;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  


  void _splitTheBill() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  split == null ?
                  "Fill the details and click on calculate to see split"
                  : "Your split is $split",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty){
                      return "Please enter value!";
                    }
                    else{
                      return null;
                    }
                  },
                  onChanged: (value){
                    amount = double.parse(value);
                  },
                  decoration: InputDecoration(
                    labelText: "Amount",
                    hintText: "1000.0",
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty){
                      return "Please enter value!";
                    }
                    else{
                      return null;
                    }
                  },
                  onChanged: (value){
                    person = int.parse(value);
                  },

                  decoration: InputDecoration(
                      labelText: "No. of Persons",
                      hintText: "5",
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  child: Text("Calculate", style: TextStyle(
                    color: Colors.white
                  ),),
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      setState(() {
                        split = amount/person.round();
                      });
                    }
                    else{

                    }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _splitTheBill,
      //   tooltip: 'Split Bill',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
