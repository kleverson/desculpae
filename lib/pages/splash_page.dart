import 'dart:convert';

import 'package:desculpae/core/app_colors.dart';
import 'package:desculpae/persistence/db/database.dart';
import 'package:desculpae/persistence/entities/category_entity.dart';
import 'package:desculpae/persistence/entities/pretext_entity.dart';
import 'package:desculpae/util/init_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key, required this.db}) : super(key: key);
  final AppDatabase db;

  startData() {
    var initdata = InitData();
    initdata.data().forEach((item) {
      db.categoryRepositoryDao.inserItem(CategoryEntity(
          title: item.category.toString(),
          color: item.color.toString(),
          icon: item.icon.toString())
      ).then((value) => {
        item.pretext!.forEach((p) {
          db.pretextRepositoryDao
              .inserItem(PretextEntity(
                  text: p.toString(),
                  favorite: false,
                  sentCount: 0,
                  categoryId: value))
              .then((np) => {print(np)});
        })
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    db.categoryRepositoryDao.getAll().then((categories) => {
      if(categories.length == 0){
        startData()
      } else{
        print(categories.length)
      }
    }).whenComplete(() => {
      Future.delayed(Duration(seconds: 4)).then((_){
        Navigator.of(context).pushReplacementNamed(Routes.menu);
      })
    });


    return Scaffold(
        backgroundColor: Color(0xFFDB6341),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('assets/images/inteface_icon_splash.svg',
                  color: AppColors.primaryColor,
                  width: 90,
                  height: 100,
                  semanticsLabel: 'A red up arrow'),
                  SizedBox(height: 100),
              Text(
                "desculpaê",
                style: TextStyle(color: AppColors.primaryColor, fontSize: 45.0),
              )
            ],
          ),
        ));
  }
}
