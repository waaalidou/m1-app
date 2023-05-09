import 'package:flutter/material.dart';

class Module with ChangeNotifier {
  final String name;
  final String code;
  final String description;
  final String professor;
  final int coeff;

   Module({
    required this.name,
    required this.code,
    required this.description,
    required this.professor,
    required this.coeff,
  });
}

class ModuleProvider with ChangeNotifier {
  final List<Module> _modules = [
     Module(
      name: "Machine learning 1",
      code: "AA1",
      description: "Different Machine learning techniques ",
      professor: "Moussaoui",
      coeff: 2,
    ),
     Module(
      name: "Cloud Computing",
      code: "CC",
      description: "A general Overview about devops",
      professor: "Toumi",
      coeff: 2,
    ),
     Module(
      name: "Web App Security",
      code: "SAW",
      description: "How to secure web applications from different vulenrabilities",
      professor: "Benzin",
      coeff: 3,
    ),
     Module(
      name: "Semantic Web ",
      code: "WS",
      description: "Getting started in the world of semanric web",
      professor: "Mediani",
      coeff: 2,
    ),
     Module(
      name: "Contenu multimedia",
      code: "CM",
      description: "How to deal with image processing",
      professor: "Douidi",
      coeff: 2,
    ),
  ];

  List<Module> get modules => [..._modules];

  Module findByCode(String code) {
    return _modules.firstWhere((module) => module.code == code);
  }

  void addModule(Module module) {
    _modules.add(module);
    notifyListeners();
  }

  void deleteModule(String code) {
    _modules.removeWhere((module) => module.code == code);
    notifyListeners();
  }
}
