import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/custom_text_field.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/floating_action_button_widget.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/presentation/widgets/modals_and_bottom_sheets.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:provider/provider.dart';
import 'package:aviapoint/work/domain/entities/job_resume_entity.dart';
import 'package:aviapoint/work/domain/entities/job_vacancy_entity.dart';
import 'package:aviapoint/work/domain/repositories/jobs_repository.dart';
import 'package:aviapoint/work/presentation/bloc/job_vacancy_favorite_toggle_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/job_vacancy_favorites_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_list_refresh_cubit.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_vacancies_bloc.dart';
import 'package:aviapoint/work/presentation/bloc/jobs_resumes_bloc.dart';
import 'package:aviapoint/work/presentation/widgets/job_vacancy_card.dart';
import 'package:aviapoint/work/presentation/widgets/job_resume_card.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _handleCreateVacancyTap(BuildContext context) async {
  final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
  if (!isAuthenticated) {
    await showLogin(
      context,
      callback: () {
        if (context.mounted) {
          context.router.push<bool>(const CreateJobVacancyRoute()).then((result) {
            if (result == true && context.mounted) {
              context.read<JobsVacanciesBloc>().add(const JobsVacanciesEvent.refresh(resetToMainList: true));
            }
          });
        }
      },
    );
    return;
  }
  final result = await context.router.push<bool>(const CreateJobVacancyRoute());
  if (result == true && context.mounted) {
    context.read<JobsVacanciesBloc>().add(const JobsVacanciesEvent.refresh(employerId: null, includeInactive: false));
  }
}

Future<void> _handleCreateResumeTap(BuildContext context) async {
  final isAuthenticated = Provider.of<AppState>(context, listen: false).isAuthenticated;
  if (!isAuthenticated) {
    await showLogin(
      context,
      callback: () {
        if (context.mounted) {
          context.router.push(const CreateJobResumeRoute());
        }
      },
    );
    return;
  }
  await context.router.push(const CreateJobResumeRoute());
}

@RoutePage()
class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (prev, curr) => prev != curr,
      builder: (context, profileState) {
        final userId = profileState is SuccessProfileState ? profileState.profile.id : null;
        return DefaultTabController(length: 2, child: _WorkScreenContent(userId: userId));
      },
    );
  }
}

class _WorkScreenContent extends StatefulWidget {
  final int? userId;

  const _WorkScreenContent({this.userId});

  @override
  State<_WorkScreenContent> createState() => _WorkScreenContentState();
}

