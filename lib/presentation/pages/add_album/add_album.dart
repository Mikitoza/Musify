import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musify_mobile/presentation/di/injection.dart';
import 'package:musify_mobile/presentation/pages/add_album/add_album_cubit.dart';
import 'package:musify_mobile/presentation/pages/add_album/add_album_state.dart';
import 'package:musify_mobile/presentation/theme/theme_provider.dart';

class AddAlbumPage extends StatefulWidget {
  const AddAlbumPage({Key? key}) : super(key: key);

  @override
  State<AddAlbumPage> createState() => _AddAlbumPageState();
}

class _AddAlbumPageState extends State<AddAlbumPage> {
  final cubit = i.get<AddAlbumCubit>();
  final _nameController = TextEditingController();
  late final File file;

  @override
  void initState() {
    cubit.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAlbumCubit, AddAlbumState>(
      bloc: cubit,
      builder: (context, state) {
        return state.isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                body: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.025,
                          horizontal: MediaQuery.of(context).size.width * 0.1,
                        ),
                        child: ListView.builder(
                          itemCount: state.genres.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                state.genres[index].name,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              onTap: () => cubit.setCurrent(index),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              color: ThemeProvider.of(context).theme.light,
                            ),
                            hintText: "Название",
                            fillColor: ThemeProvider.of(context).theme.light.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png'],
                        );

                        if (result != null) {
                          file = File(result.files.single.path!);
                        } else {}
                      },
                      child: const Text("Выбрать обложку"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(16, 24),
                        textStyle: TextStyle(
                          color: ThemeProvider.of(context).theme.light,
                        ),
                        primary: ThemeProvider.of(context).theme.primaryAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () => cubit.createAlbum(
                        state.genres[state.genre].id,
                        _nameController.text,
                        file,
                      ),
                      child: const Text("Создать"),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(16, 24),
                        textStyle: TextStyle(
                          color: ThemeProvider.of(context).theme.light,
                        ),
                        primary: ThemeProvider.of(context).theme.primaryAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
