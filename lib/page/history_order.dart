// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_apps/cubit/history/history_cubit.dart';
import 'package:pos_apps/res/res_get_history.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({Key? key}) : super(key: key);

  @override
  _HistoryOrderState createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {
  HistoryCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HistoryCubit>(create: (context) => HistoryCubit())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('History Order'),
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            cubit = context.read<HistoryCubit>();
            if (state is HistoryInitial) {
              cubit?.getHistoryOrder();
            }

            if (state is HistorySuccess) {
              return ListView.builder(
                  itemCount: cubit?.resGetTHistoryOrder?.data?.length,
                  itemBuilder: (context, index) {
                    DataHistory? data =
                        cubit?.resGetTHistoryOrder?.data?[index];
                    return Card(
                      child: ListTile(
                        title: Text('${data?.customer?.customerName}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${data?.userCompany?.userName}'),
                            Text('RM. ${data?.totalPrice}'),
                            Text('Status Order : ${data?.transactionStatus}')
                          ],
                        ),
                      ),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
