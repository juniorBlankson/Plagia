import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:plagia_oc/widgets/build_light_theme_background.dart';
import 'package:plagia_oc/widgets/custom_textfield.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<EditPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // DateTime now = DateTime.now();

    // Extract the day, suffix, and the rest of the date separately
    // String day = DateFormat('d').format(now);
    // // String suffix = getDaySuffix(day);
    // String formattedDate = DateFormat("MMMM, yyyy").format(now);

    return buildLightThemeBackground(
      mainWidget: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.orange),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.267),
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const Spacer(),
              ],
            ),
            //SizedBox(height: size.height * 0.016),
            // const Text(
            //   'Profile',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 22,
            //   ),
            // ),
            SizedBox(height: size.height * 0.022),
            Container(
              height: 126,
              width: 126,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 2),
                shape: BoxShape.circle,
                color: Colors.orange,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3)),
                ],
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/per.png'),
              ),
            ),
            SizedBox(height: size.height * 0.012),

            // Display the formatted date with superscript suffix
            // Text.rich(
            //   TextSpan(
            //     children: [
            //       TextSpan(
            //         text: day,
            //         style: const TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //       WidgetSpan(
            //         child: Transform.translate(
            //           offset: const Offset(1.0, -5.0),
            //           child: Text(
            //             suffix,
            //             textScaleFactor: 0.7,
            //             style: const TextStyle(
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ),
            //       ),
            //       TextSpan(
            //         text: ' $formattedDate',
            //         style: const TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            SizedBox(height: size.height * 0.016),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Update Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.008),
            CustomTextField(
              isPassword: false,
              prefixIcon: IconlyBroken.message,
              hintText: 'Enter your email here',
              controller: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              isPassword: true,
              prefixIcon: IconlyBroken.lock,
              hintText: 'Enter your password here',
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              isPassword: true,
              prefixIcon: IconlyBroken.lock,
              hintText: 'Confirm your password',
              controller: confirmPasswordController,
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Update',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildUtilities(BuildContext context) {
  //   final size = MediaQuery.of(context).size;
  //   return Column(
  //     children: [
  //       _buildUtilitiesBox(
  //         icon: const Icon(Icons.color_lens_rounded),
  //         title: 'Theme',
  //         isSwitch: true, // Add a flag to handle the switch
  //       ),
  //       SizedBox(height: size.height * 0.004),
  //       _buildUtilitiesBox(
  //         icon: const Icon(IconlyLight.shield_done),
  //         title: 'Privacy & Policy',
  //       ),
  //       SizedBox(height: size.height * 0.004),
  //       _buildUtilitiesBox(
  //         icon: const Icon(IconlyLight.paper),
  //         title: 'Terms & Conditions',
  //       ),
  //     ],
  //   );
  // }

  Widget _buildUtilitiesBox({
    required Icon icon,
    required String title,
    bool isSwitch =
        false, // Optional parameter to determine if a switch is needed
  }) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey.withOpacity(0.45),
      ),
      height: 58,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            // const Spacer(), // Pushes the switch to the far right
            // if (isSwitch)
            //   Switch(
            //     value: _isDarkTheme, // Bind the switch to the state variable
            //     onChanged: (bool value) {
            //       setState(() {
            //         _isDarkTheme =
            //             value; // Update the state when the switch is toggled
            //       });
            //     },
            //   ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        _buildPersonalInfoBox(
          0,
          const Icon(IconlyBroken.profile),
          'Name',
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.0036),
        _buildPersonalInfoBox(
          1,
          const Icon(IconlyBroken.message),
          'Email',
          const Text(
            'johndoe@gmail.com',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.0036),
        _buildPersonalInfoBox(
          2,
          const Icon(IconlyBroken.lock),
          'Password',
          Row(
            children: [
              Text(
                _obscureText ? '*********' : 'myPassword123',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 6),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? IconlyBroken.hide : IconlyBroken.show,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalInfoBox(
    int index,
    Icon icon,
    String title,
    Widget value,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: index == 0
            ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            : index == 2
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                : BorderRadius.zero, // No border radius for index = 1
        color: Colors.grey.withOpacity(0.25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          value,
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () =>
            _showLogoutConfirmationDialog(context), // Call the dialog function
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Logout',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(width: 8),
            Icon(IconlyLight.logout, color: Colors.white),
          ],
        ),
      ),
    );
  }

// Function to show the logout confirmation dialog
  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            'Confirm Logout',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); //
              },
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
