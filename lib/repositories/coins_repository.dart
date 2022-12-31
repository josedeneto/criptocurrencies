import 'package:criptocurrencies/model/coin_model.dart';

class CoinsRepository {
  List<CoinModel> dataCoins = [];

  CoinsRepository() {
    dataCoins.addAll([
      CoinModel(
          icon: 'assets/images_coins/bitcoin.png',
          name: 'Bitcoin',
          acronym: 'BTC',
          price: 1646.00),
      CoinModel(
          icon: 'assets/images_coins/ethereum.png',
          name: 'Ethereum',
          acronym: 'ETH',
          price: 9716.00),
      CoinModel(
          icon: 'assets/images_coins/xrp.png',
          name: 'XRP',
          acronym: 'XRP',
          price: 3.4),
      CoinModel(
          icon: 'assets/images_coins/cardano.png',
          name: 'Cardano',
          acronym: 'ADA',
          price: 6.32),
      CoinModel(
          icon: 'assets/images_coins/usdcoin.png',
          name: 'USD Coin',
          acronym: 'USDC',
          price: 5.2),
      CoinModel(
          icon: 'assets/images_coins/litecoin.png',
          name: 'Litecoin',
          acronym: 'LTC',
          price: 649.32),
    ]);
  }
}
