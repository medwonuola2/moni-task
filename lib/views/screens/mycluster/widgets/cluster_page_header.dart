import 'package:flutter/material.dart';
import 'package:moni/views/styles/colors.dart';
import 'package:moni/core/models/cluster.dart';

class ClusterPageHeader extends StatelessWidget {
  const ClusterPageHeader({Key? key, required this.clusterModel})
      : super(key: key);

  final ClusterModel clusterModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MoniAppColors.darkDark,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Cluster Intro
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clusterModel.clusterName,

                    // TODO: tidy this up
                    style: const TextStyle(
                        height: 2,
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  _clusterInfoStats(
                      title: "Repayment rate:",
                      value: "${clusterModel.repaymentRate}%",
                      color: MoniAppColors.secondaryBrandDarkest),
                  const SizedBox(height: 4),
                  _clusterInfoStats(
                      title: "Repayment Day:",
                      value: "Every ${clusterModel.repaymentDay}",
                      color: MoniAppColors.greenLighter),
                ],
              ),
              const Spacer(),

              // Cluster image
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.grey,
                ),
                child: Image.asset("assets/images/cluster-avatar.png"),
              )
            ],
          ),
          const Divider(
            color: Color(0xFF72777A),
          ),

          // Purse Balance
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cluster purse balance",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    "₦${clusterModel.purseBalance}",
                    // TODO: tidy this up

                    style: const TextStyle(
                        fontFamily: '',
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  Text(
                    "+₦${clusterModel.totalInterestEarned} interest today",
                    style: const TextStyle(
                        // TODO: tidy this up
                        height: 1.5,
                        fontFamily: '',
                        color: MoniAppColors.greenLighter,
                        fontSize: 10),
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View Purse",
                  style: TextStyle(color: Colors.white),
                ),
                style: textButtonStyle,
              )
            ],
          ),
          _divider(),

          // Total Stats
          _clusterTotalStats(
              "Total interest earned", clusterModel.totalInterestEarned,
              color: MoniAppColors.secondaryBrandBase),
          _divider(),
          _clusterTotalStats(
              "Total owed by members", clusterModel.totalOwedByMembers)
        ],
      ),
    );
  }

  Divider _divider() => const Divider(color: MoniAppColors.darkLighter);

  _clusterInfoStats(
          {required String title,
          required String value,
          required Color color}) =>
      Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(children: [
            Text(title, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 4),
            Text(value,
                style: TextStyle(fontWeight: FontWeight.w700, color: color)),
          ]),
          decoration: const ShapeDecoration(
              color: MoniAppColors.darkDarkest, shape: StadiumBorder()));

  _clusterTotalStats(String title, String value, {Color? color}) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.white)),
        const Spacer(),
        Text("₦$value",
            style: TextStyle(
                fontFamily: '', fontSize: 12, color: color ?? Colors.white))
      ],
    );
  }
}
