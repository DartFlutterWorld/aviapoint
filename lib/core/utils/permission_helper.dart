import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/profile_page/profile/domain/entities/profile_entity.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Утилиты для проверки прав доступа
class PermissionHelper {
  PermissionHelper._();

  /// Проверяет, является ли текущий пользователь владельцем или администратором
  ///
  /// Параметры:
  /// - [ownerId] - ID владельца контента (sellerId, pilotId, authorId и т.д.)
  /// - [context] - BuildContext для доступа к ProfileBloc
  ///
  /// Возвращает true, если текущий пользователь является владельцем ИЛИ администратором
  static bool isOwnerOrAdmin(int? ownerId, BuildContext context) {
    // Проверяем авторизацию
    final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
    if (!isAuthenticated || ownerId == null) {
      return false;
    }

    // Получаем профиль текущего пользователя
    final profileBloc = context.read<ProfileBloc>();
    final profileState = profileBloc.state;

    ProfileEntity? currentProfile;
    profileState.maybeWhen(success: (profile) => currentProfile = profile, orElse: () => currentProfile = null);

    if (currentProfile == null) {
      return false;
    }

    // Проверяем: является ли пользователь владельцем ИЛИ администратором
    final isOwner = currentProfile!.id == ownerId;
    final isAdmin = currentProfile!.isAdmin;

    return isOwner || isAdmin;
  }

  /// Получает ID текущего пользователя из ProfileBloc
  static int? getCurrentUserId(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    final profileState = profileBloc.state;

    int? currentUserId;
    profileState.maybeWhen(success: (profile) => currentUserId = profile.id, orElse: () => currentUserId = null);

    return currentUserId;
  }

  /// Проверяет, является ли текущий пользователь администратором
  static bool isAdmin(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();
    final profileState = profileBloc.state;

    bool admin = false;
    profileState.maybeWhen(success: (profile) => admin = profile.isAdmin, orElse: () => admin = false);

    return admin;
  }
}