class _WorkScreenContentState extends State<_WorkScreenContent> {
  bool _hasMyVacancies = false;
  bool _hasMyResumes = false;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    if (widget.userId != null) _check();
  }

  @override
  void didUpdateWidget(covariant _WorkScreenContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.userId != oldWidget.userId && widget.userId != null && !_loaded) {
      _check();
    }
  }

  Future<void> _check() async {
    final uid = widget.userId!;
    final repo = getIt<JobsRepository>();
    final v = await repo.getVacancies(employerId: uid, limit: 1);
    final r = await repo.getResumes(userId: uid, limit: 1);
    if (!mounted) return;
    setState(() {
      _hasMyVacancies = v.fold((_) => false, (l) => l.isNotEmpty);
      _hasMyResumes = r.fold((_) => false, (l) => l.isNotEmpty);
      _loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final tabController = DefaultTabController.of(context);
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Работа',
            withBack: false,
            withProfile: true,
            bottom: TabBar(
              controller: tabController,
              labelColor: const Color(0xFF0A6EFA),
              unselectedLabelColor: const Color(0xFF9CA5AF),
              dividerColor: Colors.transparent,
              labelStyle: AppStyles.bold14s,
              unselectedLabelStyle: AppStyles.regular14s,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.5, color: Color(0xFF0A6EFA)),
                insets: EdgeInsets.fromLTRB(8, 0, 8, 2),
              ),
              tabs: const [
                Tab(text: 'Вакансии'),
                Tab(text: 'Резюме'),
              ],
            ),
          ),
          backgroundColor: AppColors.background,
          body: TabBarView(
            children: [
              _VacanciesTab(showEmployerResponsesButton: _hasMyVacancies),
              _ResumesTab(showMyResponsesButton: _hasMyResumes),
            ],
          ),
          floatingActionButton: Builder(
            builder: (context) {
              final tabController = DefaultTabController.of(context);
              return ListenableBuilder(
                listenable: tabController.animation!,
                builder: (context, _) {
                  final index = tabController.index;
                  if (index == 0) {
                    return FloatingActionButtonWidget(title: 'Создать\nвакансию', onTap: () => _handleCreateVacancyTap(context));
                  }
                  if (index == 1) {
                    return FloatingActionButtonWidget(title: 'Создать\nрезюме', onTap: () => _handleCreateResumeTap(context));
                  }
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _ResumesTab extends StatefulWidget {
  final bool showMyResponsesButton;

  const _ResumesTab({this.showMyResponsesButton = false});

  @override
  State<_ResumesTab> createState() => _ResumesTabState();
}

class _ResumesTabState extends State<_ResumesTab> {
  final TextEditingController _searchController = TextEditingController();
  String? _search;
  String? _address;
  int? _salaryFrom;
  int? _salaryTo;
  int? _ageFrom;
  int? _ageTo;
  bool _readyToRelocate = false;
  bool _onlyFavorites = false;
  final Set<int> _favoriteResumeIds = {};

  Future<void> _addResumeToFavorites(int id) async {
    setState(() {
      _favoriteResumeIds.add(id);
    });
    final result = await getIt<JobsRepository>().addResumeToFavorites(id);
    if (!context.mounted) return;
    result.fold((_) {}, (_) => context.read<JobsResumesBloc>().add(JobsResumesEvent.refresh(search: _search, address: _address, onlyFavorites: _onlyFavorites)));
  }

  Future<void> _removeResumeFromFavorites(int id) async {
    setState(() {
      _favoriteResumeIds.remove(id);
    });
    final result = await getIt<JobsRepository>().removeResumeFromFavorites(id);
    if (!context.mounted) return;
    result.fold((_) {}, (_) => context.read<JobsResumesBloc>().add(JobsResumesEvent.refresh(search: _search, address: _address, onlyFavorites: _onlyFavorites)));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applySearch() {
    _search = _searchController.text.trim().isNotEmpty ? _searchController.text.trim() : null;
    context.read<JobsResumesBloc>().add(JobsResumesEvent.get(search: _search, address: _address, onlyFavorites: _onlyFavorites));
  }

  void _openFiltersBottomSheet() {
    final addressController = TextEditingController(text: _address ?? '');
    final salaryFromController = TextEditingController(text: _salaryFrom?.toString() ?? '');
    final salaryToController = TextEditingController(text: _salaryTo?.toString() ?? '');
    final ageFromController = TextEditingController(text: _ageFrom?.toString() ?? '');
    final ageToController = TextEditingController(text: _ageTo?.toString() ?? '');
    bool tempReadyToRelocate = _readyToRelocate;

    showUniversalBottomSheet<void>(
      context: context,
      title: 'Фильтры по резюме',
      child: Builder(
        builder: (bottomSheetContext) {
          return StatefulBuilder(
            builder: (context, bottomSetState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(controller: addressController, labelText: 'Место проживания'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(controller: salaryFromController, labelText: 'Желаемая зарплата от', keyboardType: TextInputType.number),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(controller: salaryToController, labelText: 'до', keyboardType: TextInputType.number),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(controller: ageFromController, labelText: 'Возраст от', keyboardType: TextInputType.number),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextField(controller: ageToController, labelText: 'до', keyboardType: TextInputType.number),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SwitchListTile(
                    value: tempReadyToRelocate,
                    onChanged: (v) {
                      bottomSetState(() {
                        tempReadyToRelocate = v;
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Готов к переезду'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _address = null;
                              _salaryFrom = null;
                              _salaryTo = null;
                              _ageFrom = null;
                              _ageTo = null;
                              _readyToRelocate = false;
                            });
                            Navigator.of(bottomSheetContext).pop();
                            context.read<JobsResumesBloc>().add(JobsResumesEvent.get(search: _search, address: _address, onlyFavorites: _onlyFavorites));
                          },
                          child: const Text('Сбросить'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              final address = addressController.text.trim();
                              _address = address.isNotEmpty ? address : null;
                              _salaryFrom = int.tryParse(salaryFromController.text.replaceAll(' ', ''));
                              _salaryTo = int.tryParse(salaryToController.text.replaceAll(' ', ''));
                              _ageFrom = int.tryParse(ageFromController.text.replaceAll(' ', ''));
                              _ageTo = int.tryParse(ageToController.text.replaceAll(' ', ''));
                              _readyToRelocate = tempReadyToRelocate;
                            });
                            Navigator.of(bottomSheetContext).pop();
                            context.read<JobsResumesBloc>().add(JobsResumesEvent.get(search: _search, address: _address, onlyFavorites: _onlyFavorites));
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary100p, foregroundColor: Colors.white),
                          child: const Text('Применить'),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _searchController,
                  labelText: 'Поиск по резюме',
                  suffixIcon: IconButton(icon: const Icon(Icons.search), onPressed: _applySearch),
                  onSubmitted: (_) => _applySearch(),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 48,
                width: 48,
                child: IconButton(
                  style: IconButton.styleFrom(side: const BorderSide(color: AppColors.strokeForDarkArea)),
                  onPressed: _openFiltersBottomSheet,
                  icon: const Icon(Icons.filter_list),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 48,
                width: 48,
                child: IconButton(
                  style: IconButton.styleFrom(
                    side: BorderSide(color: _onlyFavorites ? AppColors.primary100p : AppColors.strokeForDarkArea),
                    backgroundColor: _onlyFavorites ? AppColors.primary100p.withOpacity(0.1) : null,
                  ),
                  onPressed: () async {
                    final appState = Provider.of<AppState>(context, listen: false);
                    if (!appState.isAuthenticated) {
                      await showLogin(
                        context,
                        callback: () {
                          if (!mounted) return;
                          setState(() {
                            _onlyFavorites = true;
                          });
                          context.read<JobsResumesBloc>().add(JobsResumesEvent.get(search: _search, address: _address, onlyFavorites: _onlyFavorites));
                        },
                      );
                      return;
                    }

                    setState(() {
                      _onlyFavorites = !_onlyFavorites;
                    });
                    context.read<JobsResumesBloc>().add(JobsResumesEvent.get(search: _search, address: _address, onlyFavorites: _onlyFavorites));
                  },
                  icon: Icon(_onlyFavorites ? Icons.favorite : Icons.favorite_border, color: _onlyFavorites ? AppColors.primary100p : AppColors.textPrimary, size: 22),
                ),
              ),
            ],
          ),
        ),
        if (_hasActiveFilters) const SizedBox(height: 16),
        if (_hasActiveFilters)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ClearFiltersChip(
                  onTap: () {
                    setState(() {
                      _address = null;
                      _salaryFrom = null;
                      _salaryTo = null;
                      _ageFrom = null;
                      _ageTo = null;
                      _readyToRelocate = false;
                    });
                    context.read<JobsResumesBloc>().add(JobsResumesEvent.get(search: _search, address: _address, onlyFavorites: _onlyFavorites));
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      if (_address != null) _FilterChipLabel(label: _address!),
                      if (_salaryFrom != null || _salaryTo != null)
                        _FilterChipLabel(
                          label: () {
                            if (_salaryFrom != null && _salaryTo != null) return 'ЗП ${_salaryFrom}–${_salaryTo}';
                            if (_salaryFrom != null) return 'ЗП от $_salaryFrom';
                            if (_salaryTo != null) return 'ЗП до $_salaryTo';
                            return '';
                          }(),
                        ),
                      if (_ageFrom != null || _ageTo != null)
                        _FilterChipLabel(
                          label: () {
                            if (_ageFrom != null && _ageTo != null) return 'Возраст ${_ageFrom}–${_ageTo}';
                            if (_ageFrom != null) return 'Возраст от $_ageFrom';
                            if (_ageTo != null) return 'Возраст до $_ageTo';
                            return '';
                          }(),
                        ),
                      if (_readyToRelocate) const _FilterChipLabel(label: 'Готов к переезду'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        if (widget.showMyResponsesButton)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (Provider.of<AppState>(context, listen: false).isAuthenticated) {
                    context.router.push(const MyVacancyResponsesRoute());
                  } else {
                    showLogin(
                      context,
                      callback: () {
                        if (context.mounted) context.router.push(const MyVacancyResponsesRoute());
                      },
                    );
                  }
                },
                behavior: HitTestBehavior.opaque,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.mail_outline, size: 18, color: AppColors.primary100p),
                    const SizedBox(width: 8),
                    Text('Мои отклики', style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
                  ],
                ),
              ),
            ),
          ),
        Expanded(
          child: BlocListener<JobsResumesRefreshCubit, int>(
            bloc: getIt<JobsResumesRefreshCubit>(),
            listener: (context, _) {
              context.read<JobsResumesBloc>().add(JobsResumesEvent.refresh(search: _search, address: _address, onlyFavorites: _onlyFavorites));
            },
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<JobsResumesBloc>().add(JobsResumesEvent.refresh(search: _search, address: _address, onlyFavorites: _onlyFavorites));
                await Future<void>.delayed(const Duration(milliseconds: 400));
              },
              child: BlocBuilder<JobsResumesBloc, JobsResumesState>(
                builder: (context, state) => state.when(
                  loading: () => const Center(child: LoadingCustom()),
                  loadingMore: (resumes) => _ResumesList(
                    resumes: _filterResumes(resumes),
                    isLoadingMore: true,
                    onlyFavorites: _onlyFavorites,
                    favoriteIds: _favoriteResumeIds,
                    onToggleFavorite: _onlyFavorites ? (id) => _removeResumeFromFavorites(id) : (id) => _addResumeToFavorites(id),
                    onReturnFromDetail: () => context.read<JobsResumesBloc>().add(JobsResumesEvent.refresh(search: _search, address: _address, onlyFavorites: _onlyFavorites)),
                  ),
                  error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(
                    textError: errorForUser,
                    repeat: () {
                      context.read<JobsResumesBloc>().add(JobsResumesEvent.get(search: _search, address: _address, onlyFavorites: _onlyFavorites));
                    },
                  ),
                  success: (resumes, hasMore) => _ResumesList(
                    resumes: _filterResumes(resumes),
                    isLoadingMore: false,
                    onlyFavorites: _onlyFavorites,
                    favoriteIds: _favoriteResumeIds,
                    onToggleFavorite: _onlyFavorites ? (id) => _removeResumeFromFavorites(id) : (id) => _addResumeToFavorites(id),
                    onReturnFromDetail: () => context.read<JobsResumesBloc>().add(JobsResumesEvent.refresh(search: _search, address: _address, onlyFavorites: _onlyFavorites)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool get _hasActiveFilters => _address != null || _salaryFrom != null || _salaryTo != null || _ageFrom != null || _ageTo != null || _readyToRelocate;

  List<JobResumeEntity> _filterResumes(List<JobResumeEntity> resumes) {
    return resumes.where((r) {
      // Желаемая зарплата
      if (_salaryFrom != null && (r.desiredSalary == null || r.desiredSalary! < _salaryFrom!)) return false;
      if (_salaryTo != null && (r.desiredSalary == null || r.desiredSalary! > _salaryTo!)) return false;

      // Готовность к переезду
      if (_readyToRelocate && r.readyToRelocate != true) return false;

      // Возраст
      if ((_ageFrom != null || _ageTo != null) && r.dateOfBirth != null && r.dateOfBirth!.isNotEmpty) {
        final dob = DateTime.tryParse(r.dateOfBirth!);
        if (dob != null) {
          final now = DateTime.now();
          int age = now.year - dob.year;
          final hasHadBirthday = now.month > dob.month || (now.month == dob.month && now.day >= dob.day);
          if (!hasHadBirthday) age -= 1;

          if (_ageFrom != null && age < _ageFrom!) return false;
          if (_ageTo != null && age > _ageTo!) return false;
        }
      }

      return true;
    }).toList();
  }
}

class _FilterChipLabel extends StatelessWidget {
  final String label;

  const _FilterChipLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.strokeForDarkArea),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text(label, style: AppStyles.regular12s.copyWith(color: AppColors.textPrimary))],
      ),
    );
  }
}

class _ClearFiltersChip extends StatelessWidget {
  final VoidCallback onTap;

  const _ClearFiltersChip({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.strokeForDarkArea),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.close, size: 14, color: AppColors.textSecondary),
            const SizedBox(width: 6),
            Text('Стереть фильтры', style: AppStyles.regular12s.copyWith(color: AppColors.textPrimary)),
          ],
        ),
      ),
    );
  }
}

