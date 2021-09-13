import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parinayam/model/parinayam_model.dart';
import 'package:parinayam/screens/location_screen.dart';
import 'package:parinayam/screens/notification_screen.dart';
import 'package:parinayam/tabs/HomePage/Edit%20Details/education_and_career_details.dart';
import 'package:parinayam/tabs/HomePage/Edit%20Details/family_details.dart';
import 'package:parinayam/tabs/HomePage/Edit%20Details/personal_detail.dart';
import 'package:parinayam/tabs/HomePage/Edit%20Details/pictures.dart';
import 'package:parinayam/tabs/HomePage/Edit%20Details/profile_details.dart';
import 'package:parinayam/tabs/HomePage/profile.dart';
import 'constants.dart';

List<ParinayamModel> getInterests() {
  List<ParinayamModel> list = [];
  list.add(ParinayamModel(name: 'Movies'));
  list.add(ParinayamModel(name: 'Cooking'));
  list.add(ParinayamModel(name: 'Design'));
  list.add(ParinayamModel(name: 'Gambling'));
  list.add(ParinayamModel(name: 'Video Games'));
  list.add(ParinayamModel(name: 'Book Nerd'));
  list.add(ParinayamModel(name: 'Booting'));
  list.add(ParinayamModel(name: 'Athlete'));
  list.add(ParinayamModel(name: 'Technology'));
  list.add(ParinayamModel(name: 'Shopping'));
  list.add(ParinayamModel(name: 'Swimming'));
  list.add(ParinayamModel(name: 'Art'));
  list.add(ParinayamModel(name: 'Video graPhy'));
  list.add(ParinayamModel(name: 'Music Enthusiast'));

  return list;
}

List<ParinayamModel> getSettingData() {
  List<ParinayamModel> list = [];
  list.add(ParinayamModel(name: 'Edit your profile', widget: const EditProfile()));
  list.add(ParinayamModel(name: 'Change your location', widget: const LocationScreen()));
  list.add(ParinayamModel(name: 'Notifications', widget: const NotificationScreen()));

  return list;
}

List<ParinayamModel> getEditDetails(int userId) {
  List<ParinayamModel> list = [];
  list.add(ParinayamModel(name: 'Profile', widget: ProfileDetails(userId : userId)));
  list.add(ParinayamModel(name: 'Personal', widget: PersonalDetails(userId : userId)));
  list.add(ParinayamModel(name: 'Education And Career', widget: const EducationAndCareers()));
  list.add(ParinayamModel(name: 'Family', widget: const FamilyDetails()));

  return list;
}

List<ParinayamModel> getNotificationList() {
  List<ParinayamModel> list = [];
  list.add(ParinayamModel(name: 'All Notifications', mISCheck: true));
  list.add(ParinayamModel(name: 'Message Notification', mISCheck: false));
  list.add(ParinayamModel(name: 'Match Notification', mISCheck: false));
  list.add(ParinayamModel(name: 'Receive Notification by Mail', mISCheck: false));
  list.add(ParinayamModel(name: 'Receive Notification by SMS', mISCheck: false));

  return list;
}

List<ParinayamModel> getIdealList() {
  List<ParinayamModel> list = [];
  list.add(ParinayamModel(name: 'Love', widget: Icon(Icons.favorite_border, color: white), color: redColor.withOpacity(0.7)));
  list.add(ParinayamModel(name: 'Friend', widget: Icon(Icons.person_outline, color: white), color: royalBlue.withOpacity(0.7)));
  list.add(ParinayamModel(name: 'Fling', widget: Icon(Icons.flip_camera_ios_outlined, color: white), color: mediumTurquoise.withOpacity(0.7)));
  list.add(ParinayamModel(name: 'Business', widget: Icon(Icons.business, color: white), color: goldenRod.withOpacity(0.7)));

  return list;
}

List<MessageModel> getChatMsgData() {
  List<MessageModel> list = [];

  MessageModel c1 = MessageModel();
  c1.senderId = Sender_id;
  c1.receiverId = Receiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  MessageModel c2 = MessageModel();
  c2.senderId = Sender_id;
  c2.receiverId = Receiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  MessageModel c3 = MessageModel();
  c3.senderId = Receiver_id;
  c3.receiverId = Sender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  MessageModel c4 = MessageModel();
  c4.senderId = Sender_id;
  c4.receiverId = Receiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  MessageModel c5 = MessageModel();
  c5.senderId = Sender_id;
  c5.receiverId = Receiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  MessageModel c6 = MessageModel();
  c6.senderId = Receiver_id;
  c6.receiverId = Sender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  MessageModel c7 = MessageModel();
  c7.senderId = Sender_id;
  c7.receiverId = Receiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  MessageModel c8 = MessageModel();
  c8.senderId = Receiver_id;
  c8.receiverId = Sender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  MessageModel c9 = MessageModel();
  c9.senderId = Sender_id;
  c9.receiverId = Receiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  MessageModel c10 = MessageModel();
  c10.senderId = Receiver_id;
  c10.receiverId = Sender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  MessageModel c11 = MessageModel();
  c11.senderId = Receiver_id;
  c11.receiverId = Sender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  MessageModel c12 = MessageModel();
  c12.senderId = Sender_id;
  c12.receiverId = Receiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  MessageModel c13 = MessageModel();
  c13.senderId = Sender_id;
  c13.receiverId = Receiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  MessageModel c14 = MessageModel();
  c14.senderId = Receiver_id;
  c14.receiverId = Sender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  MessageModel c15 = MessageModel();
  c15.senderId = Sender_id;
  c15.receiverId = Receiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  MessageModel c16 = MessageModel();
  c16.senderId = Receiver_id;
  c16.receiverId = Sender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  MessageModel c17 = MessageModel();
  c17.senderId = Sender_id;
  c17.receiverId = Receiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  MessageModel c18 = MessageModel();
  c18.senderId = Receiver_id;
  c18.receiverId = Sender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}