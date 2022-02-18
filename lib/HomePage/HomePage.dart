import 'package:flutter/material.dart';
import 'rapidata.dart';
import 'rappi_Ibloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

const _backgroundColor = Color(0xFFF6F9FA);
const _blueColor = Color(0xFF0D1863);
const _greenColor = Color(0xFF2BBEBA);

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _bloc = RappiBLoC();

  @override
  void initState() {
    _bloc.init(this);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: Center(child: Text('Home'))),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _bloc,
          builder: (_, __) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 60,
                child: TabBar(
                  controller: _bloc.tabController,
                  indicatorWeight: 0.000001,
                  isScrollable: true,
                  labelColor: _blueColor,
                  onTap: _bloc.onTabTap,
                  tabs: _bloc.tabs.map((e) => _RappiTabWidget(e)).toList(),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: _bloc.scrollController,
                  itemCount: _bloc.items.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    final item = _bloc.items[index];

                    if (item.isCategory) {
                      return _RappiCategoryItem(item.category);
                    } else {
                      return _RappiProductItem(item.product);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RappiTabWidget extends StatelessWidget {
  const _RappiTabWidget(this.tabCategory);
  final RappiTabCategory tabCategory;

  @override
  Widget build(BuildContext context) {
    final selected = tabCategory.selected;

    return Opacity(
      opacity: selected ? 1 : 0.5,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: selected ? 6 : 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tabCategory.category.name,
            style: const TextStyle(
              color: _blueColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class _RappiCategoryItem extends StatelessWidget {
  const _RappiCategoryItem(this.category);
  final RappiCategory? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: categoryHight,
      alignment: Alignment.centerLeft,
      color: Colors.transparent,
      child: Text(
        category!.name,
        style: const TextStyle(
          color: _blueColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _RappiProductItem extends StatelessWidget {
  const _RappiProductItem(this.product);
  final RappiProduct? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 6,
        shadowColor: Colors.black54,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          height: productHight,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                height: productHight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product!.image,
                    width: productHight,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product!.name,
                      style: const TextStyle(
                        color: _blueColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product!.description,
                      maxLines: 2,
                      style: const TextStyle(
                        color: _blueColor,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      'S/ ${product!.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: _greenColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
