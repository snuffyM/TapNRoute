import '../authentication_repository/exceptions/authentication_repository.dart';

fetchID() async {
  await AuthenticationRepository;
  var currentID = AuthenticationRepository.instance.UniqueID;
  return currentID;
      print('main function: $currentID');
}