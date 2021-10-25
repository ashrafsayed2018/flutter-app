import 'package:forsale/application/classes/apportunity/apportunity.dart';
import 'package:forsale/application/repositories/apportunity_repository.dart';

class ApportunityState {
  final ApportunityRepository? _apportunityRepository;

  List<Apportunity>? _apportunities = [];

  ApportunityState(this._apportunityRepository);
  List<Apportunity> get apportunities => _apportunities!;

  Future getAllApportunities() async {
    _apportunities = await _apportunityRepository!.getAllApportunities();
  }
}
