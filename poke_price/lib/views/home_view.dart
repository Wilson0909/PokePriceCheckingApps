import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/card_provider.dart';
import '../widgets/card_tile.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/custom_error.dart';

class HomeView extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("PokéPrice")),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Search card... ex:Pikachu , Gengar "),
            onSubmitted: (value) {
              context.read<CardProvider>().search(value);
            },
          ),

          Expanded(
            child: Builder(
              builder: (_) {
                if (provider.isLoading) return LoadingShimmer();

                if (provider.error != null) {
                  return CustomErrorWidget(message: provider.error!);
                }

                return ListView.builder(
                  itemCount: provider.cards.length,
                  itemBuilder: (context, index) {
                    return CardTile(card: provider.cards[index]);
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}