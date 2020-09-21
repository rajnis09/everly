import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '../../utils/auth/auth_handler.dart';
import '../../utils/theme/theme_data.dart';
import '../../model/list_profile_section.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ListProfileSection> listSection = new List();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createListItem();
  }

  void createListItem() {
    listSection.add(
      createSection(
        'Address Management',
        Icons.mode_edit,
        () {
          print('Address Mangement');
        },
      ),
    );
    listSection.add(
      createSection(
        'Logout',
        Icons.exit_to_app,
        () async {
          if (await authHandler.getCurrentUser() != null) {
            authHandler.signOut();
          }
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
      ),
    );
  }

  createSection(String title, IconData icon, Function onpressed) {
    return ListProfileSection(title, icon, onpressed);
  }

  File _image;
  bool selected = false;

  final picker = ImagePicker();

  Future getImagefromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    Navigator.of(context).pop();

    setState(() {
      _image = File(pickedFile.path);
      selected = true;
    });
  }

  Future getImagefromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    Navigator.of(context).pop();

    setState(() {
      _image = File(pickedFile.path);
      selected = true;
    });
  }

  void _presentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(
        children: <Widget>[
          SizedBox(height: 8),
          _buildBottomSheetRow(
            context,
            Icons.camera_alt,
            'Take Photo',
            getImagefromCamera,
          ),
          _buildBottomSheetRow(
            context,
            Icons.image,
            'Choose from Gallery',
            getImagefromGallery,
          ),
          _buildBottomSheetRow(
            context,
            Icons.delete,
            'Remove',
            () {
              setState(() {
                selected = false;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSheetRow(
    BuildContext context,
    IconData icon,
    String text,
    Function ontap,
  ) =>
      InkWell(
        onTap: ontap,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                icon,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(width: 8),
            Text(text),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) => Container(
            height: 440,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xff0F2027),
                        Color(0xff203A43),
                        Color(0xff2C5364)
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      'Profile',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    margin: EdgeInsets.only(
                      top: 85,
                      left: 24,
                    ),
                  ),
                ),
                Container(
                  height: 380,
                  margin: EdgeInsets.only(
                    top: 150,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Card(
                          margin: EdgeInsets.only(
                            top: 50,
                            left: 16,
                            right: 16,
                          ),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(14),
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      color: Colors.black,
                                      iconSize: 24,
                                      onPressed: () => Navigator.pushNamed(
                                        context,
                                        '/editprofileinfo',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "Yash Khandelwal",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "9876543210",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "khandelwalyashykc@gmail.com",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                height: 2,
                                width: double.infinity,
                                color: Colors.grey.shade200,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemBuilder: (context, index) => InkWell(
                                  splashColor: Colors.grey.shade200,
                                  onTap: listSection[index].onpressed,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      left: 16,
                                      right: 12,
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(listSection[index].icon),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          listSection[index].title,
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Icon(
                                          Icons.navigate_next,
                                          color: Colors.grey.shade500,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                itemCount: listSection.length,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 2,
                                    ),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: selected == false
                                          ? AssetImage("assets/images/1.png")
                                          : FileImage(_image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  width: 100,
                                  height: 100,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    child: new CircleAvatar(
                                      backgroundColor:
                                          CustomThemeData.blackColorShade1,
                                      radius: 18.0,
                                      child: new Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onTap: () => _presentBottomSheet(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
