mixin LoginValidationMixinClass{

bool isEmailValid(String email){
  if(RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)){
    return true;
  }
  return false;
}

}