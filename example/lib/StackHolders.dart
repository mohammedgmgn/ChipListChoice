import 'package:chip_list_choice/CheckBoxModel.dart';

class StackHolders extends CheckBoxModel {
  final String sId;
  final String name;
//  final  List<ProjectSponsors> projectSponsors;

  StackHolders({this.sId, this.name})
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

List <StackHolders>stackHoldersList=[

  StackHolders(sId: "1",name: "Mohammed"),
  StackHolders(sId: "2",name: "Mahmoud"),
  StackHolders(sId: "3",name: "Karim"),
  StackHolders(sId: "4",name: "eman"),
  StackHolders(sId: "5",name: "osama"),
  StackHolders(sId: "6",name: "mohsen"),
  StackHolders(sId: "7",name: "Mostafa"),
  StackHolders(sId: "8",name: "Abdullaha"),
  StackHolders(sId: "9",name: "Ibrahim"),
];