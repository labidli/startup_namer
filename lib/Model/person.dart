class Person {
   String firstName;
   String surName;
   String email;
   String sexe;

   Person({ this.firstName, this.surName,this.email, this.sexe});

   factory Person.fromJson(Map<String, dynamic> parsedJson){
      return Person(
          firstName: parsedJson['firstName'],
          surName : parsedJson['surName'],
          email : parsedJson ['email'],
          sexe: parsedJson ['gender']
      )
      ;
   }
}