class _ResumesList extends StatelessWidget {
  final List<JobResumeEntity> resumes;
  final bool isLoadingMore;
  final bool onlyFavorites;
  final Set<int> favoriteIds;
  final void Function(int id) onToggleFavorite;
  final VoidCallback? onReturnFromDetail;

  const _ResumesList({required this.resumes, required this.isLoadingMore, this.onlyFavorites = false, required this.favoriteIds, required this.onToggleFavorite, this.onReturnFromDetail});

  @override
  Widget build(BuildContext context) {
    if (resumes.isEmpty && !isLoadingMore) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.strokeForDarkArea),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person_outline, size: 48, color: Color(0xFF9CA5AF)),
                const SizedBox(height: 12),
                Text(
                  'Пока нет резюме',
                  style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (!isLoadingMore && notification.metrics.pixels >= notification.metrics.maxScrollExtent - 200 && notification is ScrollUpdateNotification) {
          context.read<JobsResumesBloc>().add(const JobsResumesEvent.loadMore());
        }
        return false;
      },
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        itemCount: resumes.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final resume = resumes[index];
          return JobResumeCard(
            resume: resume,
            onTap: () async {
              final result = await context.router.push<bool>(JobResumeDetailRoute(id: resume.id));
              if (result == true && context.mounted) onReturnFromDetail?.call();
            },
            isFavorite: onlyFavorites || favoriteIds.contains(resume.id),
            onToggleFavorite: () => onToggleFavorite(resume.id),
          );
        },
      ),
    );
  }
}

