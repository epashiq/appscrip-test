// import 'package:appscrip_test/model/user_model.dart';
// import 'package:appscrip_test/view/widgets/user_details_card_widget.dart';
// import 'package:flutter/material.dart';

// class UserDetailScreen extends StatelessWidget {
//   final UserModel user;

//   const UserDetailScreen({
//     super.key,
//     required this.user,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('User Details'),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               elevation: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundColor: Theme.of(context).primaryColor,
//                       child: Text(
//                         user.name.split(' ').map((n) => n[0]).take(2).join(),
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       user.name,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headlineSmall
//                           ?.copyWith(fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       '@${user.username}',
//                       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                             color: Colors.grey[600],
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             Text(
//               'Contact Information',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall
//                   ?.copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             UserDetailsCardWidget(
//               icon: Icons.email,
//               title: 'Email',
//               subtitle: user.email,
//             ),
//             const SizedBox(height: 8),
//             UserDetailsCardWidget(
//               icon: Icons.phone,
//               title: 'Phone',
//               subtitle: user.phone,
//             ),
//             const SizedBox(height: 8),
//             UserDetailsCardWidget(
//               icon: Icons.web,
//               title: 'Website',
//               subtitle: user.website,
//             ),
//             const SizedBox(height: 20),

//             // Address
//             Text(
//               'Address',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall
//                   ?.copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             UserDetailsCardWidget(
//               icon: Icons.location_on,
//               title: 'Address',
//               subtitle: user.address.fullAddress,
//             ),
//             const SizedBox(height: 20),

//             // Company
//             Text(
//               'Company',
//               style: Theme.of(context)
//                   .textTheme
//                   .headlineSmall
//                   ?.copyWith(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 12),
//             UserDetailsCardWidget(
//               icon: Icons.business,
//               title: user.company.name,
//               subtitle: user.company.catchPhrase,
//             ),
//             const SizedBox(height: 8),
//             UserDetailsCardWidget(
//               icon: Icons.work,
//               title: 'Business',
//               subtitle: user.company.bs,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:appscrip_test/model/user_model.dart';
import 'package:appscrip_test/view/widgets/user_details_card_widget.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        backgroundColor: Colors.blueGrey, 
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue, 
                      child: Text(
                        user.name.split(' ').map((n) => n[0]).take(2).join(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '@${user.username}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            UserDetailsCardWidget(
              icon: Icons.email,
              title: 'Email',
              subtitle: user.email,
            ),
            const SizedBox(height: 8),
            UserDetailsCardWidget(
              icon: Icons.phone,
              title: 'Phone',
              subtitle: user.phone,
            ),
            const SizedBox(height: 8),
            UserDetailsCardWidget(
              icon: Icons.web,
              title: 'Website',
              subtitle: user.website,
            ),

            const SizedBox(height: 20),

            const Text(
              'Address',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            UserDetailsCardWidget(
              icon: Icons.location_on,
              title: 'Address',
              subtitle: user.address.fullAddress,
            ),

            const SizedBox(height: 20),

            const Text(
              'Company',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            UserDetailsCardWidget(
              icon: Icons.business,
              title: user.company.name,
              subtitle: user.company.catchPhrase,
            ),
            const SizedBox(height: 8),
            UserDetailsCardWidget(
              icon: Icons.work,
              title: 'Business',
              subtitle: user.company.bs,
            ),
          ],
        ),
      ),
    );
  }
}
