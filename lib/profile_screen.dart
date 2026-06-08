// This screen displays a profile with an avatar, stats and bio

// StatelessWidget is used because this screen only
// displays fixed information

//BRANCH

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Defining colours once at the top which makes it easy to make changes to the colors
  static const Color _green = Color(0xFF3DAA6E);
  static const Color _textDark = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF888888);

  // This returns a Scaffold which gives us the an app bar and body skeleton of the app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar :
      // The thin bar at the very top of the screen.
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: _textDark,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: _textDark),
            onPressed: () {},
          ),
        ],
      ),
      // Body:
      // SingleChildScrollView lets the entire page scroll vertically.
      // Without it, Flutter would throw an overflow error on small screens
      // where all the content is taller than the visible area.
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 16),
            _buildBio(),
            const SizedBox(height: 20),
            _buildTabRow(),
            const SizedBox(height: 16),
            _buildRecipeList(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Widget _buildProfileHeader() :
  // Builds the top section of the profile:
  // a circular photo on the left and three stat counters on the right.
  // Padding wraps the whole row so it does not touch the screen edges.
  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        // crossAxisAlignment.center keeps the avatar and stats
        // vertically centred with each other in the row.
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/profile.jpg',
              width: 82,
              height: 82,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 82,
                height: 82,
                color: const Color(0xFFE0E0E0),
                child: const Center(
                  child: Text(
                    'LM',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF555555),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat('Recipe', '4'),
                _buildStat('Followers', '2.5M'),
                _buildStat('Following', '259'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildStat():
  // Returns a small Column with a muted label on top
  // and a bold number below it.
  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: _textGrey,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: _textDark,
          ),
        ),
      ],
    );
  }

  //Widget _buildBio():
  // Builds the section just below the header:
  Widget _buildBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Linda Maduka',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            'Chef',
            style: TextStyle(
              fontSize: 13,
              color: _textGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 13,
                color: _textDark,
                height: 1.55,
              ),
              children: [
                TextSpan(text: 'Private Chef\n'),
                TextSpan(text: 'Foodie '),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'More...',
                  style: TextStyle(
                    color: _green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildTabRow():
  // Builds the Recipe / Videos / Tag row.
  Widget _buildTabRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 11),
            decoration: BoxDecoration(
              color: _green,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Text(
              'Recipe',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 24),
          const Text(
            'Videos',
            style: TextStyle(
              fontSize: 14,
              color: _textGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 24),
          const Text(
            'Tag',
            style: TextStyle(
              fontSize: 14,
              color: _textGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildRecipeList():
  // Builds a vertical list of recipe cards.
  Widget _buildRecipeList() {
    final List<Map<String, String>> recipes = [
      {
        'title': 'Pounded Yam & Egusi Soup',
        'author': 'By Chef Linda',
        'time': '30 min',
        'rating': '4.5',
        'asset': 'assets/images/egusi.jpg',
      },
      {
        'title': 'Nkwobi',
        'author': 'Dumebi Okonkwo',
        'time': '45 min',
        'rating': '4.2',
        'asset': 'assets/images/nkwobii.jpg',
      }
    ];
    return Column(
      children: recipes
          .map((r) => _buildRecipeCard(
                title: r['title']!,
                author: r['author']!,
                time: r['time']!,
                rating: r['rating']!,
                assetPath: r['asset']!,
              ))
          .toList(),
    );
  }

  // ── _buildRecipeCard() ────────────────────────────────────
  // Returns one full-width recipe card.
  Widget _buildRecipeCard({
    required String title,
    required String author,
    required String time,
    required String rating,
    required String assetPath,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF2A2A2A),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              assetPath,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFF3A3A3A),
                child: const Icon(
                  Icons.fastfood,
                  color: Colors.white54,
                  size: 48,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xCC000000),
                  ],
                  stops: [0.45, 1.0],
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3CD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFA000), size: 13),
                    const SizedBox(width: 3),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF7A5000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 14,
              right: 14,
              bottom: 12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          author,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withValues(alpha: 0.75),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.white.withValues(alpha: 0.85),
                            size: 13,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
