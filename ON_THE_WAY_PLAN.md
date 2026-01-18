# План реализации сервиса "По пути"

Сервис для организации совместных полетов (аналог BlaBlaCar для авиации)

## 📋 Обзор проекта

**Цель**: Создать платформу, где пилоты могут предложить свободные места в своих полетах, а пассажиры могут забронировать места для совместных полетов.

**Целевая аудитория**: Пилоты с собственными самолетами и люди, желающие летать на частных самолетах.

**MVP срок**: 12-17 дней

---

## 🗄️ Фаза 1: Проектирование базы данных (1-2 дня)

### 1.1. Схема базы данных

```sql
-- Таблица поездок (полетов)
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  pilot_id INTEGER NOT NULL REFERENCES profiles(id),
  departure_airport VARCHAR(255) NOT NULL,
  arrival_airport VARCHAR(255) NOT NULL,
  departure_date TIMESTAMP NOT NULL,
  available_seats INTEGER NOT NULL CHECK (available_seats > 0),
  price_per_seat DECIMAL(10, 2) NOT NULL,
  aircraft_type VARCHAR(100),
  description TEXT,
  status VARCHAR(50) DEFAULT 'active', -- active, completed, cancelled
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Таблица бронирований
CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  flight_id INTEGER NOT NULL REFERENCES flights(id),
  passenger_id INTEGER NOT NULL REFERENCES profiles(id),
  seats_count INTEGER NOT NULL CHECK (seats_count > 0),
  total_price DECIMAL(10, 2) NOT NULL,
  status VARCHAR(50) DEFAULT 'pending', -- pending, confirmed, cancelled
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Таблица отзывов
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  booking_id INTEGER NOT NULL REFERENCES bookings(id),
  reviewer_id INTEGER NOT NULL REFERENCES profiles(id),
  reviewed_id INTEGER NOT NULL REFERENCES profiles(id),
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Индексы для производительности
CREATE INDEX idx_flights_departure_date ON flights(departure_date);
CREATE INDEX idx_flights_departure_airport ON flights(departure_airport);
CREATE INDEX idx_flights_arrival_airport ON flights(arrival_airport);
CREATE INDEX idx_flights_pilot_id ON flights(pilot_id);
CREATE INDEX idx_bookings_flight_id ON bookings(flight_id);
CREATE INDEX idx_bookings_passenger_id ON bookings(passenger_id);
CREATE INDEX idx_reviews_reviewed_id ON reviews(reviewed_id);
```

### 1.2. Структура модуля Frontend

```
lib/on_the_way/
├── data/
│   ├── datasources/
│   │   └── on_the_way_service.dart (Retrofit)
│   ├── models/
│   │   ├── flight_dto.dart
│   │   ├── booking_dto.dart
│   │   ├── review_dto.dart
│   │   └── create_flight_request_dto.dart
│   └── repositories/
│       └── on_the_way_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── flight_entity.dart
│   │   ├── booking_entity.dart
│   │   └── review_entity.dart
│   └── repositories/
│       └── on_the_way_repository.dart
└── presentation/
    ├── bloc/
    │   ├── flights_bloc.dart
    │   ├── bookings_bloc.dart
    │   └── reviews_bloc.dart
    └── pages/
        ├── flights_list_screen.dart
        ├── create_flight_screen.dart
        ├── flight_detail_screen.dart
        ├── my_flights_screen.dart
        └── my_bookings_screen.dart
```

---

## 🔧 Фаза 2: Backend реализация (3-4 дня)

### 2.1. Модели данных

**FlightModel** (`lib/on_the_way/model/flight_model.dart`)
- id, pilotId, departureAirport, arrivalAirport
- departureDate, availableSeats, pricePerSeat
- aircraftType, description, status
- createdAt, updatedAt

**BookingModel** (`lib/on_the_way/model/booking_model.dart`)
- id, flightId, passengerId, seatsCount
- totalPrice, status
- createdAt, updatedAt

