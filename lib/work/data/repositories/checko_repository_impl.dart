import 'package:aviapoint/core/failure/failure.dart';
import 'package:aviapoint/work/data/datasources/checko_service.dart';
import 'package:aviapoint/work/domain/entities/company_short_info.dart';
import 'package:aviapoint/work/domain/repositories/checko_repository.dart';
import 'package:dartz/dartz.dart';

class CheckoRepositoryImpl implements CheckoRepository {
  final CheckoService service;

  CheckoRepositoryImpl({required this.service});

  @override
  Future<Either<Failure, CompanyShortInfo>> getCompanyByInn(String inn) async {
    try {
      final response = await service.getByInn(inn);
      final data = response is Map<String, dynamic> ? response : <String, dynamic>{};
      final info = _mapShortInfo(data, inn);
      return Right(info);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  CompanyShortInfo _mapShortInfo(Map<String, dynamic> response, String inn) {
    final data = _extractData(response);
    final normalizedInn = _pickValue(data, const ['ИНН', 'inn']) ?? inn;

    return CompanyShortInfo(
      type: 'Организация',
      name: _stringFromValue(data['НаимПолн']),
      shortName: _stringFromValue(data['НаимСокр']),
      inn: normalizedInn,
      ogrn: _stringFromValue(data['ОГРН']),
      kpp: _stringFromValue(data['КПП']),
      address: _formatAddress(data['ЮрАдрес']),
      status: _formatStatus(data['Статус']),
      manager: null,
      generalDirector: _formatDirectorFromList(data['Руковод']),
      email: null,
      phone: null,
      site: null,
    );
  }

  Map<String, dynamic> _extractData(Map<String, dynamic> response) {
    final data = response['data'];
    if (data is Map<String, dynamic>) {
      return data;
    }
    return response;
  }

  String? _pickValue(Map<String, dynamic> data, List<String> keys) {
    for (final key in keys) {
      final value = data[key];
      final stringValue = _stringFromValue(value);
      if (stringValue != null) return stringValue;
    }
    return null;
  }

  String? _stringFromValue(dynamic value) {
    if (value == null) return null;
    if (value is String) {
      final trimmed = value.trim();
      return trimmed.isEmpty ? null : trimmed;
    }
    if (value is num || value is bool) {
      return value.toString();
    }
    return null;
  }

  String? _formatStatus(dynamic value) {
    if (value is Map) {
      final name = _stringFromValue(value['Наим'] ?? value['name'] ?? value['status']);
      final code = _stringFromValue(value['Код'] ?? value['code']);
      if (name != null && code != null) {
        return '$name ($code)';
      }
      return name ?? code;
    }
    return _stringFromValue(value);
  }

  String? _formatAddress(dynamic value) {
    if (value is String) {
      final trimmed = value.trim();
      return trimmed.isEmpty ? null : trimmed;
    }
    if (value is Map) {
      final direct = _stringFromValue(value['АдресРФ']);
      if (direct != null) return direct;

      final city = _stringFromValue(value['НасПункт']);
      final postalCode = _stringFromValue(value['Индекс']);

      final parts = <String>[];
      if (city != null) parts.add(city);
      if (postalCode != null) parts.add(postalCode);

      return parts.isEmpty ? null : parts.join(', ');
    }
    return null;
  }

  String? _formatDirectorFromList(dynamic value) {
    if (value is List) {
      for (final item in value) {
        if (item is Map) {
          final role = _stringFromValue(item['НаимДолжн']);
          if (role != null && role.toUpperCase().contains('ГЕНЕРАЛ')) {
            return _stringFromValue(item['ФИО']);
          }
        }
      }
      for (final item in value) {
        if (item is Map) {
          final fio = _stringFromValue(item['ФИО']);
          if (fio != null) return fio;
        }
      }
    }
    return null;
  }
}