class _VacanciesTab extends StatefulWidget {
  final bool showEmployerResponsesButton;

  const _VacanciesTab({this.showEmployerResponsesButton = false});

  @override
  State<_VacanciesTab> createState() => _VacanciesTabState();
}

class _VacanciesTabState extends State<_VacanciesTab> {
  final TextEditingController _searchController = TextEditingController();
  String? _search;
  String? _address;
  String? _experienceLevel;
  String? _employmentType;
  String? _schedule;
  int? _salaryFrom;
  int? _salaryTo;
  bool _onlyFavorites = false;
  bool _onlyMyVacancies = false;
  int? _employerId;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applySearch() {
    _search = _searchController.text.trim().isNotEmpty ? _searchController.text.trim() : null;
    _applyFilters(employerId: _employerId, includeInactive: _onlyMyVacancies);
  }

  void _applyFilters({int? employerId, bool? includeInactive}) {
    context.read<JobsVacanciesBloc>().add(
      JobsVacanciesEvent.get(
        employerId: employerId ?? _employerId,
        search: _search,
        city: _address,
        experienceLevel: _experienceLevel,
        employmentType: _employmentType,
        schedule: _schedule,
        salaryFrom: _salaryFrom,
        salaryTo: _salaryTo,
        includeInactive: includeInactive ?? _onlyMyVacancies,
      ),
    );
  }

