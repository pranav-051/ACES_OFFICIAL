import 'package:aces/SidebarNavPages/SideNavPage7.dart';
import 'package:aces/auth_users/auth_services/user_model.dart';
import 'package:aces/constants/colors.dart';
import 'package:aces/welcome_page.dart';
import 'package:flutter/material.dart';
import '/SidebarNavPages/SideNavPage1.dart';
import '/SidebarNavPages/SettingsPage.dart';
import '/SidebarNavPages/SideNavPage5.dart';
import '/SidebarNavPages/SideNavPage6.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:share_plus/share_plus.dart';


/*
*


//----------------------------------------------------------------------------------------------------------------------------------


* */


class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final String _content =
      'My Instagram account link: https://www.instagram.com/accounts/login/';
  void _shareContent(BuildContext context) { Share.share(_content);   }
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

    final _dialog = RatingDialog(
    starSize: 35,
    // your app's name?
    title:  const Text(
      '                ACES',
      style: TextStyle(
          color: AppColors.oxfordBlue, fontWeight: FontWeight.w500, fontSize: 25),
    ),
    message: const Text(
      '  Rate us 5* and Support Us',
      style: TextStyle(
          color: AppColors.oxfordBlue, fontWeight: FontWeight.w300, fontSize: 19),
    ),
    // your app's logo?
    image: Image.asset(
      "assets/acesLogo1.png",
      height: 90,
      width: 90,
      fit: BoxFit.contain,
    ),
    submitButtonText: 'Submit',
    onCancelled: () => print('cancelled'),
    onSubmitted: (response) {
      print('rating: ${response.rating}, comment: ${response.comment}');
      // TODO: add your own logic
      if (response.rating < 3.0) {
        // send their comments to your email or anywhere you wish
        // ask the user to contact you instead of leaving a bad review
      } else {
        //go to app store
        StoreRedirect.redirect(
            androidAppId: 'com.example.wegpaiens',
            iOSAppId: 'com.example.wegpaiens');
      }
    },
  );

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    if (user != null) {
      try {
        // Assuming Firestore collection is named 'users'
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();

        if (userDoc.exists) {
          setState(() {
            loggedInUser = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
          });
        }
      } catch (e) {
        print("Error fetching user details: $e");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      elevation: 5,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.oxfordBlue),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                "assets/acesLogo.png",
                fit: BoxFit.cover,
              ),
            ),
            accountName: Text(
              loggedInUser.name ?? "User Name",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            accountEmail: Text(
              loggedInUser.email ?? "User Email",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          ListTile(
            leading:
            const Icon(Icons.account_circle_outlined, color: AppColors.oxfordBlue),
            title: const Text('Profile',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UserProfilePage()),
              )
            },
          ),

          ListTile(
              leading: const Icon(Icons.share_sharp, color: AppColors.oxfordBlue),
              title: const Text('Share',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
              onTap: () => {_shareContent(context)}),
          ListTile(
            leading: const Icon(Icons.settings_outlined, color: AppColors.oxfordBlue),
            title: const Text('Settings',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    SettingsPage(onThemeChanged: (ThemeMode ) {  })),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.star_rate_outlined, color: AppColors.oxfordBlue),
            title: const Text('Rate Us',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
            onTap: () => {
              showDialog(
                context: context,
                builder: (context) => _dialog,
              )
            },
          ),
          ListTile(
            leading:
            const Icon(Icons.help_outline_outlined, color: AppColors.oxfordBlue),
            title: const Text('Help Center',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const SideNavPage5(title: 'SideNavPage5')),
              )
            },
          ),
          ListTile(
            leading:
            const Icon(Icons.privacy_tip_outlined, color: AppColors.oxfordBlue),
            title: const Text('Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                    const SideNavPage6()),
              )
            },
          ),

          ListTile(
            leading: const Icon(Icons.developer_mode_sharp, color: AppColors.oxfordBlue),
            title: const Text('Developers',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
            onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const UserProfileGrid(),
                  ))},
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.oxfordBlue),
            title: const Text('Logout',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
            onTap: () => {logout(context)},
          ),

          const Divider(
            thickness: 1,
            height: 5,
          ),

          // ignore: prefer_const_constructors
          SizedBox(height: 5.0),
          const Text(
            "      Version:  1.0.1",
            style: TextStyle(fontWeight: FontWeight.w300, color: AppColors.oxfordBlue),
          )
          // Remaining ListTiles...
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomePage()));
  }
}

