class SignUpWithEmailAndPasswordFailure{
  final String message;

  const SignUpWithEmailAndPasswordFailure([this.message= "An Unknown error occurred."]);
  
  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password': return const SignUpWithEmailAndPasswordFailure('Please enter a stronger password.');
      case 'invalid-email': return const SignUpWithEmailAndPasswordFailure('Email is not valid.');
      case 'email-already-in-use': return const SignUpWithEmailAndPasswordFailure('');
      case 'operation-not-allowed': return const SignUpWithEmailAndPasswordFailure('');
      case 'user-disabled': return const SignUpWithEmailAndPasswordFailure('');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}