import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFFF993399),
              Color(0xFFF8844dd),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(
                  "Novidade",
                ),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("home")
                  .orderBy("pos")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                } else {
                  print(snapshot.data.documents.length);
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Container(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
