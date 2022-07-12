
import 'package:fake_api/screens/products_by_category.dart';
import 'package:fake_api/service_locators.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';

class AllCategoryScreen extends StatelessWidget {
  AllCategoryScreen({Key? key}) : super(key: key);
  final ApiService service = locator<ApiService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
        future: service.getAllCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final categories = snapshot.data!;
          return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: 
                  InkWell(
                    onTap: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductsByCategoryScreen(
                          categoryName: categories[index],
                        ),
                      ),
                    );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

}
