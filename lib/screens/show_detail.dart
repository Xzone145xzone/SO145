import 'package:flutter/material.dart';
import 'package:ung_so145/models/product_model.dart';

class ShowDetail extends StatefulWidget {
  final ProductModel productModel;
  ShowDetail({Key key, this.productModel}) : super(key: key);

  @override
  _ShowDetailState createState() => _ShowDetailState();
}

class _ShowDetailState extends State<ShowDetail> {
//  Explicit
  ProductModel productModel;
  String name = '', detail = '', url = '';

//Method
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      productModel = widget.productModel;
      name = productModel.name;
      detail = productModel.detail;
      url = productModel.url;
      print('name =$name ');
    });
  }

  Widget showName() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '$name',
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget showImage() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      
      width: 100.0,
      height: 150.0,
      child: Image.network(
        productModel.url,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showDetail() {
    return Container(
       padding: EdgeInsets.all(30.0),
      child: Text('      $detail'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Showdetail'),
      ),
      body: ListView(
        children: <Widget>[showName(), showImage(), showDetail()],
      ),
    );
  }
}
