class EpisodesModel {
  Info info;
  List<EpisodeResults> results;

  EpisodesModel({this.info, this.results});

  EpisodesModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <EpisodeResults>[];
      json['results'].forEach((v) {
        results.add(EpisodeResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  int count;
  int pages;
  String next;
  String prev;

  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    data['pages'] = this.pages;
    data['next'] = this.next;
    data['prev'] = this.prev;
    return data;
  }
}

class EpisodeResults {
  int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  String created;

  EpisodeResults(
      {this.id,
      this.name,
      this.airDate,
      this.episode,
      this.characters,
      this.url,
      this.created});

  EpisodeResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    airDate = json['air_date'];
    episode = json['episode'];
    characters = json['characters'].cast<String>();
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['air_date'] = this.airDate;
    data['episode'] = this.episode;
    data['characters'] = this.characters;
    data['url'] = this.url;
    data['created'] = this.created;
    return data;
  }
}
