abstract class TripStates {}

///General States
class InitialState extends TripStates{}

class ChangePasswordVisibilityState extends TripStates{}

///End of General states

///Login State
class LoginLoadingState extends TripStates{}
class LoginSuccessState extends TripStates{
  final String uId;
  LoginSuccessState(this.uId);
}
class LoginErrorState extends TripStates{}

///End of Login State


///SignUp State
class SignUpLoadingState extends TripStates{}
class SignUpSuccessState extends TripStates{
  final  String uId;
  SignUpSuccessState(this.uId);
}
class SignUpErrorState extends TripStates{}
///End SignUp State

///SignOut State
class SignOutLoadingState extends TripStates{}
class SignOutSuccessState extends TripStates{}
class SignOutErrorState extends TripStates{}
///End SignOut State
///CreateUser State
class CreateUserLoadingState extends TripStates{}
class CreateUserSuccessState extends TripStates{
  final  String uId;
  CreateUserSuccessState(this.uId);
}
class CreateUserErrorState extends TripStates{}
///End of CreateUser State

class GettripSuccessState extends TripStates{}
class SettripSuccessState extends TripStates{}
class SettripErrorState extends TripStates{}
class BookedtripsuccessState extends TripStates{}
class ChangeTextState extends TripStates{}