import 'package:chip_list_choice/CheckBoxModel.dart';

class StackHolders extends CheckBoxModel {
  final String sId;
  final String name;
  final  List<ProjectSponsors> projectSponsors;

  StackHolders({this.sId, this.name, this.projectSponsors})
  {
    this.title=name;

  }

}

class ProjectSponsors {
  int id;
  int projectId;
  int sponsorId;

  ProjectSponsors({this.id, this.projectId, this.sponsorId});

  ProjectSponsors.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    projectId = json['ProjectId'];
    sponsorId = json['SponsorId'];
  }
}