import 'package:cached_network_image/cached_network_image.dart';
import 'package:course_task/bussines/news_provider.dart';
import 'package:course_task/ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, state, _) {
        return state.fetchingNews
            ? const LoaderWidget()
            : ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  );
                },
                physics: const BouncingScrollPhysics(),
                itemCount: state.newsObject.results!.length,
                itemBuilder: (context, index) {
                  var data = state.newsObject.results![index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        data.imageUrl == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  color: Colors.red.shade100,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text("Now Image"),
                                        Icon(Icons.image_not_supported_outlined)
                                      ],
                                    ),
                                  ),
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                    width: 120,
                                    height: 120,
                                    imageUrl: data.imageUrl!,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                    const LoaderWidget()),
                              ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    data.title!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    maxLines: 3,
                                  ),
                                ),
                                Text(
                                  data.country![0],
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
