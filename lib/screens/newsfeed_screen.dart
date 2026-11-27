import 'package:material_ui/material_ui.dart';
import '../widget/newsfeed_card.dart'; // Make sure this path is correct!

class NewsfeedScreen extends StatelessWidget {
  const NewsfeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Note: We removed 'const' from the ListView children below
    return ListView(
      children: [
        NewsfeedCard(
          userName: 'Subaru',
          postContent: 'No matter how tough the loop gets, I will never give up!',
          date: '10 hours ago',
          numOfLikes: 10,
          hasImage: false,
          avatarUrl: 'assets/images/subaru.jpg', // Assuming you have this local
        ),
        NewsfeedCard(
          userName: 'Kirito',
          postContent: 'Heading back into Aincrad for another floor run.',
          date: 'December 1, 2023',
          numOfLikes: 3000,
          hasImage: true,
          imageUrl: 'assets/images/aincrad.jpg',
          avatarUrl: 'assets/images/kirito.png',
        ),
        // Adding 8 more to satisfy the "10 posts" requirement
        NewsfeedCard(
          userName: 'Asuna',
          postContent: 'The food in Aincrad is surprisingly good.',
          date: '2 hours ago',
          numOfLikes: 450,
          hasImage: false,
          avatarUrl: 'assets/images/asuna.jpg',
        ),
        NewsfeedCard(
          userName: 'Emilia',
          postContent: 'The weather is nice today.',
          date: '3 hours ago',
          numOfLikes: 1200,
          hasImage: false,
          avatarUrl: 'assets/images/emilia.jpg',
        ),
        NewsfeedCard(
          userName: 'Rem',
          postContent: 'Who is Rem?',
          date: '4 hours ago',
          numOfLikes: 890,
          hasImage: false,
          avatarUrl: 'assets/images/rem.jpg',
        ),
        NewsfeedCard(
          userName: 'Levi',
          postContent: 'Clean up this mess.',
          date: '5 hours ago',
          numOfLikes: 5000,
          hasImage: false,
          avatarUrl: 'assets/images/levi.jpg',
        ),
        NewsfeedCard(
          userName: 'Mikasa',
          postContent: 'Eren...',
          date: '6 hours ago',
          numOfLikes: 2100,
          hasImage: false,
          avatarUrl: 'assets/images/mikasa.jpg',
        ),
        NewsfeedCard(
          userName: 'Naruto',
          postContent: 'I am going to be Hokage!',
          date: '7 hours ago',
          numOfLikes: 10000,
          hasImage: false,
          avatarUrl: 'assets/images/naruto.jpg',
        ),
        NewsfeedCard(
          userName: 'Sasuke',
          postContent: 'I will destroy the Leaf Village.',
          date: '8 hours ago',
          numOfLikes: 7500,
          hasImage: false,
          avatarUrl: 'assets/images/sasuke.jpg',
        ),
        NewsfeedCard(
          userName: 'Goku',
          postContent: 'I want to fight strong guys!',
          date: '9 hours ago',
          numOfLikes: 15000,
          hasImage: false,
          avatarUrl: 'assets/images/goku.jpg',
        ),
      ],
    );
  }
}