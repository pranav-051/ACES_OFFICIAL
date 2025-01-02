import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';

class SideNavPage5 extends StatefulWidget {
  const SideNavPage5({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<SideNavPage5> createState() => _SideNavPage5();
}

class _SideNavPage5 extends State<SideNavPage5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Row(
            children: [
              CustomText(
                text: 'FAQs',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(40),
          children: <Widget>[
            ExpansionTile(
              title: const Text('What do we do?'),
              children: <Widget>[
                ListTile(
                  title: const Text("ACES looks forward to the welfare of its students by conducting ambitious conferences and workshops. Events are held to broaden the skill set of our students and assist them in their domain. At ACES, we encourage participation in academics as well as extra-curricular activities"
                     " We provide technical as well as non technical support to the students by organizing different workshops, events & Hackathons."
                      "We hone the talents at the right time and help them grow by providing them a platform to showcase their skills in different domains"),
                  onTap: () {
                    // Do something when item 1 is tapped
                  },
                ),
              ],
            ),
            const Divider(height: 1),
            const SizedBox(
              height: 20,
            ),

            ExpansionTile(
              title: const Text('What opportunities ACES provides?'),
              children: <Widget>[
                ListTile(
                  title: const Text("ACES promotes participation and exploration of self-interests. Each event aims at the expansion of the skill sets of the students. We provide them with a platform to showcase their talent. With our faculty and committee, we strive to provide an ocean of opportunities for them to dive in"), onTap: () {
                  },
                ),
              ],
            ),
            const Divider(height: 1),
           ],
        )

    );
  }
}
















// import 'package:flutter/material.dart';
// import 'SidebarSubPages/FAQsPage.dart';
// import 'SidebarSubPages/FeedbackPage.dart';
//
// class SideNavPage5 extends StatefulWidget {
//   const SideNavPage5({Key? key, required this.title}) : super(key: key);
//   final String title;
//   @override
//   State<SideNavPage5> createState() => _SideNavPage5();
// }
//
// class _SideNavPage5 extends State<SideNavPage5> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         centerTitle: true,
//
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [Text('Help Center          ',style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.w500)),],
//         ),
//       ),
//       body:  ListView(
//         padding: const EdgeInsets.all(40),
//         children: <Widget>[
//           const SizedBox(height: 10),
//           ///Civil Engineering //////////////////////////////////////////////
//           OutlinedButton(
//             style: OutlinedButton.styleFrom(
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                 backgroundColor: Colors.white,
//                 elevation: 10,
//                 alignment: Alignment.center,
//                 minimumSize: const Size.fromHeight(50),
//                 side: const BorderSide(color: Colors.orangeAccent, width: 1)),
//             child: const Text(
//               "FAQs",
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16),
//             ),
//             onPressed: () => {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) =>  const FAQsPage(title: 'FAQsPage')),
//               )
//
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           const SizedBox(height: 20),
//           // ///Mechanical Engineering //////////////////////////////////////////////
//           // OutlinedButton(
//           //   style: OutlinedButton.styleFrom(
//           //     shape: const RoundedRectangleBorder(
//           //         borderRadius: BorderRadius.all(Radius.circular(10))),
//           //     backgroundColor: Colors.white,
//           //     elevation: 10,
//           //     alignment: Alignment.center,
//           //     minimumSize: const Size.fromHeight(50),
//           //     side: const BorderSide(color: Colors.orangeAccent, width: 1),
//           //   ),
//           //   child: const Text("Feedback Form",
//           //       style: TextStyle(
//           //           color: Colors.black,
//           //           fontWeight: FontWeight.w400,
//           //           fontSize: 16)),
//           //   onPressed: () => {
//           //     Navigator.push(
//           //       context,
//           //       MaterialPageRoute(builder: (context) =>  const FeedbackPage(title: 'FAQsPage')),
//           //     )
//           //
//           //   },
//           // ),
//           // const SizedBox(
//           //   height: 8,
//           // ),
//
//           //const SizedBox(height: 20),
//           ///ENTC Engineering //////////////////////////////////////////////
//           OutlinedButton(
//             style: OutlinedButton.styleFrom(
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10))),
//               backgroundColor: Colors.white,
//               elevation: 10,
//               alignment: Alignment.center,
//               minimumSize: const Size.fromHeight(50),
//               side: const BorderSide(color: Colors.orangeAccent, width: 1),
//             ),
//             child: const Text(
//               "Report A Problem",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16),
//             ),
//             onPressed: () => {
//             Navigator.push(
//                    context,
//                    MaterialPageRoute(builder: (context) =>  const ReportAProblem(title: 'FAQsPage')),
//             )
//             },
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//
//           const Divider(height: 50),
//           const SizedBox(
//             height: 100,
//           )
//         ],
//       )
//
//
//     );
//   }
// }
