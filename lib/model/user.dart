class User {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;
  String token;

  User(
      {this.id = 0,
      this.username = 'username',
      this.email = 'email',
      this.firstName = 'firstName',
      this.lastName = 'lastName',
      this.gender = 'gender',
      this.image = 'https://robohash.org/autquiaut.png?size=50x50&set=set1',
      this.token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZz9zaXplPTUweDUwJnNldD1zZXQxIiwiaWF0IjoxNjM1NzczOTYyLCJleHAiOjE2MzU3Nzc1NjJ9.n9PQX8w8ocKo0dMCw3g8bKhjB8Wo7f7IONFBDqfxKhs'});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: (json['firstName'] != null) ? json['firstName'] : 'first name',
      lastName: (json['lastName'] != null) ? json['lastName'] : 'last name',
      gender: (json['gender'] != null) ? json['gender'] : 'male',
      image: (json['image'] != null)
          ? json['image']
          : 'https://robohash.org/autquiaut.png?size=50x50&set=set1',
      token: (json['token'] != null)
          ? json['token']
          : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZz9zaXplPTUweDUwJnNldD1zZXQxIiwiaWF0IjoxNjM1NzczOTYyLCJleHAiOjE2MzU3Nzc1NjJ9.n9PQX8w8ocKo0dMCw3g8bKhjB8Wo7f7IONFBDqfxKhs');
}
