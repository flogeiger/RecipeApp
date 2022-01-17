import 'package:flutter/material.dart';
import 'FilternCategory.dart';

class FilterCategoryItemUI extends StatefulWidget {
  @override
  _FilterCategoryItemStateUI createState() => _FilterCategoryItemStateUI();
}

class _FilterCategoryItemStateUI extends State<FilterCategoryItemUI> {
  FilternCategory? selectedFiltern;
  List<String>? listFiltern;
  @override
  void initState() {
    super.initState();
    listFiltern = FilternCategory.getFilternName();
  }

  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: listFiltern!.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: MediaQuery.of(context).size.height * 0.04,
                ),
                selected: selectedIndex == index ? true : false,
                selectedTileColor: Theme.of(context).secondaryHeaderColor,
                title: Text(
                  listFiltern![index],
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            );
          }),
    );
  }
}
