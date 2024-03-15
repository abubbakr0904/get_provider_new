import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_provider_new/data/models/user_model/user_model.dart';
import 'package:get_provider_new/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class APi2 extends StatefulWidget {
  const APi2({super.key});

  @override
  State<APi2> createState() => _APi2State();
}

class _APi2State extends State<APi2> {
  @override
  void initState() {
    context.read<UserViewModel>().fetchCurrencies();
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: context.watch<UserViewModel>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () {
                  return Future<void>.delayed(
                    const Duration(seconds: 2),
                    () {
                      context.read<UserViewModel>().fetchCurrencies();
                    },
                  );
                },
                child: ListView(
                  children: [
                    ...List.generate(
                      context.watch<UserViewModel>().users.length,
                      (index){
                        UserModel user = context.watch<UserViewModel>().users[index];
                        return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child : ListTile(
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(60.r),
                                  child: Image.network(user.avatarUrl , width: 50.w, height: 50.w,fit : BoxFit.cover)),
                              title: Text(
                                user.name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                             subtitle: Text(
                                user.state,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                        );
                      },
                    )
                  ],
                ),
              ));
  }
}
