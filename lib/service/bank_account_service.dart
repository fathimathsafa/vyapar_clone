// import 'package:dio/dio.dart';
// import 'package:vyapar_clone/presentation/menu_screen/sub_screens/bank_accounts_screen/view/bank_account_list.dart';
// import 'path/to/your/bank_details_model.dart';

// class BankDetailsService {
//   final Dio _dio = Dio();

//   Future<BankAccountsListScreen> fetchBankDetails() async {
//     try {
//       final response = await _dio.get('https://yourapi.com/api/bank_details');

//       if (response.statusCode == 200) {
//         return BankAccountsListScreen.fromJson(response.data);
//       } else {
//         throw Exception('Failed to load bank details');
//       }
//     } catch (e) {
//       throw Exception('Error fetching bank details: $e');
//     }
//   }
// }
