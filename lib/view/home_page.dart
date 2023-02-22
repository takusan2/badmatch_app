import 'package:badmatch_app/constant/string.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view/add_community_page.dart';
import 'package:badmatch_app/view/member_page.dart';
import 'package:badmatch_app/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return const AddCommunityPage();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: FutureBuilder<List<Community>>(
          future: Provider.of<HomePageViewModel>(context, listen: true)
              .communityList,
          builder: (context, AsyncSnapshot<List<Community>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == null) {
                return Container();
              } else {
                List<Community> communityList = snapshot.data!;
                return ListView.builder(
                  itemCount: communityList.length,
                  itemBuilder: (context, index) {
                    Community community = communityList[index];
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(community.name),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MemberPage(community: community);
                          }));
                        },
                        trailing: IconButton(
                          onPressed: () {
                            Provider.of<HomePageViewModel>(
                              context,
                              listen: false,
                            ).delete(community);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
