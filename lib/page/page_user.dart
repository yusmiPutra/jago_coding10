// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_apps/cubit/user/user_cubit.dart';
import 'package:pos_apps/network/api.dart';

class PageUser extends StatefulWidget {
  const PageUser({Key? key}) : super(key: key);

  @override
  _PageUserState createState() => _PageUserState();
}

class _PageUserState extends State<PageUser> {
  UserCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<UserCubit>(create: (context) => UserCubit())],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            cubit = context.read<UserCubit>();
            if (state is UserInitial) {
              cubit?.getUserData();
            }
            if (state is UserSuccess) {
              return Column(
                children: [
                  Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            imageProfile +
                                "${state.resGetProfile?.data?.userPhoto}",
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${state.resGetProfile?.data?.userName}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    '${state.resGetProfile?.data?.userTelp}',
                    style: TextStyle(fontSize: 14),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              alignment: Alignment.center,
                              height: 85,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Cash In Hand',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'RM. ${state.resGetProfile?.data?.cashInHand}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green),
                              alignment: Alignment.center,
                              height: 85,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Transfer',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    'RM. ${state.resGetProfile?.data?.cashInHand}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text(
                            'Log Out',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
