import 'package:api_practice_2/data/models/post.dart';


import '../../core/services/api_service.dart';
import '../../core/utils/constants/urls.dart';

class PostDb {
  final ApiService _apiService = ApiService();
  Future postData() async {
    final data = await _apiService.fetchData(postUrl);
    return List<Post>.from(data.map((post) => Post.fromJson(post)));
  }
}