**ReviewModel** (`lib/on_the_way/model/review_model.dart`)
- id, bookingId, reviewerId, reviewedId
- rating, comment, createdAt

### 2.2. API Endpoints

```
GET    /api/flights                    - Список доступных полетов (с фильтрами)
GET    /api/flights/:id                - Детали полета
POST   /api/flights                    - Создать полет (только для пилотов)
PUT    /api/flights/:id                - Обновить полет (только владелец)
DELETE /api/flights/:id                - Отменить полет (только владелец)

GET    /api/bookings                   - Мои бронирования
POST   /api/bookings                   - Создать бронирование
PUT    /api/bookings/:id/confirm       - Подтвердить бронирование (пилот)
PUT    /api/bookings/:id/cancel        - Отменить бронирование

GET    /api/reviews/:userId            - Отзывы о пользователе
POST   /api/reviews                    - Оставить отзыв
```

### 2.3. Репозитории

**OnTheWayRepository** (`lib/on_the_way/repositories/on_the_way_repository.dart`)
- `fetchFlights()` - получение списка полетов с фильтрами
- `fetchFlightById()` - получение деталей полета
- `createFlight()` - создание нового полета
- `updateFlight()` - обновление полета
- `deleteFlight()` - удаление полета
- `fetchBookings()` - получение бронирований пользователя
- `createBooking()` - создание бронирования
- `confirmBooking()` - подтверждение бронирования
- `cancelBooking()` - отмена бронирования
- `fetchReviews()` - получение отзывов
- `createReview()` - создание отзыва

### 2.4. Контроллеры

**OnTheWayController** (`lib/on_the_way/controllers/on_the_way_controller.dart`)
- Реализация всех endpoints через shelf_router
- Валидация запросов
- Проверка авторизации
- Обработка ошибок

---

## 📱 Фаза 3: Frontend - Data Layer (2-3 дня)

### 3.1. DTO модели (Freezed + JSON)

**FlightDto**
```dart
@freezed
class FlightDto with _$FlightDto {
  const factory FlightDto({
    required int id,
    @JsonKey(name: 'pilot_id') required int pilotId,
    @JsonKey(name: 'departure_airport') required String departureAirport,
    @JsonKey(name: 'arrival_airport') required String arrivalAirport,
    @JsonKey(name: 'departure_date') required DateTime departureDate,
    @JsonKey(name: 'available_seats') required int availableSeats,
    @JsonKey(name: 'price_per_seat') required double pricePerSeat,
    @JsonKey(name: 'aircraft_type') String? aircraftType,
    String? description,
    String? status,
  }) = _FlightDto;
  
  factory FlightDto.fromJson(Map<String, dynamic> json) => 
      _$FlightDtoFromJson(json);
}
```

**BookingDto** - аналогично

**ReviewDto** - аналогично

**CreateFlightRequestDto** - для создания полета

### 3.2. Service (Retrofit)

**OnTheWayService** (`lib/on_the_way/data/datasources/on_the_way_service.dart`)
```dart
@RestApi()
abstract class OnTheWayService {
  factory OnTheWayService(Dio dio) = _OnTheWayService;
  
  @GET('/api/flights')
  Future<List<FlightDto>> getFlights({
    @Query('departure_airport') String? departureAirport,
    @Query('arrival_airport') String? arrivalAirport,
    @Query('date_from') DateTime? dateFrom,
    @Query('date_to') DateTime? dateTo,
  });
  
  @GET('/api/flights/{id}')
  Future<FlightDto> getFlight(@Path('id') int id);
  
  @POST('/api/flights')
  Future<FlightDto> createFlight(@Body() CreateFlightRequestDto request);
  
  @PUT('/api/flights/{id}')
  Future<FlightDto> updateFlight(@Path('id') int id, @Body() CreateFlightRequestDto request);
  
  @DELETE('/api/flights/{id}')
  Future<void> deleteFlight(@Path('id') int id);
  
  // Bookings
  @GET('/api/bookings')
  Future<List<BookingDto>> getBookings();
  
  @POST('/api/bookings')
  Future<BookingDto> createBooking(@Body() CreateBookingRequestDto request);
  
  @PUT('/api/bookings/{id}/confirm')
  Future<BookingDto> confirmBooking(@Path('id') int id);
  
  @PUT('/api/bookings/{id}/cancel')
  Future<BookingDto> cancelBooking(@Path('id') int id);
  
  // Reviews
  @GET('/api/reviews/{userId}')
  Future<List<ReviewDto>> getReviews(@Path('userId') int userId);
  
  @POST('/api/reviews')
  Future<ReviewDto> createReview(@Body() CreateReviewRequestDto request);
}
```

