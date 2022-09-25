// import 'package:crypto_app/data/model/chart_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../data/repository/crypto_services.dart';
// import '../implementation/chart_dm_impl.dart';
//
// class CryptoChartDataManager extends ChartDataManagerImpl {
//   final CoinApiService coinApiService;
//   CryptoChartDataManager({required this.coinApiService});
//
//   @override
//   Future<ChartModel> getCryptoChart(String id) async =>
//       await coinApiService.getCryptoChart(id);
// }
//
// final cryptoChartDataManagerProvider = Provider((ref) {
//   final cryptoDataManager = ref.watch(coinApiServiceProvider);
//   return CryptoChartDataManager(coinApiService: cryptoDataManager);
// });