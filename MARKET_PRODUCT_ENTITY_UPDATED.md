# Обновлённая структура MarketProductEntity для самолётов

## Изменения
1. ❌ **УДАЛЕН** `productType` - тип определяется через `aircraftSubcategoriesId` (ссылка на `aircraft_subcategories`)
2. ✅ **РАЗДЕЛЕНЫ** изображения: `mainImageUrl` (основное) и `additionalImageUrls` (дополнительные)
3. 📝 **sellerId** - это ID продавца (владельца самолёта) из таблицы `profiles`

## Полная структура Entity

```dart
class MarketProductEntity {
  // === БАЗОВЫЕ ПОЛЯ ===
  final int id;
  final String title;                    // ОБЯЗАТЕЛЬНОЕ: Название/Модель
  final String? description;             // ОПЦИОНАЛЬНОЕ: Описание
  final double price;                    // ОБЯЗАТЕЛЬНОЕ: Цена
  final int? aircraftSubcategoriesId;    // ОБЯЗАТЕЛЬНОЕ: ID из aircraft_subcategories (заменяет productType)
  final int sellerId;                    // ОБЯЗАТЕЛЬНОЕ: ID продавца из profiles (владелец самолёта)
  
  // === ИЗОБРАЖЕНИЯ (РАЗДЕЛЕНЫ) ===
  final String? mainImageUrl;            // ОБЯЗАТЕЛЬНОЕ: Основное фото самолёта
  final List<String> additionalImageUrls; // ОПЦИОНАЛЬНОЕ: Дополнительные фото (массив)
  
  final String? brand;                   // ОПЦИОНАЛЬНОЕ: Бренд/Производитель
  final String? location;                // ОПЦИОНАЛЬНОЕ: Место расположения самолёта
  final String? locationType;            // ОПЦИОНАЛЬНОЕ: Тип локации ('airport', 'city', 'region')
  final bool isActive;
  final int viewsCount;
  final bool? isFavorite;

  // === ХАРАКТЕРИСТИКИ САМОЛЁТА ===
  final int? year;                       // ОПЦИОНАЛЬНОЕ: Год выпуска
  final double? flightHours;             // ОПЦИОНАЛЬНОЕ: Наработка часов
  final int? seats;                      // ОПЦИОНАЛЬНОЕ: Количество мест
  final String? condition;               // ОПЦИОНАЛЬНОЕ: Состояние ('new', 'used', 'restored')

  // === КОНТАКТНАЯ ИНФОРМАЦИЯ ПРОДАВЦА (из profiles) ===
  final String? sellerFirstName;         // ОПЦИОНАЛЬНОЕ: Имя продавца
  final String? sellerLastName;          // ОПЦИОНАЛЬНОЕ: Фамилия продавца
  final String? sellerPhone;             // ОПЦИОНАЛЬНОЕ: Телефон продавца
  final String? sellerTelegram;          // ОПЦИОНАЛЬНОЕ: Телеграм продавца
  final String? sellerMax;               // ОПЦИОНАЛЬНОЕ: MAX продавца

  // === МЕТАДАННЫЕ ===
  final DateTime? createdAt;             // ОПЦИОНАЛЬНОЕ: Дата публикации
  final DateTime? updatedAt;             // ОПЦИОНАЛЬНОЕ: Дата обновления

  // Геттер для полного имени продавца
  String? get sellerFullName {
    if (sellerFirstName != null && sellerLastName != null) {
      return '$sellerFirstName $sellerLastName';
    }
    return sellerFirstName ?? sellerLastName;
  }

  MarketProductEntity({
    // Базовые поля
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.aircraftSubcategoriesId,        // Теперь обязательное, так как определяет тип через aircraft_subcategories
    required this.sellerId,
    
    // Изображения (разделены)
    this.mainImageUrl,                   // Основное фото
    this.additionalImageUrls = const [], // Дополнительные фото
    
    this.brand,
    this.location,
    this.locationType,
    this.isActive = true,
    this.viewsCount = 0,
    this.isFavorite,
    
    // Характеристики самолёта
    this.year,
    this.flightHours,
    this.seats,
    this.condition,
    
    // Контактная информация продавца
    this.sellerFirstName,
    this.sellerLastName,
    this.sellerPhone,
    this.sellerTelegram,
    this.sellerMax,
    
    // Метаданные
    this.createdAt,
    this.updatedAt,
  });
}
```

## Структура DTO

