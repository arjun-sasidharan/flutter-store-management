class ApiEndpoints {
  // stores list data api url
  static String storesListDataUrlForWeb = 'http://localhost:3000/storedata'; // for web
  static String storesListDataUrlForMobile = 'http://10.0.2.2:3000/storedata'; // for fetching in android

  // products list api url
  static String productsListDataUrlForWeb = 'http://localhost:3000/productdata';
  static String productsListDataUrlForMobile = 'http://10.0.2.2:3000/productdata';

  // store insert api url
  static String insertStoreDataUrlForWeb = 'http://localhost:3000/postdata';
  static String insertStoreDataUrlForMobile = 'http://10.0.2.2:3000/postdata';




// not needed this approach

//   static String currentWifiIpAddress = '192.168.156.1';
//   static String currentEthernetIpAddress = '10.25.131.74';
//   static String storesListDataUrl =
//       'http://$currentWifiIpAddress:3000/storedata'; // wifi ip, works for both web and android
// //static String storesListDataUrl = 'http://127.0.0.1:3000/storedata'; // // for web
//
// // Products fetching api
//   static String productsListDataUrl =
//       'http://$currentWifiIpAddress:3000/productdata';
//
//   // Store Inserting api
//   static String insertStoreDataUrl =
//       'http://$currentWifiIpAddress:3000/postdata';

}
