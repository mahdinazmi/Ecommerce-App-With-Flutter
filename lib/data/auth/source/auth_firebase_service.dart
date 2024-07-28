import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_creation_req.dart';
import '../models/user_signin_req.dart';

abstract class AuthFirebaseService {

  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {


  @override
  Future<Either> signup(UserCreationReq user) async {
    try {

      var returnedData = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!
      );

     await FirebaseFirestore.instance.collection('Users').doc(
        returnedData.user!.uid
      ).set(
        {
          'firstName' : user.firstName,
          'lastName' : user.lastName,
          'email' : user.email,
          'gender' : user.gender,
          'age' : user.age,
          'image' :returnedData.user!.photoURL,
          'userId': returnedData.user!.uid
        }
      );

      return const Right(
        'Sign up was successfull'
      );

    } on FirebaseAuthException catch(e){
      String message = '';
      
      if(e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }
      return Left(message);
    }
  }
  
  @override
  Future<Either> getAges() async {
    try {
      var returnedData = await FirebaseFirestore.instance.collection('Ages').get();
      return Right(
        returnedData.docs
      );
    } catch (e) {
      return const Left(
        'Please try again'
      );
    }
  }
  
  @override
  Future<Either> signin(UserSigninReq user) async {
     try {
       await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!
      );
      return const Right(
        'Sign in was successfull'
      );

    } on FirebaseAuthException catch(e){
      String message = '';
      
      if(e.code == 'invalid-email') {
        message = 'Not user found for this email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for this user';
      }
      
      return Left(message);
    }
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right(
        'Password reset email is sent'
      );
    } catch (e){
      return const Left(
        'Please try again'
      );
    }
  }
  
  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  Future<Either> getUser() async {
    try {
    var currentUser = FirebaseAuth.instance.currentUser;
    var userData = await FirebaseFirestore.instance.collection('Users').doc(
      currentUser?.uid
    ).get().then((value) => value.data());
    return Right(
      userData
    );
    } catch(e) {
      return const Left(
        'Please try again'
      );
    }
  }

  
}