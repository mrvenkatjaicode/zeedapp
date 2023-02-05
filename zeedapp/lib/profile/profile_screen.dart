import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zeedapp/profile/manage_profile_scree.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Container(
            // color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.16,
            width: 500,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  color: Colors.deepOrange,
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width,
                ),
                Positioned(
                  bottom: 5,
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                        image: NetworkImage('http://i.imgur.com/QSev0hg.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color: Colors.white,
                        width: 7.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Arun Kumar",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageProfileScreen()));
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.amber.shade100,
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.amber,
                  ),
                ),
                title: Text(
                  "Manage profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: null, icon: Icon(Icons.arrow_forward_ios)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber.shade100,
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.amber,
                  ),
                ),
                title: Text(
                  "My plans",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber.shade100,
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.amber,
                  ),
                ),
                title: Text(
                  "Terms & conditions",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber.shade100,
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.amber,
                  ),
                ),
                title: Text(
                  "About us",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber.shade100,
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.amber,
                  ),
                ),
                title: Text(
                  "Log out",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
