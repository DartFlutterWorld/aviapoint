import 'package:auto_route/auto_route.dart';
import 'package:aviapoint/core/presentation/widgets/custom_app_bar.dart';
import 'package:aviapoint/core/presentation/widgets/error_custom.dart';
import 'package:aviapoint/core/presentation/widgets/loading_custom.dart';
import 'package:aviapoint/core/themes/app_colors.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/app.dart';
import 'package:aviapoint/core/utils/const/helper.dart';
import 'package:aviapoint/core/utils/permission_helper.dart';
import 'package:aviapoint/core/presentation/widgets/universal_bottom_sheet.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/market/domain/entities/parts_market_entity.dart';
import 'package:aviapoint/market/domain/repositories/market_repository.dart';
import 'package:aviapoint/market/presentation/bloc/parts_market_bloc.dart';
import 'package:aviapoint/market/presentation/bloc/parts_market_edit_bloc.dart';
import 'package:aviapoint/core/routes/app_router.dart';
import 'package:aviapoint/core/data/datasources/api_datasource.dart';
import 'package:aviapoint/core/data/datasources/api_datasource_dio.dart';
import 'package:aviapoint/on_the_way/data/datasources/on_the_way_service.dart';
import 'package:aviapoint/on_the_way/data/models/aircraft_model_dto.dart';
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
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';

@RoutePage()
class PartsMarketDetailScreen extends StatefulWidget {
  final int id;

  const PartsMarketDetailScreen({super.key, @PathParam('id') required this.id});

  @override
  State<PartsMarketDetailScreen> createState() => _PartsMarketDetailScreenState();
}

class _PartsMarketDetailScreenState extends State<PartsMarketDetailScreen> {
  final MapController _mapController = MapController();
  final Dio _dio = Dio(
    BaseOptions(
      headers: {'User-Agent': 'AviaPoint App (Flutter)'},
      validateStatus: (status) => status != null && status < 500,
    ),
  );
  LatLng? _locationCoordinates;
  bool _isLoadingLocation = false;
  String? _lastGeocodedAddress;

  PartsMarketEntity? _part;
  bool _isLoading = true;
  String? _errorMessage;
  List<AircraftModelDto> _compatibleModels = [];
  bool _isLoadingModels = false;
  late PartsMarketEditBloc _editBloc;

  @override
  void initState() {
    super.initState();
    _editBloc = PartsMarketEditBloc(repository: getIt<MarketRepository>());
    _loadPart();
  }

  @override
  void dispose() {
    _dio.close();
    _editBloc.close();
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

  Future<void> _loadPart() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final repository = getIt<MarketRepository>();
    final result = await repository.getPartById(widget.id);

    if (!mounted) return;

    result.fold(
      (failure) {
        setState(() {
          _isLoading = false;
          _errorMessage = failure.message ?? 'Ошибка загрузки запчасти';
        });
      },
      (part) {
        setState(() {
          _isLoading = false;
          _part = part;
        });
        if (part.compatibleAircraftModelIds != null && part.compatibleAircraftModelIds!.isNotEmpty) {
          _loadCompatibleModels(part.compatibleAircraftModelIds!);
        }
      },
    );
  }

