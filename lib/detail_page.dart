import 'package:flutter/material.dart';
import 'package:responsi_mobile/Model/detail_model.dart';

class DetailPage extends StatelessWidget {
  final Meals detailModel;

  const DetailPage({required this.detailModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                detailModel.strMealThumb!,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                detailModel.strMeal!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Kategori :" + detailModel.strCategory!),
              SizedBox(height: 10),
              Text("Area :" + detailModel.strArea!),
              SizedBox(height: 10),
              Text(detailModel.strIngredient1!),
              Text(detailModel.strIngredient2!),
              Text(detailModel.strIngredient3!),
              Text(detailModel.strIngredient4!),
              Text(detailModel.strIngredient5!),
              SizedBox(height: 10,),
              Text(detailModel.strInstructions!)
              // Tambahkan informasi lainnya sesuai kebutuhan
            ],
          ),
        );
  }


}
