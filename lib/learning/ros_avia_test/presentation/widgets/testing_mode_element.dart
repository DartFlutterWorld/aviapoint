import 'dart:ui';
import 'package:aviapoint/core/presentation/provider/app_state.dart';
import 'package:aviapoint/core/themes/app_styles.dart';
import 'package:aviapoint/core/utils/const/pictures.dart';
import 'package:aviapoint/injection_container.dart';
import 'package:aviapoint/payment/domain/repositories/payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestingModeElement extends StatefulWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final String image;
  final String bg;
  final bool isLock;

  const TestingModeElement({super.key, required this.title, required this.subTitle, required this.onTap, required this.image, required this.bg, this.isLock = false});

  @override
  State<TestingModeElement> createState() => _TestingModeElementState();
}

class _TestingModeElementState extends State<TestingModeElement> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _hasActiveSubscription = false;
  bool _isCheckingSubscription = false; // Флаг для предотвращения параллельных вызовов

  // Состояния анимации: 0 = обычное, 1 = lock, 2 = unlock
  int _currentStage = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 6000), // Длительность полного цикла: 2 сек на стадию
      vsync: this,
    );

    // Проверяем подписку после первого кадра
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _checkSubscription();
      }
    });
  }

  Future<void> _checkSubscription() async {
    // Предотвращаем параллельные вызовы
    if (_isCheckingSubscription || !mounted) return;

    _isCheckingSubscription = true;

    try {
      if (!mounted) return;

      final appState = Provider.of<AppState>(context, listen: false);
      if (!appState.isAuthenticated) {
        if (mounted) {
          setState(() {
            _hasActiveSubscription = false;
          });
          _updateAnimationState();
        }
        return;
      }

      final paymentRepository = getIt<PaymentRepository>();
      final subscriptions = await paymentRepository.getSubscriptionStatus();

      if (!mounted) return;

      final hasActive = subscriptions.any((subscription) => subscription.isActive && subscription.endDate.isAfter(DateTime.now()));

      if (mounted) {
        setState(() {
          _hasActiveSubscription = hasActive;
        });
        _updateAnimationState();
      }
    } catch (e) {
      // Игнорируем ошибки проверки подписки, просто не показываем анимацию
      // Логируем ошибку для отладки, но не прерываем выполнение
      debugPrint('Error checking subscription: $e');
      if (mounted) {
        setState(() {
          _hasActiveSubscription = false;
        });
        _updateAnimationState();
      }
    } finally {
      if (mounted) {
        _isCheckingSubscription = false;
      }
    }
  }

  void _updateAnimationState() {
    // Анимация показывается только если isLock = true И нет активной подписки
    final shouldAnimate = widget.isLock && !_hasActiveSubscription;

    if (shouldAnimate && !_animationController.isAnimating) {
      _startAnimation();
    } else if (!shouldAnimate && _animationController.isAnimating) {
      _animationController.stop();
      _animationController.reset();
      setState(() {
        _currentStage = 0;
      });
    }
  }

  void _startAnimation() {
    _animationController.repeat();
    _animationController.addListener(() {
      // Определяем текущую стадию на основе значения анимации
      // Цикл: 0-33% = стадия 0 (обычное), 33-50% = переход к lock, 50-66% = lock, 66-83% = переход к unlock, 83-100% = unlock
      final value = _animationController.value;
      int newStage;

      if (value < 0.33) {
        // Стадия 1: обычное состояние (0-33%)
        newStage = 0;
      } else if (value < 0.66) {
        // Стадия 2: lock (33-66%)
        newStage = 1;
      } else {
        // Стадия 3: unlock (66-100%)
        newStage = 2;
      }

      if (newStage != _currentStage) {
        setState(() {
          _currentStage = newStage;
        });
      }
    });
  }

  // Вычисляем значение размытия в зависимости от стадии
  double _getBlurValue() {
    if (_currentStage == 0) return 0.0;

    final value = _animationController.value;
    if (_currentStage == 1) {
      // Для lock: размытие от 0 до 2 в диапазоне 33-66%
      if (value < 0.33) return 0.0;
      if (value > 0.66) return 2.0;
      return ((value - 0.33) / 0.33) * 2.0;
    } else {
      // Для unlock: размытие остается 2 в диапазоне 66-100%
      return 2.0;
    }
  }

  // Вычисляем прозрачность иконки в зависимости от стадии
  double _getIconOpacity() {
    if (_currentStage == 0) return 0.0;

    final value = _animationController.value;
    if (_currentStage == 1) {
      // Для lock: прозрачность от 0 до 1 в диапазоне 33-66%
      if (value < 0.33) return 0.0;
      if (value > 0.66) return 1.0;
      return (value - 0.33) / 0.33;
    } else {
      // Для unlock: прозрачность от 0 до 1 в диапазоне 66-100%
      if (value < 0.66) return 0.0;
      if (value > 1.0) return 1.0;
      return (value - 0.66) / 0.34;
    }
  }

  @override
  void didUpdateWidget(TestingModeElement oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isLock != oldWidget.isLock) {
      _updateAnimationState();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Проверяем подписку при изменении зависимостей (например, после авторизации)
    // Используем WidgetsBinding для безопасного вызова после построения
    // Добавляем небольшую задержку, чтобы избежать множественных вызовов
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_isCheckingSubscription) {
        // Используем Future.microtask для отложенного выполнения
        Future.microtask(() {
          if (mounted) {
            _checkSubscription();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          // Основной контейнер с фоном и контентом
          Container(
            // height: 100,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Color(0xff045EC5).withOpacity(0.08), blurRadius: 9.3, spreadRadius: 0, offset: Offset(0.0, 4.0))],
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(image: AssetImage(widget.bg), fit: isLandscape ? BoxFit.cover : BoxFit.fill),
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.title, style: AppStyles.bold16s.copyWith(color: Color(0xFF1F2937), height: 1)),
                    SizedBox(height: 6),
                    Text(widget.subTitle, style: AppStyles.regular12s.copyWith(color: Color(0xFF6E7A89))),
                  ],
                ),
                // Обычная иконка (всегда резервируем место, чтобы избежать прыжков высоты)
                SizedBox(
                  height: 50,
                  child: _currentStage == 0 ? Image.asset(widget.image, fit: BoxFit.cover) : SizedBox.shrink(), // Пустое место, чтобы высота не менялась
                ),
              ],
            ),
          ),
          // Анимация lock/unlock с размытием на весь виджет (показывается в стадиях 1 и 2)
          // Показываем только если isLock = true И нет активной подписки
          if (widget.isLock && !_hasActiveSubscription && _currentStage > 0)
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                final blurValue = _getBlurValue();
                final iconOpacity = _getIconOpacity();

                if (blurValue == 0.0 && iconOpacity == 0.0) {
                  return SizedBox.shrink();
                }

                return Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.transparent,
                        child: Center(
                          child: Opacity(opacity: iconOpacity, child: Image.asset(_currentStage == 1 ? Pictures.lock : Pictures.unlock, height: 55, width: 84)),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
