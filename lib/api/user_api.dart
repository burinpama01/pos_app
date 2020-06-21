//import 'dart:io';
//
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:path/path.dart' as path;
//import 'package:posapp/models/products.dart';
//import 'package:posapp/models/user.dart';
//import 'package:posapp/notifier/auth_notifier.dart';
//import 'package:posapp/notifier/product_notifier.dart';
//import 'package:uuid/uuid.dart';
//
//login(User user, AuthNotifier authNotifier) async {
//  AuthResult authResult = await FirebaseAuth.instance
//      .signInWithEmailAndPassword(email: user.email, password: user.password)
//      .catchError((error) => print(error.code));
//
//  if (authResult != null) {
//    FirebaseUser firebaseUser = authResult.user;
//
//    if (firebaseUser != null) {
//      print("Log In: $firebaseUser");
//      authNotifier.setUser(firebaseUser);
//    }
//  }
//}
//
//signup(User user, AuthNotifier authNotifier) async {
//  AuthResult authResult = await FirebaseAuth.instance
//      .createUserWithEmailAndPassword(
//          email: user.email, password: user.password)
//      .catchError((error) => print(error.code));
//
//  if (authResult != null) {
//    UserUpdateInfo updateInfo = UserUpdateInfo();
//    updateInfo.displayName = user.displayName;
//
//    FirebaseUser firebaseUser = authResult.user;
//
//    if (firebaseUser != null) {
//      await firebaseUser.updateProfile(updateInfo);
//
//      await firebaseUser.reload();
//
//      print("Sign up: $firebaseUser");
//
//      FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
//      authNotifier.setUser(currentUser);
//    }
//  }
//}
//
//signout(AuthNotifier authNotifier) async {
//  await FirebaseAuth.instance
//      .signOut()
//      .catchError((error) => print(error.code));
//
//  authNotifier.setUser(null);
//}
//
//initializeCurrentUser(AuthNotifier authNotifier) async {
//  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
//
//  if (firebaseUser != null) {
//    print(firebaseUser);
//    authNotifier.setUser(firebaseUser);
//  }
//}
//
//getProducts(ProductNotifier productNotifier) async {
//  QuerySnapshot snapshot = await Firestore.instance
//      .collection('Products')
//      .orderBy("createdAt", descending: true)
//      .getDocuments();
//
//  List<Product> _productList = [];
//
//  snapshot.documents.forEach(
//    (document) {
//      Product product = Product.fromMap(document.data);
//      _productList.add(product);
//    },
//  );
//
//  productNotifier.productList = _productList;
//}
//
//uploadProductAndImage(Product product, bool isUpdating, File localFile,
//    Function productUploaded) async {
//  if (localFile != null) {
//    print("uploading image");
//
//    var fileExtension = path.extension(localFile.path);
//    print(fileExtension);
//
//    var uuid = Uuid().v4();
//
//    final StorageReference firebaseStorageRef = FirebaseStorage.instance
//        .ref()
//        .child('products/images/$uuid$fileExtension');
//
//    await firebaseStorageRef
//        .putFile(localFile)
//        .onComplete
//        .catchError((onError) {
//      print(onError);
//      return false;
//    });
//
//    String url = await firebaseStorageRef.getDownloadURL();
//    print("download url: $url");
////    _uploadProduct(product, isUpdating, productUploaded, imageUrl: url);
//  } else {
//    print('...skipping image upload');
////    _uploadProduct(product, isUpdating, productUploaded);
//  }
//}
//
////_uploadProduct(Product product, bool isUpdating, Function productUploaded,
////    {String imageUrl}) async {
////  CollectionReference productRef = Firestore.instance.collection('Products');
////
////  if (imageUrl != null) {
////    product._image = imageUrl;
////  }
////
////  if (isUpdating) {
////    product.updatedAt = Timestamp.now();
////
////    await productRef.document(product.id).updateData(product.toMap());
////
////    productUploaded(product);
////    print('updated product with id: ${product.id}');
////  } else {
////    product.createdAt = Timestamp.now();
////
////    DocumentReference documentRef = await productRef.add(product.toMap());
////
////    product.id = documentRef.documentID;
////
////    print('uploaded product successfully: ${product.toString()}');
////
////    await documentRef.setData(product.toMap(), merge: true);
////
////    productUploaded(product);
////  }
////}
//
//deleteProduct(Product product, Function productDeleted) async {
//  if (product.image != null) {
//    StorageReference storageReference =
//        await FirebaseStorage.instance.getReferenceFromUrl(product.image);
//
//    print(storageReference.path);
//
//    await storageReference.delete();
//
//    print('image deleted');
//  }
//
//  await Firestore.instance.collection('Products').document(product.id).delete();
//  productDeleted(product);
//}
