part of 'shared.dart';

Future<File> getImageFromGallery() async {
  final picker = ImagePicker();
  var pickedImage = await picker.getImage(source: ImageSource.gallery);

  return File(pickedImage.path);
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);
  StorageUploadTask task = ref.putFile(image);
  StorageTaskSnapshot snapshot = await task.onComplete;

  return await snapshot.ref.getDownloadURL();
}
