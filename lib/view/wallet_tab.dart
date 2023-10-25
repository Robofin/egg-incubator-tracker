import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Wallet',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Icon(
            IconlyLight.wallet,
            size: 40,
          ),
        ],
      ),
    );
  }
}
