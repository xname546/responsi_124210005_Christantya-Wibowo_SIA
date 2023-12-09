import 'package:flutter/material.dart';
import 'package:responsi_mobile/Model/kategori_model.dart';
import 'package:responsi_mobile/api_data_source.dart';
import 'package:responsi_mobile/meals_page.dart';


class kategoriPage extends StatefulWidget {
  const kategoriPage({super.key});

  @override
  State<kategoriPage> createState() => _kategoriPageState();
}

class _kategoriPageState extends State<kategoriPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori'),
      ),
      body: _buildListKategoriBody(),
    );
  }

  Widget _buildListKategoriBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadKategori(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            KategoriModel kategoriModel =
            KategoriModel.fromJson(snapshot.data);
            return _buildSuccessSection(kategoriModel);
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

  Widget _buildSuccessSection(KategoriModel data) {
    return ListView.builder(
        itemCount: data.categories!.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItemKategori(data.categories![index]);
        }
    );
  }

  Widget _buildItemKategori(Categories kategoriModel) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealsPage(kategoriModel: kategoriModel),
          ),
        );
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Image.network(kategoriModel.strCategoryThumb!),
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(kategoriModel.strCategory!),
                SizedBox(height: 10,),
                Text(kategoriModel.strCategoryDescription!),
              ],
            )
          ],
        ),
      ),
    );
  }
}
