import 'package:get/get.dart';
import 'package:news_app/API/appleApi.dart';
import 'package:news_app/Modal/newsModal.dart';

class NewsController extends GetxController

{
  var apiHelper=ApiHelper();

   NewsModal? newsModal;
   NewsModal? teslaModal;
   NewsModal? countryModal;
   NewsModal? headlinesModal;
   NewsModal? everythingModal;
   Future<NewsModal?> AppleFormMap()
   async {
     final data= await apiHelper.appleFetchData();
     newsModal=NewsModal.formJson(data);
     return newsModal;
   }

  Future<NewsModal?> TeslaFormMap()
  async {
    final data= await apiHelper.teslaFetchData();
    teslaModal=NewsModal.formJson(data);
    return teslaModal;
  }

  Future<NewsModal?> CountryFormMap()
  async {
    final data= await apiHelper.countryFetchData();
    countryModal=NewsModal.formJson(data);
    return countryModal;
  }
  Future<NewsModal?> HeadlineFormMap()
  async {
    final data= await apiHelper.headlinesFetchData();
    headlinesModal=NewsModal.formJson(data);
    return headlinesModal;
  }
  Future<NewsModal?> EverythingFormMap()
  async {
    final data= await apiHelper.everythingFetchData();
    everythingModal=NewsModal.formJson(data);
    return everythingModal;
  }


}