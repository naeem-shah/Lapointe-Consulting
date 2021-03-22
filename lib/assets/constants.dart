class Constants {

  static const String database = "UsersDb.db";

  static const String usersTable = "Users";

  static const String id = "Id";
  static const String name = "Name";
  static const String email = "Email";
  static const String password = "Password";


  static const String usersSchema = "CREATE TABLE $usersTable ("
      "$id INTEGER PRIMARY KEY AUTOINCREMENT,"
      "$name TEXT,"
      "$email TEXT,"
      "$password TEXT"
      ")";
}