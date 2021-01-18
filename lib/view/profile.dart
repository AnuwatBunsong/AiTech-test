import 'package:cremation/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/profile_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    implements ProfileContract, UpdateProfileContract {
  ProfilePresenter _profilePresenter;
  UpdateProfilePresenter _updateProfilePresenter;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final picker = ImagePicker();
  bool _isLoading = true;
  var profileData;

  _ProfilePageState() {
    _profilePresenter = ProfilePresenter(this);
    _updateProfilePresenter = UpdateProfilePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  Future getImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Dialogs.showLoadingDialog(context, _keyLoader);
      _updateProfilePresenter.updateImageProfile(token, pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  void getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');

    if (token != null) {
      _profilePresenter.getProfile(token);
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  void updateProfileSuccess(response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
    prefs.remove('userData');
    Navigator.pushNamed(context, '/main_page');
  }

  @override
  void updateProfileError(error) {}

  @override
  void getProfileSuccess(Profile items) async {
    setState(() {
      _isLoading = false;
      profileData = items;
    });
  }

  @override
  void getProfileError(error) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: appBarTitle('ข้อมูลส่วนตัวสมาชิก'),
          flexibleSpace: appBarBackground(),
        ),
        backgroundColor: Color(0xFFE5E5E5),
        body: ListView(children: [
          if (_isLoading)
            Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: CircularProgressIndicator()))
          else
            Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 27),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Column(children: [
                      Container(
                          margin: EdgeInsets.only(right: 13, bottom: 20),
                          width: 80.0,
                          height: 80.0,
                          child: GestureDetector(
                              onTap: () {
                                getImage();
                              },
                              child: Container(
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(profileData.image
                                              .toString())))))),
                      profileDetail(
                          'เลขทะเบียน :', profileData.memberId.toString()),
                      profileDetail(
                          'ชื่อ-สกุล :',
                          profileData.firstName.toString() +
                              ' ' +
                              profileData.lastName.toString()),
                      profileDetail('เลขบัตรประชาชน :', '0000000000000'),
                      profileDetail(
                          'วันเกิด :', profileData.birthDate.toString()),
                      profileDetail('ที่อยู่สำหรับติดต่อ :',
                          profileData.address.toString()),
                      profileDetail(
                          'เบอร์โทรศัพท์ :', profileData.telephone.toString()),
                      profileDetail(
                          'สถานะสมาชิก :', profileData.status.toString()),
                      profileDetail('เป็นสมาชิกตั้งแต่ :',
                          profileData.completeDate.toString()),
                      profileDetail('วิธีชำระเงิน :', 'หน่วยงานต้นสังกัด'),
                      profileDetail(
                          'สถานที่เรียกเก็บเงิน :', 'รพร.สระบุรี (พิเศษ)'),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: dotWidget(
                            (MediaQuery.of(context).size.width - 50),
                            10,
                            5,
                            2,
                            0xFFACB3BF),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 25),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFEDEDED),
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 2.0,
                                )
                              ],
                              color: Colors.white),
                          child: Column(children: [
                            Container(
                                child: Text(
                                    'เปลี่ยนผู้มีสิทธิ์รับเงินครั้งแรกล่าสุด',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF50555C),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 16,
                                        height: 1.3))),
                            Container(
                                child: Text('อัพเดต ณ วันที่',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF50555C),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 16,
                                        height: 1.3))),
                            Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text('วว/ดด/ปป',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFEFA746),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 16)))
                          ]))
                    ]))),
        ]));
  }

  Widget profileDetail(String title, String value) {
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 4,
              child: Container(
                  alignment: Alignment.topRight,
                  child: Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF50555C),
                          fontFamily: 'SukhumvitText',
                          fontSize: 18)))),
          Expanded(
              flex: 6,
              child: Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(value,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFEFA746),
                          fontFamily: 'SukhumvitText',
                          fontSize: 18))))
        ]));
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              Color(0xFFEFA746)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Color(0xFFEFA746)),
                        )
                      ]),
                    )
                  ]));
        });
  }
}
