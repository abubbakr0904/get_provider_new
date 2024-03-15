import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_provider_new/data/models/country_model/country_model.dart';
import 'package:get_provider_new/view_model/country_view_model.dart';
import 'package:provider/provider.dart';

class Api1 extends StatefulWidget {
  const Api1({super.key});

  @override
  State<Api1> createState() => _Api1State();
}

class _Api1State extends State<Api1> {

  @override
  void initState() {
    context.read<CountryViewModel>().fetchCurrencies();
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: context.watch<CountryViewModel>().isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () {
                return Future<void>.delayed(
                  const Duration(seconds: 2),
                  () {
                    context.read<CountryViewModel>().fetchCurrencies();
                  },
                );
              },
              child: ListView(
                children: [
                  ...List.generate(
                      context.watch<CountryViewModel>().countries.length,
                      (index) {
                    CountryModel country =
                        context.watch<CountryViewModel>().countries[index];
                    print(context.watch<CountryViewModel>().countries.length);
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: ListTile(
                        leading: Image.network(country.flagModel.png , width: 70.w, fit : BoxFit.cover),
                        title: Text(
                          country.name.common,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          country.region,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Text(country.flag ,style: TextStyle(
                            color : Colors.white,
                            fontSize: 20.sp,
                            fontWeight:FontWeight.w500
                        ),),
                      ),
                    );
                  })
                ],
              ),
            ),
      backgroundColor: Colors.black,
    );
  }
}
