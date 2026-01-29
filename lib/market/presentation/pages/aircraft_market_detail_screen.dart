import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/permission_helper.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/market/domain/entities/aircraft_market_entity.dart';
import 'package:aviapoint/market/presentation/bloc/market_categories_bloc.dart';
import 'package:aviapoint/market/domain/entities/market_category_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_detail_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/aircraft_market_bloc.dart';
import 'package:aviapoint/profile_page/profile/presentation/bloc/profile_bloc.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:dio/dio.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';

@RoutePage()
class AircraftMarketDetailScreen extends StatefulWidget {
  final int id;

  const AircraftMarketDetailScreen({super.key, @PathParam('id') required this.id});

  @override
  State<AircraftMarketDetailScreen> createState() => _AircraftMarketDetailScreenState();
}

class _AircraftMarketDetailScreenState extends State<AircraftMarketDetailScreen> {
  final MapController _mapController = MapController();
  final Dio _dio = Dio(BaseOptions(headers: {'User-Agent': 'AviaPoint App (Flutter)'}, validateStatus: (status) => status != null && status < 500));
  LatLng? _locationCoordinates;
  bool _isLoadingLocation = false;
  String? _lastGeocodedAddress; // Отслеживаем последний загеокодированный адрес

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _dio.close();
    super.dispose();
  }

  Future<void> _geocodeLocation(String address) async {
    if (address.isEmpty) return;

    setState(() {
      _isLoadingLocation = true;
    });

    try {
      final response = await _dio.get<dynamic>(
        'https://nominatim.openstreetmap.org/search',
        queryParameters: {'q': address, 'format': 'json', 'limit': 1, 'addressdetails': 1, 'accept-language': 'ru'},
        options: Options(headers: {'User-Agent': 'AviaPoint App (Flutter)'}, responseType: ResponseType.json),
      );

      if (!mounted) return;

      if (response.statusCode == 200 && response.data != null) {
        final results = response.data is List ? response.data as List<dynamic> : null;
        if (results != null && results.isNotEmpty) {
          final item = results[0] as Map<String, dynamic>;
          final lat = double.tryParse(item['lat']?.toString() ?? '');
          final lng = double.tryParse(item['lon']?.toString() ?? '');

          if (lat != null && lng != null && mounted) {
            setState(() {
              _locationCoordinates = LatLng(lat, lng);
              _isLoadingLocation = false;
            });
            // Обновляем позицию карты после получения координат
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (_locationCoordinates != null && mounted) {
                _mapController.move(_locationCoordinates!, 15.0);
              }
            });
          }
        } else {
          if (mounted) {
            setState(() {
              _isLoadingLocation = false;
            });
          }
        }
      } else {
        if (mounted) {
          setState(() {
            _isLoadingLocation = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoadingLocation = false;
        });
      }
      print('Ошибка геокодирования местоположения: $e');
    }
  }

  /// Поделиться объявлением
  void _shareProduct(BuildContext context, AircraftMarketEntity product) {
    final baseUrl = kIsWeb ? 'https://avia-point.com' : 'https://avia-point.com';
    final productUrl = '$baseUrl/market/${product.id}';

    Share.share('${product.title}\n\n$productUrl\n\nСмотрите в AviaPoint');
  }

  Widget _buildLocationMap(String? location) {
    if (location == null || location.isEmpty) {
      return const SizedBox.shrink();
    }

    // Если адрес изменился или координаты еще не загружены, запускаем геокодирование
    // Используем addPostFrameCallback чтобы избежать setState во время build
    if ((_locationCoordinates == null || _lastGeocodedAddress != location) && !_isLoadingLocation) {
      _lastGeocodedAddress = location;
      _locationCoordinates = null; // Сбрасываем координаты для нового адреса
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _lastGeocodedAddress == location) {
          _geocodeLocation(location);
        }
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: _isLoadingLocation || _locationCoordinates == null
                ? Container(
                    color: Colors.grey.shade200,
                    child: const Center(child: CircularProgressIndicator()),
                  )
                : FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(initialCenter: _locationCoordinates ?? const LatLng(55.7558, 37.6173), initialZoom: 15.0, minZoom: 3.0, maxZoom: 18.0),
                    children: [
                      TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', userAgentPackageName: 'com.aviapoint.app', maxZoom: 19),
                      if (_locationCoordinates != null)
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: _locationCoordinates!,
                              width: 40,
                              height: 40,
                              child: Icon(Icons.location_on, color: AppColors.primary100p, size: 40.0),
                            ),
                          ],
                        ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  /// Виджет для отображения изображения (без кеша)
  Widget _buildImageWidget(String imageUrl) {
    if (imageUrl.isEmpty) {
      return Container(
        color: Colors.grey.shade200,
        child: const Center(child: Icon(Icons.image_not_supported)),
      );
    }
    final fullImageUrl = getImageUrl(imageUrl);
    if (fullImageUrl.isEmpty) {
      return Container(
        color: Colors.grey.shade200,
        child: const Center(child: Icon(Icons.image_not_supported)),
      );
    }
    return Image.network(
      fullImageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: Colors.grey.shade200,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
      errorBuilder: (context, error, stackTrace) => Container(
        color: Colors.grey.shade200,
        child: const Center(child: Icon(Icons.image_not_supported)),
      ),
    );
  }

  /// Поделиться фотографией
  Future<void> _sharePhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final imageUrl = getImageUrl(photoUrl);
      await Share.shareUri(Uri.parse(imageUrl));
    } catch (e) {
      if (mounted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Не удалось поделиться фотографией'), backgroundColor: Colors.red, duration: Duration(seconds: 2)));
      }
    }
  }

  /// Скачать фотографию
  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      if (kIsWeb) {
        // Для веб - показываем подсказку
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Правый клик по изображению → "Сохранить как"'), backgroundColor: Colors.blue, duration: Duration(seconds: 3)));
        return;
      }

      final imageUrl = getImageUrl(photoUrl);
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last.split('?').first; // Убираем query параметры
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(imageUrl, filePath);

      // Запрашиваем разрешение на запись (для Android)
      if (await Permission.storage.request().isGranted) {
        final appDocDir = await getApplicationDocumentsDirectory();
        final savedFile = await File(filePath).copy('${appDocDir.path}/$fileName');

        if (mounted) {
          scaffoldMessenger.showSnackBar(SnackBar(content: Text('Фотография сохранена: ${savedFile.path}'), backgroundColor: Colors.green, duration: Duration(seconds: 2)));
        }
      } else {
        if (mounted) {
          scaffoldMessenger.showSnackBar(SnackBar(content: Text('Необходимо разрешение на сохранение файлов'), backgroundColor: Colors.orange, duration: Duration(seconds: 2)));
        }
      }
    } catch (e) {
      if (mounted) {
        scaffoldMessenger.showSnackBar(SnackBar(content: Text('Не удалось скачать фотографию: $e'), backgroundColor: Colors.red, duration: Duration(seconds: 2)));
      }
    }
  }

  /// Полноэкранный просмотр фотографий
  void _showPhotoViewer(BuildContext context, List<String?> photos, int initialIndex) {
    final PageController pageController = PageController(initialPage: initialIndex);
    int currentIndex = initialIndex;
    bool showControls = true;

    showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogBuilderContext, setState) => GestureDetector(
          onTap: () {
            setState(() {
              showControls = !showControls;
            });
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Stack(
              children: [
                // Основной контент с фотографиями
                PageView.builder(
                  controller: pageController,
                  itemCount: photos.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final photoUrl = photos[index];
                    if (photoUrl == null || photoUrl.isEmpty) {
                      return Container(
                        color: Colors.black,
                        child: Center(
                          child: Icon(Icons.broken_image, color: Colors.white70, size: 64.0),
                        ),
                      );
                    }
                    return InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 5.0,
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.network(
                            getImageUrl(photoUrl),
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.black,
                                child: Center(child: CircularProgressIndicator(color: Colors.white)),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) => Container(
                              color: Colors.black,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.broken_image, color: Colors.white70, size: 64.0),
                                    SizedBox(height: 16),
                                    Text('Не удалось загрузить изображение', style: AppStyles.regular14s.copyWith(color: Colors.white70)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                // Верхняя панель с индикатором, кнопками действий и кнопкой закрытия
                if (showControls)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black.withOpacity(0.7), Colors.transparent]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Левая часть: индикатор
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Индикатор текущей фотографии
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    '${currentIndex + 1} / ${photos.length}',
                                    style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            // Правая часть: кнопки действий и кнопка закрытия
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Кнопки действий (если есть фото)
                                if (photos.isNotEmpty && photos[currentIndex] != null && photos[currentIndex]!.isNotEmpty) ...[
                                  // Кнопка "Поделиться"
                                  IconButton(
                                    icon: Icon(Icons.share, color: Colors.white, size: 24.0),
                                    onPressed: () => _sharePhoto(dialogContext, photos[currentIndex]!),
                                    style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                    tooltip: 'Поделиться',
                                  ),
                                  SizedBox(width: 8),
                                  // Кнопка "Скачать"
                                  IconButton(
                                    icon: Icon(Icons.download, color: Colors.white, size: 24.0),
                                    onPressed: () => _downloadPhoto(dialogContext, photos[currentIndex]!),
                                    style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                    tooltip: 'Скачать',
                                  ),
                                  SizedBox(width: 8),
                                ],
                                // Кнопка закрытия
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 24.0),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(backgroundColor: Colors.black.withOpacity(0.5), shape: CircleBorder()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(int productId, BuildContext context, AircraftMarketEntity product) {
    final bloc = context.read<AircraftMarketDetailBloc>();
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: bloc,
        child: AlertDialog(
          title: Text('Удалить товар?', style: AppStyles.bold16s),
          content: Text('Вы уверены, что хотите удалить этот товар? Это действие нельзя отменить.', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text('Отмена', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                bloc.add(DeleteAircraftMarketDetailEvent(productId));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Удалить', style: AppStyles.bold14s.copyWith(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _publishProduct(BuildContext context, int productId) async {
    final repository = getIt<MarketRepository>();
    final result = await repository.publishProduct(productId);
    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.message ?? 'Ошибка публикации', style: AppStyles.regular14s.copyWith(color: Colors.white)),
            backgroundColor: Colors.red,
          ),
        );
      },
      (product) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Объявление опубликовано на 1 месяц', style: AppStyles.regular14s.copyWith(color: Colors.white)),
            backgroundColor: Colors.green,
          ),
        );
        if (!mounted) return;
        // Обновляем список объявлений
        context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.refresh());
        // Возвращаемся назад
        context.router.maybePop();
      },
    );
  }

  void _showUnpublishConfirmation(int productId, BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Снять с публикации?'),
        content: const Text('Объявление станет неактивным и не будет видно другим пользователям.'),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Отмена')),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _unpublishProduct(context, productId);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Снять'),
          ),
        ],
      ),
    );
  }

  Future<void> _unpublishProduct(BuildContext context, int productId) async {
    final repository = getIt<MarketRepository>();
    final result = await repository.unpublishProduct(productId);
    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.message ?? 'Ошибка снятия публикации', style: AppStyles.regular14s.copyWith(color: Colors.white)),
            backgroundColor: Colors.red,
          ),
        );
      },
      (product) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Объявление снято с публикации', style: AppStyles.regular14s.copyWith(color: Colors.white)),
            backgroundColor: Colors.green,
          ),
        );
        if (!mounted) return;
        // Обновляем список объявлений
        context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.refresh());
        // Возвращаемся назад
        context.router.maybePop();
      },
    );
  }

  bool _isCurrentUserOwner(int? sellerId, BuildContext context) {
    return PermissionHelper.isOwnerOrAdmin(sellerId, context);
  }

  String _formatPrice(int price) {
    return formatPrice(price);
  }

  int? _getRemainingDays(DateTime? publishedUntil) {
    if (publishedUntil == null) return null;
    final diff = publishedUntil.difference(DateTime.now());
    final days = diff.inDays;
    return days < 0 ? 0 : days;
  }

  String _formatCondition(String? condition) {
    if (condition == null) return '';
    switch (condition.toLowerCase()) {
      case 'new':
        return 'Новый';
      case 'used':
        return 'Б/у';
      case 'restored':
        return 'Восстановленный';
      case 'parts':
        return 'На запчасти';
      default:
        return condition;
    }
  }

  Future<void> _showPriceHistoryModal(BuildContext context, int productId) async {
    final repository = getIt<MarketRepository>();
    final priceHistoryResult = await repository.getPriceHistory(productId);

    priceHistoryResult.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка загрузки истории цен: ${failure.message}', style: AppStyles.regular14s.copyWith(color: Colors.white)),
            backgroundColor: Colors.red,
          ),
        );
      },
      (priceHistory) async {
        if (priceHistory.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('История цен пуста', style: AppStyles.regular14s.copyWith(color: Colors.white)),
              backgroundColor: Colors.orange,
            ),
          );
          return;
        }

        await showUniversalBottomSheet<void>(
          context: context,
          title: 'История цены',
          height: MediaQuery.of(context).size.height * 0.9,
          backgroundColor: AppColors.background,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: priceHistory.length,
            itemBuilder: (context, index) {
              // Инвертируем индекс для отображения от новой к старой
              final reversedIndex = priceHistory.length - 1 - index;
              final historyItem = priceHistory[reversedIndex];
              final isFirst = reversedIndex == priceHistory.length - 1; // Самая старая запись - это первая (публикация)
              // Сравниваем с предыдущей записью (более новой)
              final previousPrice = reversedIndex > 0 ? priceHistory[reversedIndex - 1].price : null;
              final priceChange = previousPrice != null ? previousPrice - historyItem.price : null;

              return Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFE5E7EB)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(formatDate(historyItem.createdAt), style: AppStyles.regular14s.copyWith(color: Color(0xFF374151))),
                          if (isFirst) ...[SizedBox(height: 4), Text('Публикация', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF)))],
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('${formatPrice(historyItem.price)} ₽', style: AppStyles.bold16s.copyWith(color: Color(0xFF374151))),
                        if (priceChange != null && priceChange != 0) ...[
                          SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(priceChange > 0 ? Icons.arrow_upward : Icons.arrow_downward, size: 14.0, color: priceChange > 0 ? Colors.red : Colors.green),
                              SizedBox(width: 4),
                              Text('${formatPrice(priceChange.abs())} ₽', style: AppStyles.regular12s.copyWith(color: priceChange > 0 ? Colors.red : Colors.green)),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AircraftMarketDetailBloc(repository: getIt<MarketRepository>())..add(GetAircraftMarketDetailEvent(widget.id)),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AircraftMarketDetailBloc, AircraftMarketDetailState>(
            listener: (context, state) {
              state.maybeWhen(
                deleted: () {
                  // Обновляем список товаров
                  context.read<AircraftMarketBloc>().add(const AircraftMarketEvent.refresh());
                  // Возвращаемся назад
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Товар успешно удален'), backgroundColor: Colors.green));
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<ProfileBloc, ProfileState>(
            listenWhen: (previous, current) {
              // Слушаем только успешное обновление профиля (когда был LoadingProfileState, а теперь SuccessProfileState)
              if (previous is LoadingProfileState && current is SuccessProfileState) {
                return true;
              }
              return false;
            },
            listener: (context, profileState) {
              // Когда профиль успешно обновлен, обновляем данные объявления
              // Данные продавца берутся из профиля при запросе, поэтому обновим объявление
              if (!mounted) return;

              final detailBloc = context.read<AircraftMarketDetailBloc>();
              final detailState = detailBloc.state;

              detailState.maybeWhen(
                success: (product) {
                  // Обновляем детали объявления, чтобы получить актуальные данные продавца
                  detailBloc.add(AircraftMarketDetailEvent.getProduct(product.id));
                },
                orElse: () {},
              );
            },
          ),
          // Слушаем обновление товара в глобальном BLoC для обновления детальной страницы
          BlocListener<AircraftMarketBloc, AircraftMarketState>(
            listenWhen: (previous, current) {
              // Реагируем на updated после updating в глобальном BLoC
              if (previous is UpdatingMarketProductState) {
                return current is UpdatedMarketProductState;
              }
              return false;
            },
            listener: (context, state) {
              if (!mounted) return;

              state.maybeWhen(
                updated: (updatedProduct) {
                  // Проверяем, обновлен ли текущий товар
                  final detailBloc = context.read<AircraftMarketDetailBloc>();
                  final detailState = detailBloc.state;

                  detailState.maybeWhen(
                    success: (currentProduct) {
                      // Если ID совпадает, обновляем детальную страницу
                      if (currentProduct.id == updatedProduct.id) {
                        detailBloc.add(AircraftMarketDetailEvent.getProduct(updatedProduct.id));
                      }
                    },
                    orElse: () {},
                  );
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: BlocBuilder<AircraftMarketDetailBloc, AircraftMarketDetailState>(
          builder: (context, state) {
            return PopScope(
              onPopInvoked: (didPop) {
                if (didPop) {
                  // При возврате назад всегда обновляем список товаров
                  final marketBloc = context.read<AircraftMarketBloc>();
                  marketBloc.add(const AircraftMarketEvent.refresh());
                }
              },
              child: Scaffold(
                appBar: CustomAppBar(
                  title: 'АвиаТехника',
                  withBack: true,
                  actions: [
                    BlocBuilder<AircraftMarketDetailBloc, AircraftMarketDetailState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          success: (product) {
                            final isOwner = _isCurrentUserOwner(product.sellerId, context);

                            // Кнопка "Поделиться" всегда видна
                            final shareButton = IconButton(
                              icon: const Icon(Icons.share, color: AppColors.primary100p),
                              onPressed: () => _shareProduct(context, product),
                              tooltip: 'Поделиться',
                            );

                            // Кнопки редактирования и удаления только для владельца
                            if (!isOwner) {
                              return shareButton;
                            }

                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                shareButton,
                                IconButton(
                                  icon: const Icon(Icons.edit, color: AppColors.primary100p),
                                  onPressed: () async {
                                    await context.router.push(EditAircraftMarketRoute(product: product));

                                    // После возврата из редактирования обновляем данные с сервера
                                    if (mounted) {
                                      context.read<AircraftMarketDetailBloc>().add(AircraftMarketDetailEvent.getProduct(product.id));
                                    }
                                  },
                                  tooltip: 'Редактировать товар',
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                  onPressed: () => _showDeleteConfirmation(product.id, context, product),
                                  tooltip: 'Удалить товар',
                                ),
                              ],
                            );
                          },
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),
                  ],
                ),
                backgroundColor: AppColors.background,
                body: state.when(
                  initial: () => const Center(child: LoadingCustom()),
                  loading: () => const Center(child: LoadingCustom()),
                  error: (message) => Center(
                    child: ErrorCustom(textError: message, repeat: () => context.read<AircraftMarketDetailBloc>().add(GetAircraftMarketDetailEvent(widget.id))),
                  ),
                  success: (product) => _buildProductContent(product),
                  deleted: () => const SizedBox.shrink(), // Не показываем контент, т.к. уже переходим назад
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductContent(AircraftMarketEntity product) {
    final isOwner = _isCurrentUserOwner(product.sellerId, context);
    final remainingDays = _getRemainingDays(product.publishedUntil);
    // Основная фотография
    final mainImage = product.mainImageUrl != null && product.mainImageUrl!.isNotEmpty ? product.mainImageUrl : null;

    // Дополнительные фотографии (простая фильтрация)
    final additionalImages = product.additionalImageUrls.where((url) => url.isNotEmpty).toList();

    final allImages = [if (mainImage != null) mainImage, ...additionalImages];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Основная фотография
          if (mainImage != null) ...[
            GestureDetector(
              onTap: () => _showPhotoViewer(context, allImages, 0),
              child: Stack(
                children: [
                  SizedBox(height: 300, width: double.infinity, child: _buildImageWidget(mainImage)),
                  // Чипсы: доля и лизинг
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (product.isShareSale == true && product.shareNumerator != null && product.shareDenominator != null)
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              'Доля ${product.shareNumerator}/${product.shareDenominator}',
                              style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                        if (product.isLeasing == true)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              'Лизинг',
                              style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ] else
            Container(
              height: 300,
              color: Colors.grey.shade200,
              child: Center(child: Icon(Icons.image, size: 64.0)),
            ),

          // Дополнительные фотографии в горизонтальном списке
          if (additionalImages.isNotEmpty) ...[
            SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: additionalImages.length,
                itemBuilder: (context, index) {
                  final photoUrl = additionalImages[index];
                  return GestureDetector(
                    onTap: () {
                      // Вычисляем индекс в общем списке (основная фотография + дополнительные)
                      final startIndex = mainImage != null ? 1 : 0;
                      _showPhotoViewer(context, allImages, startIndex + index);
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFE5E7EB), width: 1),
                      ),
                      child: ClipRRect(borderRadius: BorderRadius.circular(12), child: _buildImageWidget(photoUrl)),
                    ),
                  );
                },
              ),
            ),
          ],

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Заголовок и цена
                Text(product.title, style: AppStyles.bold20s),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '${_formatPrice(product.price)} ₽',
                      style: AppStyles.bold20s.copyWith(color: AppColors.primary100p, fontSize: 24.0),
                    ),
                    SizedBox(width: 12),
                    TextButton.icon(
                      onPressed: () => _showPriceHistoryModal(context, product.id),
                      icon: Icon(Icons.history, size: 18, color: Color(0xFF0A6EFA)),
                      label: Text('История цены', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                      style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Описание
                if (product.description != null && product.description!.isNotEmpty) ...[
                  Text('Описание', style: AppStyles.bold16s),
                  SizedBox(height: 8),
                  Text(product.description!, style: AppStyles.regular14s),
                  SizedBox(height: 24),
                ],

                // Особые условия
                if ((product.isShareSale == true && product.shareNumerator != null && product.shareDenominator != null) || product.isLeasing == true) ...[
                  Text('Особые условия', style: AppStyles.bold16s),
                  SizedBox(height: 12),
                  if (product.isShareSale == true && product.shareNumerator != null && product.shareDenominator != null)
                    Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: AppColors.primary100p.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.primary100p.withOpacity(0.3)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.pie_chart, color: AppColors.primary100p, size: 20),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Продажа доли', style: AppStyles.bold14s.copyWith(color: AppColors.primary100p)),
                                SizedBox(height: 4),
                                Text('Доля ${product.shareNumerator}/${product.shareDenominator}', style: AppStyles.regular14s),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (product.isLeasing == true)
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary100p.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.primary100p.withOpacity(0.3)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.account_balance, color: AppColors.primary100p, size: 20),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Лизинг', style: AppStyles.bold14s.copyWith(color: AppColors.primary100p)),
                                SizedBox(height: 4),
                                Text(
                                  product.leasingConditions != null && product.leasingConditions!.isNotEmpty ? product.leasingConditions! : 'Самолёт доступен для покупки в лизинг',
                                  style: AppStyles.regular14s,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 24),
                ],

                // Характеристики
                Text('Характеристики', style: AppStyles.bold16s),
                SizedBox(height: 12),
                // Категория (берём из MarketCategoriesBloc)
                Builder(
                  builder: (context) {
                    final categoriesState = context.watch<MarketCategoriesBloc>().state;
                    String? categoryName;
                    categoriesState.maybeWhen(
                      success: (List<MarketCategoryEntity> categories) {
                        if (product.aircraftSubcategoriesId != null) {
                          final category = categories.firstWhere(
                            (c) => c.id == product.aircraftSubcategoriesId,
                            orElse: () => MarketCategoryEntity(id: -1, name: '', productType: 'aircraft'),
                          );
                          if (category.id != -1) {
                            categoryName = category.name.replaceAll('самолёты', '').replaceAll('самолёт', '').replaceAll('Самолёт', '').trim();
                          }
                        }
                      },
                      orElse: () {},
                    );

                    return _buildInfoRow('Категория', categoryName);
                  },
                ),
                _buildInfoRow('Модель', product.brand),
                _buildInfoRow('Год выпуска', product.year?.toString()),
                _buildInfoRow('Общий налёт часов', product.totalFlightHours?.toString()),
                _buildInfoRow('Мощность двигателя', product.enginePower != null ? '${product.enginePower} л.с.' : null),
                _buildInfoRow('Объём двигателя', product.engineVolume != null ? '${product.engineVolume} л' : null),
                _buildInfoRow('Количество мест', product.seats?.toString()),
                _buildInfoRow('Состояние', _formatCondition(product.condition)),
                _buildInfoRow('Местоположение', product.location),
                if (product.location != null && product.location!.isNotEmpty) _buildLocationMap(product.location),
                SizedBox(height: 24),

                // Информация о продавце
                Text('Продавец', style: AppStyles.bold16s),
                SizedBox(height: 12),
                if (product.sellerFullName != null) _buildInfoRow('Имя', product.sellerFullName),
                if (product.sellerPhone != null)
                  _buildContactRow('Телефон', formatPhone(product.sellerPhone!), Icons.phone, () async {
                    final uri = Uri.parse('tel:${product.sellerPhone}');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  }),
                if (product.sellerTelegram != null)
                  _buildContactRow('Telegram', product.sellerTelegram!, Icons.send, () async {
                    final uri = Uri.parse('https://t.me/${product.sellerTelegram!.replaceAll('@', '')}');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  }),
                if (product.sellerMax != null)
                  _buildContactRow('MAX', product.sellerMax!, Icons.message, () async {
                    final uri = Uri.parse('https://max.me/${product.sellerMax!.replaceAll('@', '')}');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  }),
                SizedBox(height: 24),

                // Метаданные
                Text('Информация', style: AppStyles.bold16s),
                SizedBox(height: 12),
                _buildInfoRow('Просмотры', product.viewsCount.toString()),
                _buildInfoRow('Дата публикации', formatDate(product.createdAt)),
                if (product.updatedAt != null && product.updatedAt != product.createdAt) _buildInfoRow('Дата обновления', formatDate(product.updatedAt)),
                if (isOwner) _buildInfoRow('Опубликовано до', formatDate(product.publishedUntil)),
                if (isOwner && remainingDays != null) _buildInfoRow('Осталось дней', remainingDays.toString()),
                _buildInfoRow('ID объявления', product.id.toString()),
                SizedBox(height: 24),
                if (isOwner) ...[
                  SizedBox(height: 8),
                  // Кнопка "Редактировать"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await context.router.push(EditAircraftMarketRoute(product: product));
                        // После возврата из редактирования обновляем данные с сервера
                        if (mounted) {
                          context.read<AircraftMarketDetailBloc>().add(AircraftMarketDetailEvent.getProduct(product.id));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary100p,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('Редактировать', style: AppStyles.bold16s.copyWith(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 12),
                  // Кнопка "Снять с публикации" / "Опубликовать"
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (product.isActive) {
                          _showUnpublishConfirmation(product.id, context);
                        } else {
                          _publishProduct(context, product.id);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: product.isActive ? Colors.red : AppColors.primary100p,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(product.isActive ? 'Снять с публикации' : 'Опубликовать', style: AppStyles.bold16s.copyWith(color: Colors.white)),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(label, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
          ),
          Expanded(child: Text(value, style: AppStyles.regular14s)),
        ],
      ),
    );
  }

  Widget _buildContactRow(String label, String value, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(label, style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
          ),
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Icon(icon, size: 16, color: AppColors.primary100p),
                  SizedBox(width: 8),
                  Text(value, style: AppStyles.regular14s.copyWith(color: AppColors.primary100p)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
