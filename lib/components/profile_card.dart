import 'package:fleetmasta/const/colors.dart';
import 'package:flutter/material.dart';

class ProfileStatusCard extends StatelessWidget {
  const ProfileStatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/icons/profile_icon.png'), // Replace with your image asset path
              ),
            ],
          ),
          SizedBox(width:10,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color:Appcolor.grey1,
                  width: 1,
                  height: 170,
                ),
              )
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatusRow('Status', 'Active', Appcolor.white, Appcolor.green),
                Divider(),
                SizedBox(height: 8.0),
                _buildInfoRow('Created at', '30 April 2024\n18:58 PM'),
                Divider(),
                SizedBox(height: 8.0),
                _buildStatusRow('Profile status', 'Approval pending',Appcolor.lightBlack ,Appcolor.pink,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, String status, Color statusColor, Color bgColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Appcolor.lightBlack,
          ),
        ),
        SizedBox(height:3,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
                fontSize: 14
            ),
          ),
        ),
       // Divider(),
      ],
    );
  }

  Widget _buildInfoRow(String label, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Appcolor.lightBlack,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          info,
          style: TextStyle(
            color: Appcolor.lightBlack,
          ),
        ),
      ],
    );
  }
}
