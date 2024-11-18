import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projet/constants.dart';
import 'dart:io';

class UploadPage extends StatefulWidget {
  final String videoPath;

  UploadPage({required this.videoPath});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();
  List<String> selectedThemes = [];
  File? _thumbnail;

  @override
  void dispose() {
    _titleFocusNode.dispose();
    super.dispose();
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _thumbnail = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
                  child: Center(
                    child: Text(
                      "Ajouter Une Vidéo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),

                TextFormField(
                  controller: _titleController,
                  focusNode: _titleFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Titre',
                    labelStyle: TextStyle(
                      color: _titleFocusNode.hasFocus ? green : Colors.black,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez insérer un titre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Theme Selector
                const Text('Selectionnez entre 1 et 3 thèmes',
                    style: TextStyle(fontSize: 16)),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: themes.map((theme) {
                    return ChoiceChip(
                      label: Text(theme),
                      selected: selectedThemes.contains(theme),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            if (selectedThemes.length < 3) {
                              selectedThemes.add(theme);
                            }
                          } else {
                            selectedThemes.remove(theme);
                          }
                        });
                      },
                      selectedColor: green,
                      labelStyle: TextStyle(
                        color: selectedThemes.contains(theme)
                            ? Colors.white
                            : Colors.black,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),

                // Thumbnail Upload
                const Text('Selectionnez une image pour la vidéo',
                    style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Center(
                  // Centering the image picker widget
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width *
                          0.8, // Make it a bit narrower
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: _thumbnail == null
                          ? const Center(child: Text('Choisir image'))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                _thumbnail!,
                                fit: BoxFit
                                    .cover, // Ensures full image is displayed
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Submit Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          selectedThemes.isNotEmpty &&
                          _thumbnail != null) {
                        // Proceed to upload video and thumbnail
                        // You can send the data here
                        print(
                            'Uploading video with title: ${_titleController.text}');
                        print('Selected Themes: $selectedThemes');
                        print('Thumbnail Path: ${_thumbnail!.path}');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Veuillez remplir tous les champs!')),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(green),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 30.0),
                      child: Text('Télécharger Vidéo',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