### 3.3. Repository Implementation

**OnTheWayRepositoryImpl** (`lib/on_the_way/data/repositories/on_the_way_repository_impl.dart`)
- Реализация всех методов интерфейса
- Маппинг DTO → Entity через мапперы
- Обработка ошибок (DioException → Failure)

---

## 🎯 Фаза 4: Frontend - Domain Layer (1 день)

### 4.1. Entities

**FlightEntity** (`lib/on_the_way/domain/entities/flight_entity.dart`)
```dart
class FlightEntity extends Equatable {
  final int id;
  final int pilotId;
  final String departureAirport;
  final String arrivalAirport;
  final DateTime departureDate;
  final int availableSeats;
  final double pricePerSeat;
  final String? aircraftType;
  final String? description;
  final String status;
  
  const FlightEntity({
    required this.id,
    required this.pilotId,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.departureDate,
    required this.availableSeats,
    required this.pricePerSeat,
    this.aircraftType,
    this.description,
    required this.status,
  });
  
  @override
  List<Object?> get props => [
    id, pilotId, departureAirport, arrivalAirport,
    departureDate, availableSeats, pricePerSeat,
    aircraftType, description, status,
  ];
}
```

**BookingEntity** - аналогично

**ReviewEntity** - аналогично

### 4.2. Repository Interface

**OnTheWayRepository** (`lib/on_the_way/domain/repositories/on_the_way_repository.dart`)
```dart
abstract class OnTheWayRepository {
  Future<Either<Failure, List<FlightEntity>>> getFlights({
    String? departureAirport,
    String? arrivalAirport,
    DateTime? dateFrom,
    DateTime? dateTo,
  });
  
  Future<Either<Failure, FlightEntity>> getFlight(int id);
  Future<Either<Failure, FlightEntity>> createFlight(CreateFlightRequest request);
  Future<Either<Failure, FlightEntity>> updateFlight(int id, CreateFlightRequest request);
  Future<Either<Failure, void>> deleteFlight(int id);
  
  Future<Either<Failure, List<BookingEntity>>> getBookings();
  Future<Either<Failure, BookingEntity>> createBooking(CreateBookingRequest request);
  Future<Either<Failure, BookingEntity>> confirmBooking(int id);
  Future<Either<Failure, BookingEntity>> cancelBooking(int id);
  
  Future<Either<Failure, List<ReviewEntity>>> getReviews(int userId);
  Future<Either<Failure, ReviewEntity>> createReview(CreateReviewRequest request);
}
```

---

## 🎨 Фаза 5: Frontend - Presentation Layer (4-5 дней)

### 5.1. BLoC

**FlightsBloc** (`lib/on_the_way/presentation/bloc/flights_bloc.dart`)
- Events: `GetFlightsEvent`, `GetFlightEvent`, `CreateFlightEvent`, `UpdateFlightEvent`, `DeleteFlightEvent`
- States: `LoadingFlightsState`, `SuccessFlightsState`, `ErrorFlightsState`

**BookingsBloc** (`lib/on_the_way/presentation/bloc/bookings_bloc.dart`)
- Events: `GetMyBookingsEvent`, `CreateBookingEvent`, `ConfirmBookingEvent`, `CancelBookingEvent`
- States: `LoadingBookingsState`, `SuccessBookingsState`, `ErrorBookingsState`