```dart
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake, createToJson: false)
class MarketProductDto {
  final int id;
  final String title;
  final String? description;
  final double price;
  @JsonKey(name: 'aircraft_subcategories_id')
  final int? aircraftSubcategoriesId;
  @JsonKey(name: 'seller_id')
  final int sellerId;
  
  // Изображения
  @JsonKey(name: 'main_image_url')
  final String? mainImageUrl;
  @JsonKey(name: 'additional_image_urls', fromJson: _imageUrlsFromJson)
  final List<String> additionalImageUrls;
  
  final String? brand;
  final String? location;
  @JsonKey(name: 'location_type')
  final String? locationType;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'views_count')
  final int? viewsCount;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  // Характеристики самолёта
  final int? year;
  @JsonKey(name: 'flight_hours')
  final double? flightHours;
  final int? seats;
  final String? condition;

  // Контактная информация продавца (из JOIN с profiles)
  @JsonKey(name: 'seller_first_name')
  final String? sellerFirstName;
  @JsonKey(name: 'seller_last_name')
  final String? sellerLastName;
  @JsonKey(name: 'seller_phone')
  final String? sellerPhone;
  @JsonKey(name: 'seller_telegram')
  final String? sellerTelegram;
  @JsonKey(name: 'seller_max')
  final String? sellerMax;

  // Метаданные
  @JsonKey(name: 'created_at', fromJson: _dateTimeFromJsonNullable)
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at', fromJson: _dateTimeFromJsonNullable)
  final DateTime? updatedAt;

  MarketProductDto({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.aircraftSubcategoriesId,
    required this.sellerId,
    this.mainImageUrl,
    this.additionalImageUrls = const [],
    this.brand,
    this.location,
    this.locationType,
    this.isActive,
    this.viewsCount,
    this.isFavorite,
    this.year,
    this.flightHours,
    this.seats,
    this.condition,
    this.sellerFirstName,
    this.sellerLastName,
    this.sellerPhone,
    this.sellerTelegram,
    this.sellerMax,
    this.createdAt,
    this.updatedAt,
  });

  factory MarketProductDto.fromJson(Map<String, dynamic> json) => _$MarketProductDtoFromJson(json);
}
```

## Структура базы данных (SQL)

```sql
CREATE TABLE IF NOT EXISTS market_products (
    id SERIAL PRIMARY KEY,
    seller_id INTEGER NOT NULL REFERENCES profiles(id),
    aircraft_subcategories_id INTEGER REFERENCES aircraft_subcategories(id) ON DELETE SET NULL,
    title VARCHAR(500) NOT NULL,
    description TEXT,
    price NUMERIC(10, 2) NOT NULL,
    
    -- Изображения
    main_image_url VARCHAR(512),                    -- Основное фото
    additional_image_urls JSONB DEFAULT '[]'::jsonb, -- Дополнительные фото (массив URL)
    
    brand VARCHAR(255),
    location VARCHAR(255),
    location_type VARCHAR(50),                      -- 'airport', 'city', 'region'
    
    -- Характеристики самолёта
    year INTEGER,
    flight_hours NUMERIC(10, 2),
    seats INTEGER,
    condition VARCHAR(50),                          -- 'new', 'used', 'restored'
    
    is_active BOOLEAN DEFAULT TRUE,
    views_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

## SQL запрос с JOIN для получения контактной информации

```sql
SELECT 
    mp.*,
    p.first_name as seller_first_name,
    p.last_name as seller_last_name,
    p.phone as seller_phone,
    p.telegram as seller_telegram,
    p.max as seller_max,
    -- Проверка избранного (если нужен текущий пользователь)
    EXISTS(
        SELECT 1 FROM user_favorite_products 
        WHERE user_id = @current_user_id AND product_id = mp.id
    ) as is_favorite
FROM market_products mp
LEFT JOIN profiles p ON mp.seller_id = p.id
WHERE mp.aircraft_subcategories_id = @aircraft_subcategories_id  -- Фильтр по категории (aircraft_subcategories)
    AND mp.is_active = true
ORDER BY mp.created_at DESC;
```

## Пример визуальной структуры карточки

```
┌────────────────────────────────────┐
│    [Основное фото самолёта]        │  ← mainImageUrl (60-70% высоты)
│           [❤️]                      │  ← isFavorite
│                                    │
│  [📷] [📷] [📷] [+3]              │  ← additionalImageUrls (миниатюры)
├────────────────────────────────────┤
│ Cessna 172 SP                      │  ← title
│                                    │
│ 📅 Год: 2020                       │  ← year
│ ⏱️  Часы: 1,250 ч                  │  ← flightHours
│ 👥 Мест: 4                         │  ← seats
│ 📍 Москва, Шереметьево             │  ← location
│                                    │
│ Состояние: Б/у                    │  ← condition
│                                    │
│ 👤 Иванов Иван Иванович            │  ← sellerFullName
│ 📞 +7 (999) 123-45-67              │  ← sellerPhone
│ ✈️  @ivan_pilot                    │  ← sellerTelegram
│                                    │
│ 15,500,000 ₽                      │  ← price
└────────────────────────────────────┘
```

## Что делает sellerId?

**`sellerId`** - это ID пользователя из таблицы `profiles`, который является владельцем/продавцом самолёта. Через этот ID можно получить:
- ФИО продавца (`first_name`, `last_name`)
- Контактную информацию (`phone`, `telegram`, `max`)
- Аватар продавца (`avatar_url`)
- Рейтинг продавца (`average_rating`)

Эти данные загружаются через JOIN с таблицей `profiles` в SQL запросах.
