import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_state_management/presentation/screen/detail/page/detail_page.dart';
import 'package:network_state_management/presentation/screen/home/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
            init: _controller,
            initState: (state) => _controller.getBooks(),
            builder: (context) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _controller.searchController.value,
                      onChanged: _controller.searchByText,
                      decoration: const InputDecoration(
                        label: Text('Search Book'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.listOfBooks.value.length,
                      itemBuilder: (context, index) {
                        final book = _controller.listOfBooks.value[index];

                        return InkWell(
                          onTap: () =>
                              Get.to(DetailPage(isbn13: book.isbn13 ?? '')),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.network(
                                  book.image ?? '',
                                  height: 50,
                                  width: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.red,
                                    );
                                  },
                                ),
                                const SizedBox(width: 16),
                                Expanded(child: Text(book.title ?? 'Empty')),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
