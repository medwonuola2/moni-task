import 'package:flutter/material.dart';
import 'package:moni/core/models/agent.dart';
import 'package:moni/views/styles/colors.dart';
import 'package:moni/core/models/cluster.dart';
import 'package:moni/views/widgets/customDivider.dart';
import '../widgets/members_info.dart';

class Members extends StatelessWidget {
  const Members({Key? key, required this.clusterModel}) : super(key: key);

  final ClusterModel clusterModel;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AgentsLoanList(
          agentsList: clusterModel.overDueAgents,
          stateComment: 'Late',
          stateColor: MoniAppColors.primaryBrandBase,
        ),
        AgentsLoanList(
            agentsList: clusterModel.dueAgents,
            stateComment: 'Late',
            stateColor: MoniAppColors.primaryBrandBase),
        AgentsLoanList(
            agentsList: clusterModel.activeAgents,
            stateComment: 'Active',
            stateColor: MoniAppColors.greenDarkest),
        AgentsLoanList(
            agentsList: clusterModel.inactiveAgents,
            stateComment: 'No active loan',
            stateColor: MoniAppColors.primaryBrandBase),
        const SizedBox(height: 24)
      ],
    );
  }
}

class AgentsLoanList extends StatelessWidget {
  const AgentsLoanList(
      {Key? key,
      required this.agentsList,
      required this.stateColor,
      required this.stateComment})
      : super(key: key);

  final AgentsList agentsList;
  final Color stateColor;
  final String stateComment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(agentsList.title),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  )
                ],
              ),
              const CustomDivider()
            ],
          ),
        ),
        for (var agent in agentsList.agentsList())
          MembersInfoTile(
            firstName: agent.firstName,
            lastName: agent.lastName,
            deadlineInfo:
                agentsList.title == "Inactive Loan" ? "" : "3 days over due",
            loanDetails: agentsList.title == "Inactive Loan"
                ? stateComment
                : "₦${agent.loanAmountDue} $stateComment loan",
            textColor: agentsList.title == "Inactive Loan"
                ? MoniAppColors.darkLighter
                : stateColor,
          ),
        const CustomDivider(indent: 16)
      ],
    );
  }
}
