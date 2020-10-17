

class Project {

  String name;
  int votes;
  String author;

  Project(this.name, this.votes, this.author);

  Project.fromJson(Map<String, dynamic> parsedJSON)
    : name = parsedJSON['name'],
      votes = parsedJSON['votes'],
      author = parsedJSON['author'];

}