**ReviewsBloc** (`lib/on_the_way/presentation/bloc/reviews_bloc.dart`)
- Events: `GetReviewsEvent`, `CreateReviewEvent`
- States: `LoadingReviewsState`, `SuccessReviewsState`, `ErrorReviewsState`

### 5.2. Экраны

#### 5.2.1. Список полетов (`FlightsListScreen`)
**Функционал:**
- Поиск по аэропортам отправления и прибытия
- Фильтры: дата от/до, цена
- Список карточек полетов
- Переход к деталям полета
- Кнопка "Создать полет" (для пилотов)

**UI компоненты:**
- Поисковая строка с автодополнением аэропортов
- Фильтры в виде bottom sheet
- Карточки полетов с основной информацией
- Pull-to-refresh
- Infinite scroll (опционально)

#### 5.2.2. Создание полета (`CreateFlightScreen`)
**Функционал:**
- Форма создания полета:
  - Аэропорт отправления (с автодополнением)
  - Аэропорт прибытия (с автодополнением)
  - Дата и время вылета
  - Количество свободных мест
  - Цена за место
  - Модель самолёта (опционально)
  - Описание (опционально)
- Валидация всех полей
- Сохранение через BLoC
- Успешное создание → переход к деталям полета

#### 5.2.3. Детали полета (`FlightDetailScreen`)
**Функционал:**
- Полная информация о полете
- Информация о пилоте:
  - Имя, фото
  - Рейтинг
  - Количество отзывов
  - История полетов
- Кнопка "Забронировать место"
- Список бронирований (для владельца полета)
- Возможность редактировать/отменить (для владельца)

#### 5.2.4. Мои полеты (`MyFlightsScreen`)
**Функционал:**
- Список созданных полетов
- Фильтры: активные, завершенные, отмененные
- Возможность редактировать активные полеты
- Возможность отменить активные полеты
- Просмотр деталей каждого полета

#### 5.2.5. Мои бронирования (`MyBookingsScreen`)
**Функционал:**
- Список забронированных полетов
- Статусы: ожидает подтверждения, подтверждено, отменено
- Возможность отменить бронирование
- Просмотр деталей полета
- Возможность оставить отзыв после завершенного полета

---

## 🔗 Фаза 6: Интеграция (1-2 дня)

### 6.1. Роутинг

Добавить в `lib/core/routes/app_router.dart`:
```dart
AutoRoute(
  path: 'on-the-way',
  page: OnTheWayNavigationRoute.page,
  children: [
    AutoRoute(initial: true, page: FlightsListRoute.page),
    AutoRoute(path: 'create', page: CreateFlightRoute.page),
    AutoRoute(path: ':id', page: FlightDetailRoute.page),
    AutoRoute(path: 'my-flights', page: MyFlightsRoute.page),
    AutoRoute(path: 'my-bookings', page: MyBookingsRoute.page),
  ],
)
```

### 6.2. DI Container

Добавить в `lib/injection_container.dart`:
```dart
getIt.registerSingleton<OnTheWayRepository>(
  OnTheWayRepositoryImpl(
    onTheWayService: OnTheWayService(dataSource.dio),
  ),
);
```

### 6.3. BLoC Providers

Добавить в `lib/core/presentation/pages/app.dart`:
```dart
BlocProvider<FlightsBloc>(
  create: (context) => FlightsBloc(
    onTheWayRepository: getIt<OnTheWayRepository>(),
  ),
),
BlocProvider<BookingsBloc>(
  create: (context) => BookingsBloc(
    onTheWayRepository: getIt<OnTheWayRepository>(),
  ),
),
BlocProvider<ReviewsBloc>(
  create: (context) => ReviewsBloc(
    onTheWayRepository: getIt<OnTheWayRepository>(),
  ),
),
```

