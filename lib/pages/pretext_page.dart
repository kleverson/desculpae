import 'package:desculpae/core/app_colors.dart';
import 'package:desculpae/persistence/db/database.dart';
import 'package:desculpae/persistence/entities/category_entity.dart';
import 'package:desculpae/persistence/entities/pretext_entity.dart';
import 'package:desculpae/util/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'custom_future_builder.dart';

class PretextPage extends StatefulWidget {
  static const String routerName = "/pretext";
  final AppDatabase db;
  final CategoryEntity categoryEntity;

  const PretextPage({Key? key, required this.db, required this.categoryEntity})
      : super(key: key);

  @override
  State<PretextPage> createState() => _PretextPageState();
}

class _PretextPageState extends State<PretextPage> {
  final _pageController = PageController(initialPage: 0);
  int pageCount = 0;
  int currentPageIndex = 0;

  navigateToPage(int index) {
    _pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  getCurrentPage(int page) {
    currentPageIndex = page;
  }

  @override
  Widget build(BuildContext context) {
    late Future<List<PretextEntity>> _loadPretext;
    var categoryId = widget.categoryEntity.id!.toInt();
    final mediaQuery = MediaQuery.of(context);

    if (categoryId == 0) {
      _loadPretext = widget.db.pretextRepositoryDao.getAll();
    } else if (categoryId == 999) {
      _loadPretext = widget.db.pretextRepositoryDao.getAllFavorite();
    } else {
      _loadPretext = widget.db.pretextRepositoryDao.getAllById(categoryId);
    }

    final PreferredSizeWidget appbar = AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      bottomOpacity: 0.0,
      elevation: 0.0,
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset('assets/images/interface_menu-hamburguer.svg',
              color: AppColors.primaryColor,
              width: 30,
              height: 30,
              semanticsLabel: "menu"),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ],
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        onPressed: () {
          print('xis');
        },
        child: SvgPicture.asset('assets/images/interface_send.svg',
            color: AppColors.primaryColor,
            width: 50,
            height: 60,
            semanticsLabel: widget.categoryEntity.title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: appbar,
      backgroundColor:
          Helper().getColorFromColorCode(widget.categoryEntity.color),
      body: SingleChildScrollView(
        child: Container(
          child: CustomFutureBuilder<List<PretextEntity>>(
            future: _loadPretext,
            onEmpty: (context) {
              return Center(child: Text('No content'));
            },
            onComplete: (context, data) {
              return Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: (mediaQuery.size.height -
                        appbar.preferredSize.height -
                        mediaQuery.padding.top),
                    child: pageViewer(context, data),
                  ),
                ],
              );
            },
            onError: (context, error) {
              return Center(child: Text("Verifique seu login"));
            },
            onLoading: (context) => Center(
                child: CircularProgressIndicator(
                    backgroundColor: AppColors.primaryColor)),
          ),
        ),
      ),
    );
  }

  pageViewer(context, List<PretextEntity> data) {
    return PageView.builder(
      itemCount: data.length,
      controller: _pageController,
      onPageChanged: (int page) {
        print(page);
      },
      itemBuilder: (context, position) {
        return GestureDetector(
            onDoubleTap: () {
              widget.db.pretextRepositoryDao
                  .setFavorite(data[position].id!.toInt());
              Navigator.pop(context, true);
            },
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Center(
                child: Text(
                  data[position].text.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 60.0,
                    fontFamily: 'fishfingers',
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ));
      },
    );
  }
}
