import 'package:flutter/material.dart';
import 'package:moni/views/screens/mycluster/widgets/cluster_details.dart';
import 'package:moni/views/screens/mycluster/widgets/cluster_members.dart';
import 'package:moni/views/styles/colors.dart';
import 'package:moni/core/models/cluster.dart';
import 'widgets/cluster_page_header.dart';

class ClusterPage extends StatelessWidget {
  const ClusterPage({Key? key, required this.clusterModel}) : super(key: key);

  final ClusterModel clusterModel;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(200.0),
              child: ClusterPageHeader(clusterModel: clusterModel),
            ),
            title: const Text("My Cluster"),
          ),
          body: Column(
            children: [
              Container(
                color: MoniAppColors.secondaryBrandLightest,
                child: const TabBar(
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                    indicatorColor: MoniAppColors.primaryBrandBase,
                    labelColor: MoniAppColors.primaryBrandBase,
                    unselectedLabelColor: Colors.grey,
                    unselectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.16,
                        color: MoniAppColors.darkDark),
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                    tabs: [
                      Tab(text: "Members"),
                      Tab(text: "Cluster Details"),
                    ]),
              ),
              Expanded(
                child: TabBarView(children: [
                  Members(clusterModel: clusterModel),
                  ClusterDetails(clusterModel: clusterModel)
                ]),
              ),
            ],
          )),
    );
  }
}