### 6.4. Навигация

**Вариант 1**: Добавить в bottom navigation bar (если есть)
**Вариант 2**: Добавить баннер на главный экран (`MainScreen`)
**Вариант 3**: Добавить в меню профиля

---

## 🚀 Фаза 7: Дополнительные функции (опционально, после MVP)

### 7.1. Система рейтингов
- [ ] Отображение рейтинга пилота в профиле
- [ ] Возможность оставить отзыв после завершенного полета
- [ ] Фильтрация пилотов по рейтингу

### 7.2. Уведомления
- [ ] Push-уведомления о новых полетах по интересующим маршрутам
- [ ] Уведомления о новых бронированиях (для пилотов)
- [ ] Уведомления о подтверждении/отмене бронирования (для пассажиров)

### 7.3. Чат
- [ ] Общение между пилотом и пассажирами
- [ ] Обсуждение деталей полета
- [ ] Обмен контактами

### 7.4. Оплата
- [ ] Интеграция с платежной системой (через существующий Payment модуль)
- [ ] Безопасная оплата через приложение
- [ ] Возврат средств при отмене

### 7.5. Карта
- [ ] Визуализация маршрутов на карте
- [ ] Поиск ближайших аэропортов
- [ ] Отображение всех доступных полетов на карте

### 7.6. Избранное
- [ ] Сохранение интересных маршрутов
- [ ] Уведомления о новых полетах по избранным маршрутам

---

## 📊 Оценка времени

| Фаза | Время | Приоритет | Статус |
|------|-------|-----------|--------|
| Фаза 1: Проектирование | 1-2 дня | Критично | ⏳ TODO |
| Фаза 2: Backend | 3-4 дня | Критично | ⏳ TODO |
| Фаза 3: Frontend Data | 2-3 дня | Критично | ⏳ TODO |
| Фаза 4: Frontend Domain | 1 день | Критично | ⏳ TODO |
| Фаза 5: Frontend Presentation | 4-5 дней | Критично | ⏳ TODO |
| Фаза 6: Интеграция | 1-2 дня | Критично | ⏳ TODO |
| Фаза 7: Дополнительно | Позже | Опционально | ⏳ TODO |

**Итого MVP: 12-17 дней**

---

## ✅ Приоритеты для MVP

1. ✅ Создание полета (пилотом)
2. ✅ Поиск и просмотр полетов (с фильтрами)
3. ✅ Бронирование мест (пассажиром)
4. ✅ Просмотр своих полетов (пилотом)
5. ✅ Просмотр своих бронирований (пассажиром)
6. ✅ Базовая валидация и обработка ошибок
7. ✅ Подтверждение/отмена бронирований

---

## 🔒 Безопасность и валидация

### Backend
- [ ] Проверка авторизации для всех endpoints
- [ ] Проверка прав доступа (только владелец может редактировать/удалять)
- [ ] Валидация входных данных
- [ ] Проверка доступности мест при бронировании
- [ ] Защита от дублирования бронирований

### Frontend
- [ ] Валидация форм перед отправкой
- [ ] Обработка всех возможных ошибок
- [ ] Показ понятных сообщений об ошибках
- [ ] Защита от повторных запросов

---

## 📝 Заметки

- Использовать существующие паттерны архитектуры (Clean Architecture)
- Следовать стилю кода проекта
- Использовать существующие UI компоненты где возможно
- Тестировать на разных устройствах (iOS, Android, Web)
- Учесть производительность при большом количестве полетов

---

## 🎯 Следующие шаги

1. Создать миграции БД на бэкенде
2. Реализовать модели и репозитории на бэкенде
3. Создать API endpoints
4. Реализовать Data Layer на фронтенде
5. Реализовать Domain Layer на фронтенде
6. Создать UI экраны
7. Интегрировать в приложение
8. Тестирование
9. Деплой

---

**Дата создания плана**: 2025-01-XX
**Версия**: 1.0
**Статус**: В разработке

