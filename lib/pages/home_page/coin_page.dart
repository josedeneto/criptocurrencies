import 'package:criptocurrencies/model/coin_model.dart';
import 'package:criptocurrencies/repositories/coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var coin = CoinsRepository();
  final formatCurrency = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<CoinModel> selectedItem = [];

  appBar() {
    if (selectedItem.isEmpty) {
      return AppBar(
        title: const Text(
          'Criptocurrencies',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      );
    } else {
      return AppBar(
        backgroundColor: Colors.indigo.shade50,
        iconTheme: const IconThemeData(color: Colors.indigo),
        elevation: 0,
        centerTitle: true,
        title: Text(
          '${selectedItem.length} selecionadas',
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 17, color: Colors.indigo),
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              selectedItem = [];
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) => ListTile(
            selected: selectedItem.contains(coin.dataCoins[index]),
            selectedTileColor: const Color.fromARGB(255, 180, 188, 238),
            leading: selectedItem.contains(coin.dataCoins[index])
                ? const CircleAvatar(child: Icon(Icons.check_circle))
                : Image(
                    image: AssetImage(
                      coin.dataCoins[index].icon,
                    ),
                    width: 40,
                    height: 40,
                  ),
            title: Text(
              coin.dataCoins[index].name,
            ),
            trailing: Text(
              formatCurrency.format(coin.dataCoins[index].price),
            ),
            onLongPress: () {
              setState(
                () {
                  selectedItem.contains(coin.dataCoins[index])
                      ? selectedItem.remove(coin.dataCoins[index])
                      : selectedItem.add(coin.dataCoins[index]);
                },
              );
            },
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: coin.dataCoins.length,
        ),
      ),
      floatingActionButton:selectedItem.isNotEmpty? FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.star),
        label: const Text('Favoritar'),
      ):null,
    );
  }
}
