import 'package:app/constants/dimens.dart';
import 'package:app/ui/screens/albums.dart';
import 'package:app/ui/screens/artists.dart';
import 'package:app/ui/screens/favorites.dart';
import 'package:app/ui/screens/songs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  Widget menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 0,
        leading: Opacity(opacity: .5, child: Icon(icon)),
        title: Text(title, style: TextStyle(fontSize: 20)),
        trailing: Opacity(
          opacity: .3,
          child: Icon(
            CupertinoIcons.chevron_right,
            size: 18,
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> menuItems = ListTile.divideTiles(
      context: context,
      tiles: <Widget>[
        menuItem(
          icon: CupertinoIcons.heart_fill,
          title: 'Favorites',
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute<void>(
              builder: (_) => FavoritesScreen(previousPageTitle: 'Library'),
              title: 'Favorites',
            ));
          },
        ),
        menuItem(
          icon: CupertinoIcons.music_note_list,
          title: 'Playlists',
          onTap: () {},
        ),
        menuItem(
          icon: CupertinoIcons.music_mic,
          title: 'Artists',
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute<void>(
              builder: (_) => ArtistsScreen(previousPageTitle: 'Library'),
              title: 'Artists',
            ));
          },
        ),
        menuItem(
          icon: CupertinoIcons.music_albums,
          title: 'Albums',
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute<void>(
              builder: (_) => AlbumsScreen(previousPageTitle: 'Library'),
              title: 'Albums',
            ));
          },
        ),
        menuItem(
          icon: CupertinoIcons.music_note,
          title: 'Songs',
          onTap: () {
            Navigator.of(context).push(CupertinoPageRoute<void>(
              builder: (_) => SongsScreen(previousPageTitle: 'Library'),
              title: 'Songs',
            ));
          },
        ),
      ],
    ).toList();

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.black,
            trailing: Text('Home', style: TextStyle(color: Colors.white)),
            largeTitle: Text(
              'Library',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.horizontalPadding,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(menuItems),
            ),
          ),
        ],
      ),
    );
  }
}
