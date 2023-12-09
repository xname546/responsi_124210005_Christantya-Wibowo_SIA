
import 'package:flutter/material.dart';
import 'package:responsi_mobile/Model/kategori_model.dart';
import 'package:responsi_mobile/Model/meals_model.dart';
import 'package:responsi_mobile/api_data_source.dart';
import 'package:responsi_mobile/detail_page.dart';

class MealsPage extends StatefulWidget {
  final Categories kategoriModel;

  const MealsPage({required this.kategoriModel, Key? key}) : super(key: key);

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
      ),
      body:_buildListMealsBody(),
    );
  }

  Widget _buildListMealsBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadMeals(widget.kategoriModel.strCategory!),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            MealsModel mealsModel =
            MealsModel.fromJson(snapshot.data);
            return _buildSuccessSection(mealsModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text('gagal');
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(MealsModel data) {
    return ListView.builder(
        itemCount: data.meals!.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItemMeals(data.meals![index]);
        }
    );
  }

  Widget _buildItemMeals(Meals mealsModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(detailModel: mealsModel),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Image.network(mealsModel.strMealThumb!),
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(mealsModel.strMeal!),
              ],
            )
          ],
        ),
      ),
    );
  }
}