  void _openFiltersBottomSheet() {
    final cityController = TextEditingController(text: _address ?? '');
    final salaryFromController = TextEditingController(text: _salaryFrom?.toString() ?? '');
    final salaryToController = TextEditingController(text: _salaryTo?.toString() ?? '');

    String? tempExperience = _experienceLevel;
    String? tempEmployment = _employmentType;
    String? tempSchedule = _schedule;
    bool tempOnlyMyVacancies = _onlyMyVacancies;
    final profileState = context.read<ProfileBloc>().state;
    final currentUserId = profileState is SuccessProfileState ? profileState.profile.id : null;

    showUniversalBottomSheet<void>(
      context: context,
      title: 'Фильтры по вакансиям',
      child: StatefulBuilder(
        builder: (context, setStateModal) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (currentUserId != null)
                SwitchListTile(value: tempOnlyMyVacancies, onChanged: (value) => setStateModal(() => tempOnlyMyVacancies = value), title: const Text('Мои вакансии'), contentPadding: EdgeInsets.zero),
              if (currentUserId != null) const SizedBox(height: 8),
              CustomTextField(controller: cityController, labelText: 'Город'),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: tempExperience,
                decoration: const InputDecoration(labelText: 'Опыт работы', border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: 'no_experience', child: Text('Без опыта')),
                  DropdownMenuItem(value: '1_3', child: Text('1–3 года')),
                  DropdownMenuItem(value: '3_6', child: Text('3–6 лет')),
                  DropdownMenuItem(value: '6_plus', child: Text('6+ лет')),
                ],
                onChanged: (value) {
                  setStateModal(() {
                    tempExperience = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: tempEmployment,
                decoration: const InputDecoration(labelText: 'Тип занятости', border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: 'full_time', child: Text('Полная занятость')),
                  DropdownMenuItem(value: 'part_time', child: Text('Частичная занятость')),
                  DropdownMenuItem(value: 'project', child: Text('Проектная работа')),
                  DropdownMenuItem(value: 'internship', child: Text('Стажировка')),
                ],
                onChanged: (value) {
                  setStateModal(() {
                    tempEmployment = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: tempSchedule,
                decoration: const InputDecoration(labelText: 'График/формат работы', border: OutlineInputBorder()),
                items: const [
                  DropdownMenuItem(value: 'office', child: Text('Офис')),
                  DropdownMenuItem(value: 'remote', child: Text('Удалённо')),
                  DropdownMenuItem(value: 'hybrid', child: Text('Гибрид')),
                  DropdownMenuItem(value: 'shift', child: Text('Сменный график')),
                  DropdownMenuItem(value: 'fly_in_fly_out', child: Text('Вахта')),
                ],
                onChanged: (value) {
                  setStateModal(() {
                    tempSchedule = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(controller: salaryFromController, labelText: 'Зарплата от', keyboardType: TextInputType.number),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomTextField(controller: salaryToController, labelText: 'Зарплата до', keyboardType: TextInputType.number),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _address = null;
                          _experienceLevel = null;
                          _employmentType = null;
                          _schedule = null;
                          _salaryFrom = null;
                          _salaryTo = null;
                          _onlyMyVacancies = false;
                          _employerId = null;
                        });
                        Navigator.of(context).pop();
                        _applyFilters();
                      },
                      child: const Text('Сбросить'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        int? parseSalary(String text) {
                          final cleaned = text.replaceAll(' ', '');
                          if (cleaned.isEmpty) return null;
                          return int.tryParse(cleaned);
                        }

                        setState(() {
                          final city = cityController.text.trim();
                          _address = city.isNotEmpty ? city : null;
                          _experienceLevel = tempExperience;
                          _employmentType = tempEmployment;
                          _schedule = tempSchedule;
                          _salaryFrom = parseSalary(salaryFromController.text);
                          _salaryTo = parseSalary(salaryToController.text);
                          _onlyMyVacancies = tempOnlyMyVacancies;
                          _employerId = tempOnlyMyVacancies ? currentUserId : null;
                        });
                        Navigator.of(context).pop();
                        _applyFilters();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary100p, foregroundColor: Colors.white),
                      child: const Text('Применить'),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _searchController,
                  labelText: 'Поиск по вакансиям',
                  suffixIcon: IconButton(icon: const Icon(Icons.search), onPressed: _applySearch),
                  onSubmitted: (_) => _applySearch(),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 48,
                width: 48,
                child: IconButton(
                  style: IconButton.styleFrom(side: const BorderSide(color: AppColors.strokeForDarkArea)),
                  onPressed: _openFiltersBottomSheet,
                  icon: const Icon(Icons.filter_list),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 48,
                width: 48,
                child: IconButton(
                  style: IconButton.styleFrom(
                    side: BorderSide(color: _onlyFavorites ? AppColors.primary100p : AppColors.strokeForDarkArea),
                    backgroundColor: _onlyFavorites ? AppColors.primary100p.withOpacity(0.1) : null,
                  ),
                  onPressed: () async {
                    final appState = Provider.of<AppState>(context, listen: false);
                    if (!appState.isAuthenticated) {
                      await showLogin(
                        context,
                        callback: () {
                          if (!mounted) return;
                          setState(() => _onlyFavorites = true);
                          context.read<JobVacancyFavoritesBloc>().add(const JobVacancyFavoritesGet());
                        },
                      );
                      return;
                    }

                    setState(() => _onlyFavorites = !_onlyFavorites);
                    if (_onlyFavorites) {
                      context.read<JobVacancyFavoritesBloc>().add(const JobVacancyFavoritesGet());
                    } else {
                      _applyFilters();
                    }
                  },
                  icon: Icon(_onlyFavorites ? Icons.favorite : Icons.favorite_border, color: _onlyFavorites ? AppColors.primary100p : AppColors.textPrimary, size: 22),
                ),
              ),
            ],
          ),
        ),
        if (_hasActiveVacancyFilters) const SizedBox(height: 16),
        if (_hasActiveVacancyFilters)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ClearFiltersChip(
                  onTap: () {
                    setState(() {
                      _address = null;
                      _experienceLevel = null;
                      _employmentType = null;
                      _schedule = null;
                      _salaryFrom = null;
                      _salaryTo = null;
                      _onlyMyVacancies = false;
                      _employerId = null;
                    });
                    _applyFilters();
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      if (_address != null) _FilterChipLabel(label: _address!),
                      if (_experienceLevel != null) _FilterChipLabel(label: _mapExperienceLabel(_experienceLevel!)),
                      if (_employmentType != null) _FilterChipLabel(label: _mapEmploymentTypeLabel(_employmentType!)),
                      if (_schedule != null) _FilterChipLabel(label: _mapScheduleLabel(_schedule!)),
                      if (_salaryFrom != null || _salaryTo != null) _FilterChipLabel(label: _buildSalaryLabel()),
                      if (_onlyMyVacancies) const _FilterChipLabel(label: 'Мои вакансии'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        if (widget.showEmployerResponsesButton)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (Provider.of<AppState>(context, listen: false).isAuthenticated) {
                    context.router.push(const EmployerVacancyResponsesRoute());
                  } else {
                    showLogin(
                      context,
                      callback: () {
                        if (context.mounted) context.router.push(const EmployerVacancyResponsesRoute());
                      },
                    );
                  }
                },
                behavior: HitTestBehavior.opaque,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.mail_outline, size: 18, color: AppColors.primary100p),
                    const SizedBox(width: 8),
                    Text('Отклики по моим вакансиям', style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
                  ],
                ),
              ),
            ),
          ),
        Expanded(
          child: BlocListener<JobsVacanciesRefreshCubit, int>(
            bloc: getIt<JobsVacanciesRefreshCubit>(),
            listener: (context, _) {
              if (!_onlyFavorites) _applyFilters();
            },
            child: BlocListener<JobVacancyFavoriteToggleBloc, JobVacancyFavoriteToggleState>(
              listenWhen: (prev, curr) => curr is JobVacancyFavoriteToggleSuccess,
              listener: (context, state) {
                if (state is JobVacancyFavoriteToggleSuccess) {
                  if (_onlyFavorites) {
                    context.read<JobVacancyFavoritesBloc>().add(JobVacancyFavoritesRemoveItem(vacancyId: state.vacancyId));
                  } else {
                    context.read<JobsVacanciesBloc>().add(JobsVacanciesEvent.updateFavoriteState(vacancyId: state.vacancyId, isFavorite: state.isFavorite));
                  }
                }
              },
              child: RefreshIndicator(
                onRefresh: () async {
                  if (_onlyFavorites) {
                    context.read<JobVacancyFavoritesBloc>().add(const JobVacancyFavoritesRefresh());
                  } else {
                    _applyFilters();
                  }
                  await Future<void>.delayed(const Duration(milliseconds: 400));
                },
                child: _onlyFavorites
                    ? BlocBuilder<JobVacancyFavoritesBloc, JobVacancyFavoritesState>(
                        builder: (context, state) {
                          if (state is LoadingJobVacancyFavoritesState) {
                            return const Center(child: LoadingCustom());
                          }
                          if (state is ErrorJobVacancyFavoritesState) {
                            return ErrorCustom(textError: state.errorForUser, repeat: () => context.read<JobVacancyFavoritesBloc>().add(const JobVacancyFavoritesGet()));
                          }
                          if (state is SuccessJobVacancyFavoritesState) {
                            return _VacanciesList(
                              vacancies: state.vacancies,
                              isLoadingMore: false,
                              onlyFavorites: true,
                              onToggleFavorite: (id, {isCurrentlyFavorite}) => context.read<JobVacancyFavoriteToggleBloc>().add(JobVacancyFavoriteToggleRemove(vacancyId: id)),
                              onReturnFromDetail: () => context.read<JobVacancyFavoritesBloc>().add(const JobVacancyFavoritesRefresh()),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      )
                    : BlocBuilder<JobsVacanciesBloc, JobsVacanciesState>(
                        builder: (context, state) => state.when(
                          loading: () => const Center(child: LoadingCustom()),
                          loadingMore: (vacancies) => _VacanciesList(
                            vacancies: vacancies,
                            isLoadingMore: true,
                            onlyFavorites: false,
                            onToggleFavorite: (id, {isCurrentlyFavorite}) {
                              if (isCurrentlyFavorite == true) {
                                context.read<JobVacancyFavoriteToggleBloc>().add(JobVacancyFavoriteToggleRemove(vacancyId: id));
                              } else {
                                context.read<JobVacancyFavoriteToggleBloc>().add(JobVacancyFavoriteToggleAdd(vacancyId: id));
                              }
                            },
                            onReturnFromDetail: () => _applyFilters(),
                          ),
                          error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) => ErrorCustom(textError: errorForUser, repeat: _applyFilters, paddingTop: 0),
                          success: (vacancies, hasMore) => _VacanciesList(
                            vacancies: vacancies,
                            isLoadingMore: false,
                            onlyFavorites: false,
                            onToggleFavorite: (id, {isCurrentlyFavorite}) {
                              if (isCurrentlyFavorite == true) {
                                context.read<JobVacancyFavoriteToggleBloc>().add(JobVacancyFavoriteToggleRemove(vacancyId: id));
                              } else {
                                context.read<JobVacancyFavoriteToggleBloc>().add(JobVacancyFavoriteToggleAdd(vacancyId: id));
                              }
                            },
                            onReturnFromDetail: () => _applyFilters(),
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool get _hasActiveVacancyFilters => _address != null || _experienceLevel != null || _employmentType != null || _schedule != null || _salaryFrom != null || _salaryTo != null || _onlyMyVacancies;

  String _mapExperienceLabel(String value) {
    switch (value) {
      case 'no_experience':
        return 'Без опыта';
      case '1_3':
        return '1–3 года';
      case '3_6':
        return '3–6 лет';
      case '6_plus':
        return '6+ лет';
      default:
        return value;
    }
  }

  String _mapEmploymentTypeLabel(String value) {
    switch (value) {
      case 'full_time':
        return 'Полная занятость';
      case 'part_time':
        return 'Частичная занятость';
      case 'project':
        return 'Проектная работа';
      case 'internship':
        return 'Стажировка';
      default:
        return value;
    }
  }

  String _mapScheduleLabel(String value) {
    switch (value) {
      case 'office':
        return 'Офис';
      case 'remote':
        return 'Удалённо';
      case 'hybrid':
        return 'Гибрид';
      case 'shift':
        return 'Сменный график';
      case 'fly_in_fly_out':
        return 'Вахта';
      default:
        return value;
    }
  }

  String _buildSalaryLabel() {
    final from = _salaryFrom;
    final to = _salaryTo;
    if (from != null && to != null) return 'ЗП $from–$to';
    if (from != null) return 'ЗП от $from';
    if (to != null) return 'ЗП до $to';
    return '';
  }
}

class _VacanciesList extends StatelessWidget {
  final List<JobVacancyEntity> vacancies;
  final bool isLoadingMore;
  final bool onlyFavorites;
  final void Function(int id, {bool? isCurrentlyFavorite}) onToggleFavorite;
  final VoidCallback? onReturnFromDetail;

  const _VacanciesList({required this.vacancies, required this.isLoadingMore, this.onlyFavorites = false, required this.onToggleFavorite, this.onReturnFromDetail});

  @override
  Widget build(BuildContext context) {
    if (vacancies.isEmpty && !isLoadingMore) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.strokeForDarkArea),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.work_outline, size: 48, color: Color(0xFF9CA5AF)),
                const SizedBox(height: 12),
                Text(
                  'Пока нет вакансий',
                  style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (!onlyFavorites && !isLoadingMore && notification.metrics.pixels >= notification.metrics.maxScrollExtent - 200 && notification is ScrollUpdateNotification) {
          context.read<JobsVacanciesBloc>().add(const JobsVacanciesEvent.loadMore());
        }
        return false;
      },
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        itemCount: vacancies.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final vacancy = vacancies[index];
          return JobVacancyCard(
            vacancy: vacancy,
            onTap: () async {
              final result = await context.router.push<bool>(JobVacancyDetailRoute(id: vacancy.id));
              if (result == true && context.mounted) onReturnFromDetail?.call();
            },
            isFavorite: vacancy.isFavorite ?? onlyFavorites,
            onToggleFavorite: () => onToggleFavorite(vacancy.id, isCurrentlyFavorite: onlyFavorites ? null : (vacancy.isFavorite == true)),
          );
        },
      ),
    );
  }
}
