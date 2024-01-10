import 'package:books_app_assignment/services/network_helper.dart';

class BookAppData {
  final String baseURL = 'https://api.thenotary.app/lead/getLeads';
  final String notaryId = '643074200605c500112e0902';

  Future<dynamic> postBookAppData() async {
    NetworkHelper networkHelper = NetworkHelper(baseURL: baseURL);

    try {
      var decodedData = networkHelper.postData(notaryId: notaryId);
      print(decodedData);
      return decodedData;
    } catch (e) {
      print(e);
    }

    return null;
  }
}
