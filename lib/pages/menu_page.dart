import 'package:desculpae/core/app_colors.dart';
import 'package:desculpae/pages/pretext_page.dart';
import 'package:desculpae/persistence/db/database.dart';
import 'package:desculpae/persistence/entities/category_entity.dart';
import 'package:desculpae/util/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuPage extends StatefulWidget {
  static const String routerName = "/menu";
  final AppDatabase db;

  const MenuPage({Key? key, required this.db}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var helper = Helper();

  late List<CategoryEntity> list = <CategoryEntity>[];

  @override
  void initState() {
    super.initState();

    widget.db.categoryRepositoryDao.getAll().then((resp) =>{
      setState((){
        list.add(CategoryEntity(id:0,title: "Todos", color: "#5D5151", icon: "categoria_todas.svg"));
        resp.forEach((element) {
          list.add(element);
        });
        list.add(CategoryEntity(id:999,title: "Favoritas", color: "#DEA36E", icon: "categoria_todas.svg"));
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PretextPage(db: widget.db, categoryEntity: list[index])),
                );
              },
              child: Container(
                  color:Helper().getColorFromColorCode(list[index].color.toString()),
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: card(list[index]),
                  )
              )
            );
          }
      )
    );
  }

  List<Widget> card(CategoryEntity categoryEntity) {
    return [
      Padding(padding: EdgeInsets.all(8.0)),
      SvgPicture.asset('assets/images/${categoryEntity.icon}',
          color: AppColors.primaryColor,
          width: 50,
          height: 60,
          semanticsLabel: categoryEntity.title
      ),
      SizedBox(width: 10.0),
      Text(categoryEntity.title,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 40.0,
              fontFamily: 'fishfingers',
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none
          )
      ),
      Padding(padding: EdgeInsets.all(8.0)),
    ];
  }
}
