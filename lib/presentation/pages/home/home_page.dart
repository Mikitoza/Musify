import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/presentation/app/navigation/navigation_constants.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/home/state.dart';
import 'package:musify_mobile/presentation/theme/theme_provider.dart';
import 'package:musify_mobile/presentation/widgets/horizontal_list.dart';

import 'home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = i.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    cubit.init();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (!state.isLoading) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeProvider.of(context).theme.secondaryAction,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
              ],
            ),
            drawer: state.isAdmin
                ? Drawer(
                    backgroundColor: ThemeProvider.of(context).theme.secondaryAction,
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        DrawerHeader(
                          decoration: BoxDecoration(
                            color: ThemeProvider.of(context).theme.secondaryAction,
                          ),
                          child: Text('Админ панель'),
                        ),
                        ListTile(
                          title: const Text('Добавить трэк'),
                          onTap: () => cubit.appRouter.replaceNamed(addTrackPath),
                        ),
                        ListTile(
                          title: const Text('Добавить альбом'),
                          onTap: () => cubit.appRouter.replaceNamed(addAlbumPath),
                        ),
                        ListTile(
                          title: const Text('Удалить альбом'),
                          onTap: () => cubit.appRouter.replaceNamed(deleteAlbumPath),
                        ),
                        ListTile(
                          title: const Text('Добавить жанр'),
                          onTap: () => cubit.appRouter.replaceNamed(addGenrePath),
                        ),
                        ListTile(
                          title: const Text('Удалить жанр'),
                          onTap: () => cubit.appRouter.replaceNamed(deleteGenrePath),
                        ),
                      ],
                    ),
                  )
                : null,
            body: ListView(
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    "Popular Hits",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                HorizontalSongList(tracks: state.songs),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    "New Releases",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                HorizontalSongList(tracks: state.songs),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    "Albums",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                HorizontalAlbumList(albums: state.albums),
                const SizedBox(height: 12),
              ],
            ),
          );
        }

        return Container();
      },
    );
  }
}
