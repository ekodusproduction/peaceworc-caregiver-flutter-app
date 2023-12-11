mixin AddClientValidationMixin{
  String isComapnyNameValid(String name){
    if(name.isEmpty){
      return "Company name is required";
    }
    return "";
  }
  String isNameValid(String password){
    if(password.isEmpty){
      return "Full name is required";
    }
    return "";
  }
  String isNumberValid(String number){
    if(number.length < 10){
      return "Mobile number must be a 10 digit number";
    }
    if(double.parse(number) == 0.00){
      return "Invalid mobile number";
    }
    return "";
  }
  String isSsnValid(String number){
    if(number.length < 10){
      return "SSN number must be a 9 digit number";
    }
    if(double.parse(number) == 0.00){
      return "Invalid SSN number";
    }
    return "";
  }
  bool isEmailValidate(String value){
    if(!RegExp(r"^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$")
        .hasMatch(value!)){
      return false;
    }
    return true;
  }
  String isAgeValid(String age){
    if(double.parse(age) == 0.00){
      return "Invalid age";
    }
    return "";
  }

  String isPasswordValid(String password){
    if(password.length < 6){
      return "Password must be consisted of 6 or more character";
    }
    if(!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,12}$").hasMatch(password!)){
      return "Password should contain at least one lower case, one upper case, one numeric value and one special character";
    }
    return "";
  }
  String isConPasswordValid(String password, String orgPass){
    if(password.length < 6){
      return "Password must be consisted of 6 or more character";
    }
    if(!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,12}$").hasMatch(password!)){
      return "Password should contain at least one lower case, one upper case, one numeric value and one special character";
    }
    if(password != orgPass){
      return "Confirm password does not match with the password";
    }
    return "";
  }
}
