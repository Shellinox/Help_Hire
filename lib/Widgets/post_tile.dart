import 'package:flutter/material.dart';
import 'package:help_hive/Utils/colors.dart';

class PostTile extends StatelessWidget {
  final String title;
  final String description;
  final String contactNum;
  final double salary;
  final String address;
  final void Function()? onPressed;
  const PostTile({
    super.key,
    required this.title,
    required this.description,
    required this.contactNum,
    required this.salary,
    required this.address,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          title.toUpperCase(),
                          style: const TextStyle(
                              color: primaryTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: onPressed,
                    icon: const Icon(Icons.delete_outline_rounded),
                    color: inactiveTabItemColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: const TextStyle(color: primaryTextColor),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_rounded,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        contactNum,
                        style: const TextStyle(color: primaryTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money_rounded,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        salary.toString(),
                        style: const TextStyle(color: primaryTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          address,
                          style: const TextStyle(color: primaryTextColor),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
