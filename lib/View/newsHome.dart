
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controller/newsController.dart';
import 'package:news_app/Modal/newsModal.dart';

import '../Utils/golbal.dart';
NewsController controller = Get.put(NewsController());

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override


  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(Icons.account_circle, color: Colors.white, size: 30),
          title: Text('News', style: TextStyle(color: Colors.white)),
          actions: [
            Icon(Icons.grid_view_outlined, color: Colors.white)
          ],
          bottom: const TabBar(
            tabAlignment: TabAlignment.start,
            indicatorPadding: EdgeInsets.zero,
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            isScrollable: true,
            indicatorColor: Colors.purple,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Tesla'),
              Tab(text: 'Country'),
              Tab(text: 'Headline'),
              Tab(text: 'Apple'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              FutureBuilder(
                future: controller.AppleFormMap(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return mainBox(
                      width: width,
                      modal: controller.newsModal!,
                      fetchData: controller.AppleFormMap(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: controller.TeslaFormMap(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return mainBox(
                      width: width,
                      modal: controller.teslaModal!,
                      fetchData: controller.TeslaFormMap(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: controller.CountryFormMap(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return mainBox(
                      width: width,
                      modal: controller.countryModal!,
                      fetchData: controller.CountryFormMap(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: controller.HeadlineFormMap(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return mainBox(
                      width: width,
                      modal: controller.headlinesModal!,
                      fetchData: controller.HeadlineFormMap(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder(
                future: controller.EverythingFormMap(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return mainBox(
                      width: width,
                      modal: controller.everythingModal!,
                      fetchData: controller.EverythingFormMap(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          onTap: (index) {

              selectedIndex = index;

            // Add your navigation logic here
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  ListView mainBox({
    required double width,
    required NewsModal modal,
    required Future<NewsModal?> fetchData,
  }) {
    return ListView.builder(
      itemCount: modal.articles.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          detailHelper = fetchData;
          detailList = modal;
          selectedIndex = index;
          Get.toNamed('/detail');
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                (modal.articles[index].urlToImage == '')
                    ? 'Not Found'
                    : modal.articles[index].urlToImage,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  modal.articles[index].source.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  modal.articles[index].title,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share, color: Colors.white),
                  SizedBox(width: 40),
                  Icon(Icons.bookmark_border, color: Colors.white),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
