import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadKategori() {
    return BaseNetwork.get("categories.php");
  }

  Future<Map<String, dynamic>> loadMeals(String kategoriDiterima) {
    String kategori = kategoriDiterima.toString();
    return BaseNetwork.get("filter.php?c=$kategori");
  }

  Future<Map<String, dynamic>> loadDetail(int idDiterima) {
    String id= idDiterima.toString();
    return BaseNetwork.get("lookup.php?i=$id");
  }

}
