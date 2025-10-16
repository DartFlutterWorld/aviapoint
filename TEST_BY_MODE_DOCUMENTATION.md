# TestByModeScreen & TestByModeWidget - Полная Документация

## 📋 Описание

Реализация **тренировочного режима** для прохождения тестирования с интерактивным выбором ответов и визуальной обратной связью.

### Функциональность:
- ✅ Отображение вопросов с вариантами ответов
- ✅ Интерактивный выбор ответа пользователем
- ✅ Визуальная подсветка выбранного ответа (голубая рамка)
- ✅ Показ правильного ответа (зеленый фон) после выбора
- ✅ Отображение иконки ✓ для правильного ответа
- ✅ Сворачиваемое объяснение (обоснование) к ответу
- ✅ Кнопка "Следующий" для навигации между вопросами
- ✅ Кнопка disabled пока не выбран ответ
- ✅ Сохранение состояния выбора при переходе назад
- ✅ Сброс состояния при переходе на новый вопрос

---

## 🏗️ Архитектура

### Структура

```
TestByModeScreen (StatefulWidget - главный экран)
  ├─ _TestByModeScreenState
  │   ├─ questionsByTypeCertificateAndCategoriesBloc (загрузка вопросов)
  │   ├─ indexQuestion (ValueNotifier - текущий вопрос)
  │   ├─ answerStateChanged (ValueNotifier - уведомления об изменениях)
  │   └─ answerStateMap (Map - сохранение состояния ответов)
  │
  └─ TestByModeWidget (вложенный виджет - отображение вопроса)
      ├─ _TestByModeWidgetState
      │   ├─ _isExplanationExpanded (состояние раскрытия)
      │   ├─ _selectedAnswerIndex (индекс выбранного ответа)
      │   ├─ _showResults (флаг показа результатов)
      │   └─ _getCorrectAnswerIndex() (определение правильного ответа)
      │
      └─ AnswerByModeWidget (отдельный виджет для каждого ответа)
```

### Ключевые компоненты

#### 1. **TestByModeScreen**
- Главный экран для проведения теста
- Загружает вопросы через BLoC
- Управляет навигацией между вопросами
- Отслеживает состояние выбора пользователя

#### 2. **indexQuestion (ValueNotifier<int>)**
- Отслеживает индекс текущего вопроса
- Начинает с 0 (первый вопрос)
- Вызывает перестройку UI при изменении

#### 3. **answerStateChanged (ValueNotifier<int>)**
- Уведомляет об изменении состояния ответа
- Используется для перестройки кнопки "Следующий"
- Увеличивается при выборе ответа и при переходе между вопросами

#### 4. **answerStateMap (Map)**
```dart
Map<int, ({int? selectedAnswerIndex, bool showResults})>
```
Сохраняет для каждого вопроса:
- `selectedAnswerIndex` - индекс выбранного ответа (null если не выбран)
- `showResults` - показывать ли правильный ответ

#### 5. **TestByModeWidget**
- Отображает один вопрос
- Управляет выбором ответов
- Показывает результаты и объяснения
- Уведомляет родителя об изменениях через `onStateChanged`

---

## 🎨 Визуальные состояния ответов

| Состояние | Фон | Рамка | Иконка |
|-----------|-----|-------|--------|
| Обычный | `#F1F7FF` | нет | - |
| **Выбран (до результатов)** | `#F1F7FF` | `#BCD9FE` (2px) | - |
| **Правильный** | `#C4F4E1` | нет | ✓ (перед текстом) |
| **Выбран неправильно** | `#F1F7FF` | `#BCD9FE` (2px) | - |

---

## 🔄 Логика работы

### 1. Загрузка вопросов

```
initState()
  ↓
QuestionsByTypeCertificateAndCategoriesBloc.add(GetQuestionsByTypeCertificateAndCategories)
  ↓
BlocBuilder реагирует на состояние
  ├─ loading → показать индикатор загрузки
  ├─ error → показать ошибку с кнопкой повтора
  └─ success → показать TestByModeWidget
```

### 2. Выбор ответа

```
Пользователь нажимает на ответ
  ↓
_handleAnswerTap(index)
  ├─ Проверка: режим training и результаты не показаны
  ├─ setState(): _selectedAnswerIndex = index, _showResults = true
  ├─ onStateChanged() → сохраняем в answerStateMap[currentIndex]
  └─ answerStateChanged.value++ → уведомляем слушателей
  ↓
ValueListenableBuilder перестраивается
  ↓
Кнопка "Следующий" становится ACTIVE ✅
```

### 3. Определение правильного ответа

```
_getCorrectAnswerIndex()
  ├─ Ищет ответ с isOfficial = true (приоритет 1)
  ├─ Если не найден → ищет isCorrect = true (приоритет 2)
  └─ Если не найден → возвращает null

Пример:
├─ Ответ 1: isOfficial=true, isCorrect=false → ✓ Выбран (официальный)
├─ Ответ 2: isOfficial=false, isCorrect=true → ✗ Игнорируется
└─ Результат: индекс 0
```

### 4. Переход к следующему вопросу

```
Пользователь нажимает "Следующий"
  ↓
Проверка: есть ли следующий вопрос?
  │
  ├─ YES:
  │   ├─ answerStateMap.remove(nextIndex) → очищаем состояние
  │   ├─ answerStateChanged.value++ → уведомляем слушателей
  │   └─ indexQuestion.value++ → переходим на следующий вопрос
  │       ↓
  │       didUpdateWidget() в TestByModeWidget
  │       ├─ _selectedAnswerIndex = null
  │       └─ _showResults = false
  │       ↓
  │       Новый вопрос без выбранного ответа
  │       ↓
  │       ValueListenableBuilder обновляется
  │       ↓
  │       Кнопка становится DISABLED 🔒
  │
  └─ NO:
      └─ context.router.maybePop() → выход на предыдущий экран
```

