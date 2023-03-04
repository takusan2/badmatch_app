import 'package:badmatch_app/constant/string.dart';
import 'package:badmatch_app/infrastructure/database.dart';
import 'package:badmatch_app/view/add_community_page.dart';
import 'package:badmatch_app/view/member_page.dart';
import 'package:badmatch_app/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomePageViewModel vm = HomePageViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddCommunityPage(vm: vm);
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: StreamBuilder<List<Community>>(
          stream: vm.watachCommunities(),
          builder: (context, AsyncSnapshot<List<Community>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
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
                            vm.delete(community);
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
            }
          },
        ),
      ),
    );
  }
}
