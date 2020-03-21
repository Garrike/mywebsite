import 'package:flutter/material.dart';
import 'package:gabrielmoreira/models/profile.dart';
import 'package:gabrielmoreira/models/project.dart';

Profile profile;
List<Project> projects;

class Service {
  consulta1(){
    return 'Gabriel Moreira'; // Consulta 
  }
}

void initiateDatabase () {
  // profile.name = 'Gabriel Moreira';
  // profile.birth = DateTime(1998, 4, 24);
  // profile.description = 'Estudante de Engenharia de Controle e Automação pela Universidade Federal de Mato Grosso - Brasil';
  // profile.email = 'g.tabordamoreira@gmail.com';
  // profile.image = Image(image: NetworkImage("https://i.pinimg.com/originals/a3/f9/d8/a3f9d867a54ca5163c7adf815040bfaf.jpg"));
  // profile.link = ['https://github.com/Garrike','https://www.instagram.com/tabordagm/'];
  // profile.office = 'Estudante';
  // profile.password = '123456';
  // profile.tags = ['Robótica', 'Flutter', 'Astronomia', 'Drone'];

  projects = [
    Project(
      DateTime(2020), 
      'Descrição Projeto 1', 
      'https://s3.amazonaws.com/cms.ipressroom.com/173/files/20182/5ab42d712cfac20c3403ab28_rocketmdrey/rocketmdrey_c788599d-0e2a-408c-8826-d9ef056f5118-prv.jpg', 
      ['https://github.com/Garrike','https://www.instagram.com/tabordagm/'], 
      true, 
      ['Robótica', 'Flutter', 'Astronomia', 'Drone'], 
      'Projeto 1',
      'Projeto Pessoal'
    ),
    Project(
      DateTime(2020), 
      'Descrição Projeto 2', 
      'https://i.pinimg.com/originals/1d/bb/1b/1dbb1b3390e1543b58404b1b9982de17.jpg', 
      ['https://github.com/Garrike','https://www.instagram.com/tabordagm/'], 
      true, 
      ['Robótica', 'Flutter', 'Astronomia', 'Drone'], 
      'Projeto 2',
      'Projeto Pessoal'
    ),
    Project(
      DateTime(2020), 
      'Descrição Projeto 3', 
      'https://4.imimg.com/data4/UU/VY/MY-23106880/robotics-project-500x500.jpg', 
      ['https://github.com/Garrike','https://www.instagram.com/tabordagm/'], 
      true, 
      ['Robótica', 'Flutter', 'Astronomia', 'Drone'], 
      'Projeto 3',
      'Projeto Pessoal'
    )
  ];
}