import 'package:flutter/material.dart';
import 'package:pre_test_app/models/post_model.dart';
import 'package:pre_test_app/provider/list_post_provider.dart';
import 'package:provider/provider.dart';

class ListPostScreen extends StatefulWidget {
  const ListPostScreen({Key? key}) : super(key: key);

  @override
  State<ListPostScreen> createState() => _ListPostScreenState();
}

class _ListPostScreenState extends State<ListPostScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    _searchController.addListener(handleSearch);
    super.initState();
  }

  void handleSearch() {
    if (_searchController.text.isEmpty) {
      context.read<ListPostProvider>().fetchListPost();
    } else {
      context.read<ListPostProvider>().fetchPost(id: _searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Post")),
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'enter your post id',
                    hintStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Consumer<ListPostProvider>(
                  builder:
                      (BuildContext context, listPostProvider, Widget? child) {
                    return listPostProvider.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : ListView.builder(
                            itemCount: listPostProvider.listPostModel.length,
                            itemBuilder: (context, index) {
                              return _itemPost(context,
                                  listPostProvider.listPostModel[index]);
                            },
                          );
                  },
                ),
              ),
            ],
          )),
    );
  }

  Card _itemPost(BuildContext context, PostModel data) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Id post:",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  data.id.toString(),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title:",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  width: 6,
                ),
                Flexible(
                  child: Text(
                    data.title!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Body:",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    data.body!,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
