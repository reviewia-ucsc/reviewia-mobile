


class SlectedGroup {

  late int id;
  late String createdAt;
  late int postId;
  late List<dynamic> messages;
  late bool active;
  late List<dynamic> users;

  SlectedGroup(
      {required this.id,
        required this.createdAt,
        required this.postId,
        required this.messages,
        required this.active,
        required this.users,
      });

  SlectedGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    postId = json['postId'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages.add(new Messages.fromJson(v));
      });
    }
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['postId'] = this.postId;
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    data['active'] = this.active;
    return data;
  }
}


class Messages {

  late int id;
  late String createdAt;
  late String createdBy;
  late String content;
  late String fullName;


  Messages({required this.id, required this.createdAt, required this.createdBy, required this.content, required this.fullName});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    content = json['content'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['content'] = this.content;
    data['fullName'] = this.fullName;
    return data;
  }

}

class Users {
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  late String avatar;

  Users(
      {required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.avatar
      });

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    return data;
  }
}