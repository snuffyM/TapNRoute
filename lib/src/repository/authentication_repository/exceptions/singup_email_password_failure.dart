class SingUpWithEmailAndPasswordFailure{
  final String message;

  const SingUpWithEmailAndPasswordFailure([this.message = "An Unknown Error Occurred."]);

  factory SingUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' :
        return const SingUpWithEmailAndPasswordFailure('Please enter a Strong Password');
      case 'invalid-email' :
        return const SingUpWithEmailAndPasswordFailure('Email is not valid or Badly formatted');
      case 'email-already-in-use' :
        return const SingUpWithEmailAndPasswordFailure('An account already exists for that email');
      case 'operation-not-allowed' :
        return const SingUpWithEmailAndPasswordFailure('Operation is not allowed. Please contact support');
      case 'user-disabled' :
        return const SingUpWithEmailAndPasswordFailure('This user is disabled. Please contact support');
      default :
        return const SingUpWithEmailAndPasswordFailure();
    }
  }
}