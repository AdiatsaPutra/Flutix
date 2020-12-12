part of 'shared.dart';

// Get Image From Gallery Method
Future<File> pick() {
  var image = ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}

// Get Download URL
Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  // Mendapatkan Objek Image Dari Firebase Storage
  StorageReference ref = FirebaseStorage.instance.ref().child(fileName);

  // Mengupload Image Tersebut
  StorageUploadTask task = ref.putFile(image);

  // Mendapatkan Kembalian Snaphot Image Hasil Upload
  StorageTaskSnapshot snapshot = await task.onComplete;

  // Mendapatkan Download URL
  return await snapshot.ref.getDownloadURL();
}