  Future<void> _loadCompatibleModels(List<int> modelIds) async {
    if (modelIds.isEmpty) return;

    setState(() {
      _isLoadingModels = true;
    });

    try {
      final apiDatasource = getIt<ApiDatasource>() as ApiDatasourceDio;
      final service = OnTheWayService(apiDatasource.dio);
      final allModels = await service.getAircraftModels();

      final loadedModels = allModels.where((model) => modelIds.contains(model.id)).toList();

      if (mounted) {
        setState(() {
          _compatibleModels = loadedModels;
          _isLoadingModels = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading compatible models: $e');
      if (mounted) {
        setState(() {
          _isLoadingModels = false;
        });
      }
    }
  }

  String _getConditionText(String? condition) {
    switch (condition) {
      case 'new':
        return 'Новое';
      case 'used':
        return 'Б/у';
      case 'restored':
        return 'Восстановленное';
      default:
        return condition ?? '';
    }
  }

  void _sharePart(BuildContext context, PartsMarketEntity part) {
    final baseUrl = kIsWeb ? 'https://avia-point.com' : 'https://avia-point.com';
    final partUrl = '$baseUrl/market/parts/${part.id}';

    final buffer = StringBuffer();
    buffer.writeln('🔧 ${part.title}');
    buffer.writeln('');

    if (part.description != null && part.description!.isNotEmpty) {
      final description = part.description!.length > 200
          ? '${part.description!.substring(0, 200)}...'
          : part.description!;
      buffer.writeln(description);
      buffer.writeln('');
    }

    buffer.writeln('💰 Цена: ${formatPrice(part.price)} ${getCurrencySymbol(part.currency)}');

    if (part.partNumber != null && part.partNumber!.isNotEmpty) {
      buffer.writeln('📦 Артикул: ${part.partNumber}');
    }

    if (part.oemNumber != null && part.oemNumber!.isNotEmpty) {
      buffer.writeln('🏷️ OEM: ${part.oemNumber}');
    }

    if (part.condition != null) {
      buffer.writeln('✅ Состояние: ${_getConditionText(part.condition)}');
    }

    if (part.quantity > 1) {
      buffer.writeln('📊 Количество: ${part.quantity}');
    }

    if (part.location != null && part.location!.isNotEmpty) {
      buffer.writeln('📍 Местоположение: ${part.location}');
    }

    buffer.writeln('');
    buffer.writeln('🔗 $partUrl');
    buffer.writeln('');
    buffer.writeln('Смотрите подробности в AviaPoint');

    final shareText = buffer.toString();

    if (part.mainImageUrl != null && part.mainImageUrl!.isNotEmpty) {
      _sharePartWithImage(context, part.mainImageUrl!, shareText);
    } else {
      Share.share(shareText);
    }
  }

  Future<void> _sharePartWithImage(BuildContext context, String imageUrl, String text) async {
    try {
      if (kIsWeb) {
        final fullImageUrl = getImageUrl(imageUrl);
        Share.share('$text\n\n🖼️ Фото: $fullImageUrl');
        return;
      }

      final scaffoldMessenger = ScaffoldMessenger.of(context);

      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Row(
            children: [
              CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              SizedBox(width: 16),
              Text('Подготовка к отправке...'),
            ],
          ),
          duration: Duration(seconds: 10),
        ),
      );

      final fullImageUrl = getImageUrl(imageUrl);
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = imageUrl.split('/').last.split('?').first;
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(fullImageUrl, filePath);

      if (context.mounted) {
        scaffoldMessenger.hideCurrentSnackBar();
        await Share.shareXFiles([XFile(filePath)], text: text);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Не удалось поделиться с изображением: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
        Share.share(text);
      }
    }
  }

  Widget _buildLocationMap(String? location) {
    if (location == null || location.isEmpty) {
      return const SizedBox.shrink();
    }

    if ((_locationCoordinates == null || _lastGeocodedAddress != location) && !_isLoadingLocation) {
      _lastGeocodedAddress = location;
      _locationCoordinates = null;
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
                    options: MapOptions(
                      initialCenter: _locationCoordinates ?? const LatLng(55.7558, 37.6173),
                      initialZoom: 15.0,
                      minZoom: 3.0,
                      maxZoom: 18.0,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.aviapoint.app',
                        maxZoom: 19,
                      ),
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

  Future<void> _sharePhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      final imageUrl = getImageUrl(photoUrl);
      await Share.shareUri(Uri.parse(imageUrl));
    } catch (e) {
      if (mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось поделиться фотографией'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Future<void> _downloadPhoto(BuildContext context, String photoUrl) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      if (kIsWeb) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Правый клик по изображению → "Сохранить как"'),
            backgroundColor: Colors.blue,
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      final imageUrl = getImageUrl(photoUrl);
      final dio = Dio();
      final tempDir = await getTemporaryDirectory();
      final fileName = photoUrl.split('/').last.split('?').first;
      final filePath = '${tempDir.path}/$fileName';

      await dio.download(imageUrl, filePath);

      if (await Permission.storage.request().isGranted) {
        final appDocDir = await getApplicationDocumentsDirectory();
        final savedFile = await File(filePath).copy('${appDocDir.path}/$fileName');

        if (mounted) {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text('Фотография сохранена: ${savedFile.path}'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        if (mounted) {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text('Необходимо разрешение на сохранение файлов'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Не удалось скачать фотографию: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

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
                        child: Center(child: Icon(Icons.broken_image, color: Colors.white70, size: 64.0)),
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
                                    Text(
                                      'Не удалось загрузить изображение',
                                      style: AppStyles.regular14s.copyWith(color: Colors.white70),
                                    ),
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
                if (showControls)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${currentIndex + 1} / ${photos.length}',
                                style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (photos.isNotEmpty &&
                                    photos[currentIndex] != null &&
                                    photos[currentIndex]!.isNotEmpty) ...[
                                  IconButton(
                                    icon: Icon(Icons.share, color: Colors.white, size: 24.0),
                                    onPressed: () => _sharePhoto(dialogContext, photos[currentIndex]!),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.black.withOpacity(0.5),
                                      shape: CircleBorder(),
                                    ),
                                    tooltip: 'Поделиться',
                                  ),
                                  SizedBox(width: 8),
                                  IconButton(
                                    icon: Icon(Icons.download, color: Colors.white, size: 24.0),
                                    onPressed: () => _downloadPhoto(dialogContext, photos[currentIndex]!),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.black.withOpacity(0.5),
                                      shape: CircleBorder(),
                                    ),
                                    tooltip: 'Скачать',
                                  ),
                                  SizedBox(width: 8),
                                ],
                                IconButton(
                                  icon: Icon(Icons.close, color: Colors.white, size: 24.0),
                                  onPressed: () => Navigator.of(dialogContext).pop(),
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.black.withOpacity(0.5),
                                    shape: CircleBorder(),
                                  ),
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

  void _showDeleteConfirmation(int partId, BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: _editBloc,
        child: AlertDialog(
          title: Text('Удалить запчасть?', style: AppStyles.bold16s),
          content: Text(
            'Вы уверены, что хотите удалить это объявление? Это действие нельзя отменить.',
            style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text('Отмена', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _editBloc.add(PartsMarketEditEvent.deleteProduct(partId));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text('Удалить', style: AppStyles.bold14s.copyWith(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  void _publishPart(BuildContext context, int partId) {
    _editBloc.add(PartsMarketEditEvent.publishProduct(partId));
  }

  void _unpublishPart(BuildContext context, int partId) {
    _editBloc.add(PartsMarketEditEvent.unpublishProduct(partId));
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

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: CustomAppBar(title: 'Запчасть', withBack: true),
        body: LoadingCustom(),
      );
    }

    if (_errorMessage != null) {
      return Scaffold(
        appBar: CustomAppBar(title: 'Запчасть', withBack: true),
        body: Center(
          child: ErrorCustom(textError: _errorMessage!, repeat: _loadPart),
        ),
      );
    }

    if (_part == null) {
      return Scaffold(
        appBar: CustomAppBar(title: 'Запчасть', withBack: true),
        body: Center(child: Text('Запчасть не найдена', style: AppStyles.regular14s)),
      );
    }

    final isOwner = _isCurrentUserOwner(_part!.sellerId, context);
    final remainingDays = _getRemainingDays(_part!.publishedUntil);
    final mainImage = _part!.mainImageUrl != null && _part!.mainImageUrl!.isNotEmpty ? _part!.mainImageUrl : null;
    final additionalImages = _part!.additionalImageUrls.where((url) => url.isNotEmpty).toList();
    final allImages = [if (mainImage != null) mainImage, ...additionalImages];

    return MultiBlocProvider(
      providers: [BlocProvider.value(value: _editBloc)],
      child: MultiBlocListener(
        listeners: [
          BlocListener<PartsMarketEditBloc, PartsMarketEditState>(
            listener: (context, state) {
              if (!mounted) return;
              state.maybeWhen(
                deleted: (productId) {
                  if (productId == widget.id) {
                    // Обновляем список товаров
                    context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
                    // Возвращаемся назад
                    context.router.maybePop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Товар успешно удален'), backgroundColor: Colors.green),
                    );
                  }
                },
                published: (product) {
                  if (product.id == widget.id) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Объявление опубликовано'), backgroundColor: Colors.green),
                    );
                    // Обновляем список объявлений
                    context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
                    // Загружаем продукт снова
                    _loadPart();
                  }
                },
                unpublished: (product) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Объявление снято с публикации'), backgroundColor: Colors.green),
                  );
                  // Обновляем список объявлений
                  context.read<PartsMarketBloc>().add(const PartsMarketEvent.refresh());
                  // Загружаем продукт снова
                  _loadPart();
                },
                error: (message) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(message), backgroundColor: Colors.red));
                },
                orElse: () {},
              );
            },
          ),
          BlocListener<PartsMarketBloc, PartsMarketState>(
            listenWhen: (previous, current) {
              return current is ErrorPartsMarketState ||
                  current is UpdatedPartsMarketState ||
                  (previous is SuccessPartsMarketState &&
                      current is SuccessPartsMarketState &&
                      previous.parts.length != current.parts.length);
            },
            listener: (context, state) {
              state.when(
                loading: () {},
                loadingMore: (parts) {},
                error: (errorFromApi, errorForUser, statusCode, stackTrace, responseMessage) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(errorForUser), backgroundColor: Colors.red));
                },
                success: (parts, hasMore) {
                  final wasDeleted = !parts.any((p) => p.id == widget.id);
                  if (wasDeleted && mounted) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('Запчасть удалена'), backgroundColor: Colors.green));
                    Navigator.pop(context);
                    return;
                  }
                  _loadPart();
                },
                creatingPart: () {},
                createdPart: (part) {},
                updating: () {},
                updated: (part) {
                  _loadPart();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Изменения сохранены'), backgroundColor: Colors.green));
                },
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Запчасть',
            withBack: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.share, color: AppColors.primary100p),
                onPressed: () => _sharePart(context, _part!),
                tooltip: 'Поделиться',
              ),
              if (isOwner) ...[
                IconButton(
                  icon: const Icon(Icons.edit, color: AppColors.primary100p),
                  onPressed: () async {
                    await context.router.push(EditPartsMarketRoute(productId: _part!.id));
                    if (mounted) {
                      _loadPart();
                    }
                  },
                  tooltip: 'Редактировать',
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _showDeleteConfirmation(_part!.id, context),
                  tooltip: 'Удалить',
                ),
              ],
            ],
          ),
          backgroundColor: AppColors.background,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (mainImage != null) ...[
                  GestureDetector(
                    onTap: () => _showPhotoViewer(context, allImages, 0),
                    child: Stack(
                      children: [
                        SizedBox(height: 300, width: double.infinity, child: _buildImageWidget(mainImage)),
                        // Чип состояния
                        if (_part!.condition != null && _part!.condition!.isNotEmpty)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                _getConditionText(_part!.condition),
                                style: AppStyles.regular14s.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                              ),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: _buildImageWidget(photoUrl),
                            ),
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
                      Text(_part!.title, style: AppStyles.bold20s),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '${_formatPrice(_part!.price)} ${getCurrencySymbol(_part!.currency)}',
                            style: AppStyles.bold20s.copyWith(color: AppColors.primary100p, fontSize: 24.0),
                          ),
                          SizedBox(width: 12),
                          TextButton.icon(
                            onPressed: () => _showPriceHistoryModal(context, _part!.id),
                            icon: Icon(Icons.history, size: 18, color: Color(0xFF0A6EFA)),
                            label: Text('История цены', style: AppStyles.bold16s.copyWith(color: Color(0xFF0A6EFA))),
                            style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),

                      if (_part!.description != null && _part!.description!.isNotEmpty) ...[
                        Text('Описание', style: AppStyles.bold16s),
                        SizedBox(height: 8),
                        Text(_part!.description!, style: AppStyles.regular14s),
                        SizedBox(height: 24),
                      ],

                      Text('Характеристики', style: AppStyles.bold16s),
                      SizedBox(height: 12),
                      _buildInfoRow('Артикул', _part!.partNumber),
                      _buildInfoRow('OEM номер', _part!.oemNumber),
                      _buildInfoRow('Состояние', _part!.condition != null ? _getConditionText(_part!.condition) : null),
                      _buildInfoRow('Количество', _part!.quantity > 1 ? _part!.quantity.toString() : null),
                      _buildInfoRow('Вес', _part!.weightKg != null ? '${_part!.weightKg} кг' : null),
                      if (_part!.dimensionsLengthCm != null ||
                          _part!.dimensionsWidthCm != null ||
                          _part!.dimensionsHeightCm != null)
                        _buildInfoRow(
                          'Габариты',
                          '${_part!.dimensionsLengthCm ?? '-'} × ${_part!.dimensionsWidthCm ?? '-'} × ${_part!.dimensionsHeightCm ?? '-'} см',
                        ),
                      _buildCompatibleAircraftModelsSection(),
                      _buildInfoRow('Категория', _part!.subcategoryName ?? _part!.mainCategoryName),
                      _buildInfoRow('Производитель', _part!.manufacturerNameDisplay ?? _part!.manufacturerName),
                      _buildInfoRow('Местоположение', _part!.location),
                      if (_part!.location != null && _part!.location!.isNotEmpty) _buildLocationMap(_part!.location),
                      SizedBox(height: 24),

                      Text('Продавец', style: AppStyles.bold16s),
                      SizedBox(height: 12),
                      if (_part!.sellerFullName != null) _buildInfoRow('Имя', _part!.sellerFullName),
                      if (_part!.sellerPhone != null || _part!.sellerTelegram != null || _part!.sellerMax != null) ...[
                        SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: [
                            if (_part!.sellerPhone != null && _part!.sellerPhone!.isNotEmpty)
                              _buildContactButton(
                                context: context,
                                icon: Icons.phone,
                                label: formatPhone(_part!.sellerPhone!),
                                color: Color(0xFF10B981),
                                onTap: () => _launchPhone(context, _part!.sellerPhone!),
                              ),
                            if (_part!.sellerTelegram != null && _part!.sellerTelegram!.isNotEmpty)
                              _buildContactButton(
                                context: context,
                                iconAsset: Pictures.telegramm,
                                label: _part!.sellerTelegram!,
                                color: Color(0xFF0088CC),
                                onTap: () => _launchTelegram(context, _part!.sellerTelegram!),
                              ),
                            if (_part!.sellerMax != null && _part!.sellerMax!.isNotEmpty)
                              _buildContactButton(
                                context: context,
                                iconAsset: Pictures.max,
                                label: _part!.sellerMax!,
                                color: Color(0xFF9CA5AF),
                                onTap: () => _launchMax(context, _part!.sellerMax!),
                              ),
                          ],
                        ),
                      ],
                      SizedBox(height: 24),

                      Text('Информация', style: AppStyles.bold16s),
                      SizedBox(height: 12),
                      _buildInfoRow('Просмотры', _part!.viewsCount.toString()),
                      _buildInfoRow('Дата публикации', formatDate(_part!.createdAt)),
                      if (_part!.updatedAt != null && _part!.updatedAt != _part!.createdAt)
                        _buildInfoRow('Дата обновления', formatDate(_part!.updatedAt)),
                      if (isOwner) _buildInfoRow('Опубликовано до', formatDate(_part!.publishedUntil)),
                      if (isOwner && remainingDays != null) _buildInfoRow('Осталось дней', remainingDays.toString()),
                      _buildInfoRow('ID объявления', _part!.id.toString()),
                      SizedBox(height: 24),

                      if (isOwner) ...[
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              await context.router.push(EditPartsMarketRoute(productId: _part!.id));
                              if (mounted) {
                                _loadPart();
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
                        BlocBuilder<PartsMarketEditBloc, PartsMarketEditState>(
                          builder: (context, state) {
                            final currentProduct = state.maybeWhen(
                              loaded: (product) => product,
                              saved: (product) => product,
                              published: (product) => product,
                              unpublished: (product) => product,
                              orElse: () => _part,
                            );
                            final isPublished = currentProduct?.isPublished ?? _part!.isPublished;
                            final isLoading = state.maybeWhen(
                              publishing: () => true,
                              unpublishing: () => true,
                              orElse: () => false,
                            );
                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: isLoading
                                    ? null
                                    : () {
                                        if (isPublished) {
                                          _unpublishPart(context, _part!.id);
                                        } else {
                                          _publishPart(context, _part!.id);
                                        }
                                      },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: isPublished ? Colors.red : AppColors.primary100p,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                ),
                                child: isLoading
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                      )
                                    : Text(
                                        isPublished ? 'Снять с публикации' : 'Опубликовать',
                                        style: AppStyles.bold16s.copyWith(color: Colors.white),
                                      ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 16),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
            child: Text(label, style: AppStyles.regular12s.copyWith(color: AppColors.textSecondary)),
          ),
          Expanded(child: Text(value, style: AppStyles.regular12s)),
        ],
      ),
    );
  }

  /// Виджет кнопки контакта продавца
  Widget _buildContactButton({
    required BuildContext context,
    IconData? icon,
    String? iconAsset,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconAsset != null)
              (iconAsset == Pictures.max || iconAsset == Pictures.telegramm)
                  ? SvgPicture.asset(iconAsset, width: 16, height: 16)
                  : SvgPicture.asset(
                      iconAsset,
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    )
            else if (icon != null)
              Icon(icon, size: 16, color: color),
            SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: AppStyles.regular12s.copyWith(color: color),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Позвонить продавцу
  Future<void> _launchPhone(BuildContext context, String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Не удалось совершить звонок'), duration: Duration(seconds: 2)));
      }
    }
  }

  /// Открыть Telegram продавца
  Future<void> _launchTelegram(BuildContext context, String telegram) async {
    final username = telegram.replaceAll('@', '');
    final uri = Uri.parse('https://t.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Не удалось открыть Telegram'), duration: Duration(seconds: 2)));
      }
    }
  }

  /// Открыть MAX продавца
  Future<void> _launchMax(BuildContext context, String max) async {
    final username = max.replaceAll('@', '');
    final uri = Uri.parse('https://max.me/$username');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Не удалось открыть MAX'), duration: Duration(seconds: 2)));
      }
    }
  }

  Widget _buildCompatibleAircraftModelsSection() {
    final hasCatalogModels = _compatibleModels.isNotEmpty;
    final hasManualText =
        _part!.compatibleAircraftModelsText != null && _part!.compatibleAircraftModelsText!.isNotEmpty;

    if (!hasCatalogModels && !hasManualText) {
      return SizedBox.shrink();
    }

    // Разбиваем ручной текст на отдельные модели (разделители: запятая, точка с запятой, перенос строки)
    List<String> manualModels = [];
    if (hasManualText) {
      manualModels = _part!.compatibleAircraftModelsText!
          .split(RegExp(r'[,;\n]'))
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text('Совместимые модели:', style: AppStyles.regular14s.copyWith(color: AppColors.textSecondary)),
          ),
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (hasCatalogModels) ...[
                  if (_isLoadingModels)
                    Chip(
                      label: Text('Загрузка...', style: AppStyles.regular12s),
                      backgroundColor: AppColors.primary100p.withOpacity(0.1),
                      labelStyle: AppStyles.regular12s.copyWith(color: AppColors.primary100p),
                    )
                  else
                    ..._compatibleModels.map((model) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.primary100p.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.primary100p.withOpacity(0.3), width: 1),
                        ),
                        child: Text(
                          model.getFullName(),
                          style: AppStyles.regular12s.copyWith(
                            color: AppColors.primary100p,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                ],
                if (hasManualText)
                  ...manualModels.map((modelText) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.primary100p.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.primary100p.withOpacity(0.3), width: 1),
                      ),
                      child: Text(
                        modelText,
                        style: AppStyles.regular12s.copyWith(color: AppColors.primary100p, fontWeight: FontWeight.w500),
                      ),
                    );
                  }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPriceHistoryModal(BuildContext context, int partId) async {
    final repository = getIt<MarketRepository>();
    final priceHistoryResult = await repository.getPartPriceHistory(partId);

    priceHistoryResult.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Ошибка загрузки истории цен: ${failure.message}',
              style: AppStyles.regular14s.copyWith(color: Colors.white),
            ),
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
                          Text(
                            formatDate(historyItem.createdAt),
                            style: AppStyles.regular14s.copyWith(color: Color(0xFF374151)),
                          ),
                          if (isFirst) ...[
                            SizedBox(height: 4),
                            Text('Публикация', style: AppStyles.regular12s.copyWith(color: Color(0xFF9CA5AF))),
                          ],
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${formatPrice(historyItem.price)} ${getCurrencySymbol(_part!.currency)}',
                          style: AppStyles.bold16s.copyWith(color: Color(0xFF374151)),
                        ),
                        if (priceChange != null && priceChange != 0) ...[
                          SizedBox(height: 4),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                priceChange > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                                size: 14.0,
                                color: priceChange > 0 ? Colors.red : Colors.green,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '${formatPrice(priceChange.abs())} ${getCurrencySymbol(_part!.currency)}',
                                style: AppStyles.regular12s.copyWith(
                                  color: priceChange > 0 ? Colors.red : Colors.green,
                                ),
                              ),
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
}