---

## 📊 Жизненный цикл

```
TestByModeScreen.initState()
  ├─ questionsByTypeCertificateAndCategoriesBloc инициализируется
  └─ indexQuestion = 0

build() → BLocProvider + BlocBuilder
  │
  └─ success() → TestByModeWidget создается
      │
      ├─ initState()
      │   ├─ _selectedAnswerIndex = initialSelectedAnswerIndex (null)
      │   └─ _showResults = initialShowResults (false)
      │
      └─ build() → ListView с ответами
          │
          └─ Пользователь выбирает ответ
              │
              └─ _handleAnswerTap()
                  ├─ setState() → _selectedAnswerIndex, _showResults
                  ├─ onStateChanged() → сохраняем в родителе
                  └─ answerStateChanged.value++ → уведомляем
                      │
                      └─ ValueListenableBuilder кнопки перестраивается
                          └─ disabled = false → кнопка активна
```

---

## 💻 Примеры кода

### Выбор ответа

```dart
void _handleAnswerTap(int index) {
  if (widget.testMode == TestMode.training && !_showResults) {
    setState(() {
      _selectedAnswerIndex = index;
      _showResults = true;
    });
    // Уведомляем родителя
    widget.onStateChanged?.call(_selectedAnswerIndex, _showResults);
  }
}
```

### Сохранение состояния

```dart
onStateChanged: (selectedAnswerIndex, showResults) {
  // Сохраняем в карте
  answerStateMap[indexQuestionValue] = (
    selectedAnswerIndex: selectedAnswerIndex,
    showResults: showResults
  );
  // Уведомляем об изменении
  answerStateChanged.value++;
}
```

### Переход к следующему

```dart
if (currentIndexQuestion + 1 < value.questionsWithAnswers.length) {
  // Очищаем состояние следующего вопроса
  answerStateMap.remove(currentIndexQuestion + 1);
  // Уведомляем об изменении
  answerStateChanged.value++;
  // Переходим на следующий
  indexQuestion.value++;
} else {
  // Выход на последний экран
  context.router.maybePop();
}
```

### Определение правильного ответа

```dart
int? _getCorrectAnswerIndex() {
  try {
    // Сначала ищем официальный ответ
    int officialIndex = widget.question.answers
        .indexWhere((answer) => answer.isOfficial);
    if (officialIndex != -1) return officialIndex;
    
    // Потом правильный
    int correctIndex = widget.question.answers
        .indexWhere((answer) => answer.isCorrect);
    if (correctIndex != -1) return correctIndex;
    
    return null;
  } catch (e) {
    return null;
  }
}
```

---

## 🎯 Особенности реализации

### 1. **Приоритет правильного ответа**
- ✅ `isOfficial = true` имеет приоритет над `isCorrect`
- ✅ Используется для корректного отображения официального ответа из теста

### 2. **Состояние кнопки "Следующий"**
- ✅ **Disabled** - пока не выбран ответ
- ✅ **Enabled** - после выбора ответа
- ✅ **Disabled** - на следующем вопросе (пока не выбран ответ)

### 3. **Сохранение и сброс состояния**
- ✅ Состояние сохраняется при выборе ответа
- ✅ Состояние сбрасывается при переходе на новый вопрос
- ✅ Но ТОЛЬКО для переходов ВПЕРЕД

### 4. **Визуальная обратная связь**
- ✅ Голубая рамка для выбранного ответа
- ✅ Зеленый фон для правильного ответа
- ✅ Иконка ✓ перед текстом правильного ответа

### 5. **Режимы**
- ✅ Логика срабатывает только в `TestMode.training`
- ✅ В других режимах ответы неактивны

---

## 📱 Параметры маршрута

```dart
@RoutePage()
@PathParam('typeCertificateId') required int typeCertificateId
```

Пример использования:
```dart
context.router.push(TestByModeRoute(typeCertificateId: 1));
```

---

## 🔌 API TestByModeWidget

### Входящие параметры

```dart
TestByModeWidget(
  question: QuestionWithAnswersEntity,           // Вопрос с ответами
  questionId: int,                               // ID вопроса
  categoryTitle: String,                         // Название категории
  testMode: TestMode,                            // Режим (training/test)
  buttonHint: bool,                              // Показывать обоснование
  initialSelectedAnswerIndex: int?,              // Восстанавливаемый выбор
  initialShowResults: bool,                      // Восстанавливаемые результаты
  onStateChanged: Function,                      // Callback об изменении
)
```

### Исходящие события

```dart
onStateChanged: (int? selectedAnswerIndex, bool showResults) {
  // selectedAnswerIndex - индекс выбранного ответа
  // showResults - показывать ли результаты
}
```

---

## ✅ Завершено

- ✅ Интерактивный выбор ответов в тренировочном режиме
- ✅ Визуальная подсветка выбранного ответа
- ✅ Показ правильного ответа с иконкой
- ✅ Сворачиваемое объяснение
- ✅ Кнопка "Следующий" с логикой disabled/enabled
- ✅ Сохранение состояния при навигации
- ✅ Сброс состояния при переходе на новый вопрос
- ✅ Приоритет официального ответа
- ✅ Полная документация в коде
- ✅ Полная документация в этом файле
