import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:standar_code_flutter/infrastructure/data/applications/cubit.dart';
import 'package:standar_code_flutter/infrastructure/data/models/list_user_model.dart';
import 'package:standar_code_flutter/view/widgets/card_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int page = 1;
  bool isRefresh = false;

  List<DataUser> dataUser = [];

  @override
  void initState() {
    super.initState();
    getDataUser(page);
  }

  void getDataUser(int pages) {
    context.read<UserCubit>().getListUser(pages.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            children: [
              Text('List User'),
              SizedBox(
                height: 30,
              ),
              Expanded(child: _userList()),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isRefresh = false;
            page += 1;
            getDataUser(page);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _userList() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          if (isRefresh) {
            dataUser.clear();
          }
          var data = state.listUserModel.data;
          data!.forEach((element) {
            dataUser.add(element);
          });
          return RefreshIndicator(
            onRefresh: () async {
              getDataUser(page);
              setState(() {
                isRefresh = true;
              });
            },
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: dataUser
                      .map((e) => CardWidget(
                            data: e,
                          ))
                      .toList(),
                ),
              ),
            ),
          );
        }
        if (state is UserError) {
          return Center(
            child: Text('Data User Not Found'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
