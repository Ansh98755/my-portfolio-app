import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MaterialApp(
    home: PortfolioMaker(),
  ));
}

class PortfolioMaker extends StatefulWidget {
  const PortfolioMaker({Key? key}) : super(key: key);

  @override
  State<PortfolioMaker> createState() => _PortfolioMakerState();
}

class _PortfolioMakerState extends State<PortfolioMaker> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _designation = '';
  String _collegeName = '';
  String _projects = '';
  String _location = '';
  String _email = '';
  String _phoneNumber = '';
  String _aboutMe = '';
  XFile? _image;

  Future<void> _getImageFromGallery() async {
    try {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    } catch (e) {
      // Handle image picking errors
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error picking image. Please try again.'),
        ),
      );
    }
  }

  Future<void> _savePortfolio() async {
    if (_formKey.currentState!.validate()) {
      String portfolioData = 'Name: $_name\n';
      portfolioData += 'Designation: $_designation\n';
      portfolioData += 'College Name: $_collegeName\n';
      portfolioData += 'Projects: $_projects\n';
      portfolioData += 'Location: $_location\n';
      portfolioData += 'Email: $_email\n';
      portfolioData += 'Phone Number: $_phoneNumber\n';
      portfolioData += 'About Me: $_aboutMe\n';
      if (_image != null) {
        portfolioData += 'Image Path: ${_image!.path}\n';
      }

      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/portfolio.txt');
      await file.writeAsString(portfolioData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Portfolio saved locally!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio Maker'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _image != null
                          ? FileImage(File(_image!.path))
                          : const AssetImage('assets/images/default_profile.png'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: _getImageFromGallery,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (value) => setState(() => _name = value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Designation'),
                onChanged: (value) => setState(() => _designation = value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'College Name'),
                onChanged: (value) => setState(() => _collegeName = value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Projects'),
                onChanged: (value) => setState(() => _projects = value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Location'),
                onChanged: (value) => setState(() => _location = value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onChanged: (value) => setState(() => _email = value),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onChanged: (value) => setState(() => _phoneNumber = value),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'About Me'),
                maxLines: null,
                keyboardType: TextInputType.multiline,
                onChanged: (value) => setState(() => _aboutMe = value),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _savePortfolio();
                  }
                },
                child: const Text('Create and Download Portfolio'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}