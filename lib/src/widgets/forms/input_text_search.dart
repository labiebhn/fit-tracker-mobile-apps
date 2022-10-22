import 'package:flutter/material.dart';

class InputTextSearch extends StatelessWidget {
  const InputTextSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Cari Produk',
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
