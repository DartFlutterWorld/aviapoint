# Resume Test Session - Дизайн Решения

## 🎯 Задача
Если пользователь начал проходить тест но не закончил, нужно:
1. Предложить ему продолжить тест
2. Загрузить с позиции последнего незавершенного вопроса
3. Разные подходы для "Тренировочный режим" vs "Стандартный тест"

---

## 💾 Данные в БД

### Таблица `test_sessions` (новая)
```sql
CREATE TABLE test_sessions (
  id INTEGER PRIMARY KEY,
  userId INTEGER,
  certificateTypeId INTEGER,
  testMode TEXT, -- 'training' или 'standard'
  selectedCategoryIds TEXT, -- JSON: [1,2,3]
  currentQuestionId INTEGER,
  currentQuestionIndex INTEGER,
  status TEXT, -- 'in_progress', 'completed', 'abandoned'
  startedAt DATETIME,
  lastAnswerAt DATETIME,
  totalTimeSeconds INTEGER,
  
  FOREIGN KEY (certificateTypeId) REFERENCES certificates(id),
  UNIQUE (userId, certificateTypeId, testMode) -- Один активный тест за раз
);

CREATE TABLE test_answers (
  id INTEGER PRIMARY KEY,
  sessionId INTEGER,
  questionId INTEGER,
  categoryId INTEGER,
  selectedAnswerIds TEXT, -- JSON: [1,2,3]
  isCorrect BOOLEAN,
  timeSpentSeconds INTEGER,
  answeredAt DATETIME,
  
  FOREIGN KEY (sessionId) REFERENCES test_sessions(id)
);
```

---

## 🎨 UI/UX Решение

### Вариант 1: Dialog при старте (РЕКОМЕНДУЕТСЯ ✅)

**Где:** На экране `RosAviaTestScreen` (главный экран тестирования)

**Когда:** Пользователь нажимает "Тренировочный режим" или "Стандартный тест"

**UI:**
```
┌─────────────────────────────────┐
│  Продолжить тестирование?       │
├─────────────────────────────────┤
│                                 │
│ Вы начали тест:                 │
│ 📚 Название категорий           │
│ ⏱️  Прошло: 15 минут            │
│ ❓ Осталось: 8 из 20 вопросов   │
│                                 │
├─────────────────────────────────┤
│ [Начать с начала] [Продолжить] │
└─────────────────────────────────┘
```

**Преимущества:**
- ✅ Явный выбор у пользователя
- ✅ Не путает новый тест с продолжением
- ✅ Показывает прогресс
- ✅ Works для обоих режимов (training/standard)

**Код логики:**
```dart
Future<TestSessionAction?> checkActiveSession({
  required int certificateTypeId,
  required String testMode,
}) async {
  // Ищем активную сессию
  final session = await db.getActiveTestSession(
    certificateTypeId: certificateTypeId,
    testMode: testMode,
  );
  
  if (session != null && session.status == 'in_progress') {
    // Показываем dialog
    return showResumeDialog(session);
  }
  
  return null; // Начать новый тест
}

enum TestSessionAction {
  resume,      // Продолжить старый тест
  startNew,    // Начать новый
}
```

---

### Вариант 2: Bottom Sheet при выборе категорий (АЛЬТЕРНАТИВА)

**Где:** На экране `SelectTopicsScreen` после выбора категорий

**Когда:** Пользователь нажимает "Начать тестирование"

**Преимущества:**
- Более контекстный
- Видны выбранные категории
- Можно изменить выбор перед продолжением

**Недостатки:**
- Дополнительный экран
- Может запутать пользователя

---

## 🏗️ Архитектура - Слои

### 1. **Domain Layer** (entities, use cases)

```dart
// Entity
class TestSession extends Equatable {
  final int id;
  final int certificateTypeId;
  final String testMode; // 'training' | 'standard'
  final Set<int> selectedCategoryIds;
  final int currentQuestionId;
  final int currentQuestionIndex;
  final TestSessionStatus status; // in_progress, completed
  final DateTime startedAt;
  final Duration totalTime;
  
  // Вычисляемые поля
  int get remainingQuestions => totalQuestions - answeredQuestions;
  int get answeredQuestions => answers.length;
  
  const TestSession({...});
}

enum TestSessionStatus { inProgress, completed, abandoned }

// Use Cases
class ResumeTestSessionUseCase {
  Future<TestSession> getActiveSession({
    required int certificateTypeId,
    required String testMode,
  }) async {
    return repository.getActiveSession(...);
  }
}

class SaveTestAnswerUseCase {
  Future<void> saveAnswer({
    required int sessionId,
    required int questionId,
    required List<int> selectedAnswerIds,
    required bool isCorrect,
  }) async {
    return repository.saveAnswer(...);
  }
}
```

### 2. **Data Layer** (repositories, database, API)

```dart
// Repository
class TestSessionRepository {
  Future<TestSession?> getActiveSession({
    required int certificateTypeId,
    required String testMode,
  }) async {
    // Ищем в БД последнюю незавершенную сессию
    return db.testSessions
      .where((s) => 
        s.certificateTypeId == certificateTypeId &&
        s.testMode == testMode &&
        s.status == 'in_progress'
      )
      .orderByDesc('lastAnswerAt')
      .getSingleOrNull();
  }

  Future<void> createTestSession({
    required int certificateTypeId,
    required String testMode,
    required Set<int> categoryIds,
  }) async {
    await db.testSessions.insert(TestSessionCompanion(
      certificateTypeId: Value(certificateTypeId),
      testMode: Value(testMode),
      selectedCategoryIds: Value(jsonEncode(categoryIds.toList())),
      status: const Value('in_progress'),
      startedAt: Value(DateTime.now()),
    ));
  }

  Future<void> saveAnswer({...}) async {
    // Сохраняем ответ в БД
    // Обновляем currentQuestionId и lastAnswerAt в session
  }

  Future<void> completeTestSession(int sessionId) async {
    await db.testSessions.update(sessionId).replace(
      status: 'completed',
      // остальные поля
    );
  }
}
```

### 3. **Presentation Layer** (screens, blocs, dialogs)

```dart
// Bloc/Cubit для управления сессией
class TestSessionCubit extends Cubit<TestSessionState> {
  final ResumeTestSessionUseCase resumeUseCase;
  
  Future<void> checkAndLoadSession({
    required int certificateTypeId,
    required String testMode,
  }) async {
    try {
      final session = await resumeUseCase.getActiveSession(
        certificateTypeId: certificateTypeId,
        testMode: testMode,
      );
      
      if (session != null) {
        emit(SessionFoundState(session));
      } else {
        emit(NoActiveSessionState());
      }
    } catch (e) {
      emit(SessionErrorState(e.toString()));
    }
  }

  Future<void> resumeSession(int sessionId) async {
    // Загружаем все данные сессии
    // Переходим на экран вопросов с нужной позицией
  }

  Future<void> startNewSession({...}) async {
    // Создаем новую сессию
  }
}

// Dialog
class ResumeTestDialog extends StatelessWidget {
  final TestSession session;
  final VoidCallback onResume;
  final VoidCallback onStartNew;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Продолжить тестирование?'),
      content: Column(
        children: [
          Text('Категории: ${session.categoryNames.join(", ")}'),
          Text('Прошло: ${formatDuration(session.totalTime)}'),
          Text('Осталось: ${session.remainingQuestions}/${session.totalQuestions} вопросов'),
        ],
      ),
      actions: [
        TextButton(onPressed: onStartNew, child: Text('Начать с начала')),
        ElevatedButton(onPressed: onResume, child: Text('Продолжить')),
      ],
    );
  }
}

// Screen
class RosAviaTestScreen extends StatefulWidget {
  @override
  _RosAviaTestScreenState createState() => _RosAviaTestScreenState();
}

class _RosAviaTestScreenState extends State<RosAviaTestScreen> {
  @override
  void initState() {
    super.initState();
    // При загрузке экрана проверяем активную сессию
    context.read<TestSessionCubit>().checkAndLoadSession(...);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestSessionCubit, TestSessionState>(
      builder: (context, state) {
        return state.map(
          sessionFound: (session) {
            // Показываем dialog
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) => ResumeTestDialog(
                  session: session.session,
                  onResume: () {
                    context.read<TestSessionCubit>().resumeSession(session.session.id);
                    Navigator.pop(context);
                    // Переход на вопрос
                  },
                  onStartNew: () {
                    context.read<TestSessionCubit>().startNewSession(...);
                    Navigator.pop(context);
                  },
                ),
              );
            });
            return TrainingModesScreen(); // Обычный экран
          },
          noActiveSession: (_) => TrainingModesScreen(),
          error: (_) => ErrorWidget(),
        );
      },
    );
  }
}
```

---

## 🔄 Различие для Training vs Standard

### Training Mode (Тренировочный)
- ✅ Показывает ответ сразу
- ✅ Можно пропустить вопрос
- ✅ Нет ограничения по времени
- ✅ Можно вернуться на пред. вопрос
- **Resume:** Да, продолжить можно

### Standard Test (Стандартный тест)
- ✅ Правильный ответ видно только после теста
- ✅ Нельзя пропустить вопрос
- ✅ Есть таймер
- ✅ Нет навигации назад
- **Resume:** Да, но с кэшем ответов

```dart
class QuestionScreen extends StatelessWidget {
  final bool isTrainingMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isTrainingMode && selectedAnswer != null)
          _buildAnswerExplanation() // В тренировке показываем сразу
        else if (!isTrainingMode && isTestCompleted)
          _buildAnswerExplanation(), // В стандарте только после
      ],
    );
  }
}
```

---

## 📋 Таймлайн имплементации

**Sprint 1 (1 неделя):**
- [ ] Создать entities и use cases (Domain)
- [ ] Обновить БД (drift migrations)
- [ ] Реализовать repository (Data)
- [ ] Создать Cubit (Presentation)

**Sprint 2 (1 неделя):**
- [ ] Dialog UI
- [ ] Интеграция с существующим экраном
- [ ] Сохранение ответов в БД
- [ ] Тестирование resume логики

---

## ✅ Решение: ВАРИАНТ 1 (Dialog)

**Рекомендую именно эту архитектуру:**

1. ✅ **Четкое разделение ответственности** (Domain/Data/Presentation)
2. ✅ **Явный UX** - пользователь выбирает
3. ✅ **Работает для обоих режимов** (training/standard)
4. ✅ **Легко тестировать** (use cases отделены)
5. ✅ **Масштабируемо** (легко добавить analytics, notifications и т.д.)

**Алтернатива (Вариант 2) - Bottom Sheet:**
- Может быть вспомогательной на экране выбора категорий
- Позволяет изменить категории перед продолжением

---

## 🎁 Бонус: Analytics Events
```dart
// Когда пользователь выбирает "Продолжить"
analytics.logEvent('test_session_resumed', {
  'certificate_type': certificateTypeId,
  'test_mode': testMode,
  'time_since_start_seconds': session.totalTime.inSeconds,
  'questions_answered': session.answeredQuestions,
});

// Когда выбирает "Начать с начала"
analytics.logEvent('test_session_restarted', {
  'certificate_type': certificateTypeId,
  'test_mode': testMode,
});
```

---

# ✅ РЕАЛИЗОВАННОЕ РЕШЕНИЕ (Финальная версия)

## 📍 Архитектура потока

```
Кнопка "Тестирование" (learning_screen.dart, test_my_self_widget.dart)
  ↓
startTestingFlow()
  ├─ checkActiveSessionAny() → ищет ЛЮБУЮ активную сессию
  │
  ├─ ЕСЛИ ЕСТь активная сессия:
  │  ├─ Получаем данные о сертификате из БД
  │  ├─ Показываем ResumeTestDialog
  │  ├─ Пользователь выбирает:
  │  │  ├─ "Продолжить" → resumeSession() → TestByModeScreen
  │  │  └─ "Начать заново" → testingModeDialog()
  │
  └─ ЕСЛИ НЕТ активной сессии:
     → testingModeDialog() (выбор режима)
        ↓
        selectTopics() (выбор категорий)
        ↓
        createNewSession() (создание новой сессии)
        ↓
        TestByModeScreen (начало теста)
```

## 🛠️ Добавленные методы

### 1. БД (`lib/core/data/database/app_db.dart`)

```dart
/// Получить ЛЮБУЮ активную сессию (без фильтра по режиму)
Future<TestSession?> getAnyActiveTestSession() async {
  return (select(testSessions)
        ..where((t) => t.status.equals('in_progress'))
        ..orderBy([(t) => OrderingTerm(expression: t.lastAnswerAt, mode: OrderingMode.desc))])
      .getSingleOrNull();
}
```

### 2. Cubit (`lib/learning/ros_avia_test/presentation/bloc/test_session_cubit.dart`)

```dart
/// Проверить есть ли ЛЮБАЯ активная сессия (без привязки к режиму)
Future<void> checkActiveSessionAny() async {
  try {
    emit(state.copyWith(isLoading: true));
    final session = await db.getAnyActiveTestSession();
    if (session != null) {
      emit(state.copyWith(activeSession: session, isLoading: false, hasActiveSession: true));
    } else {
      emit(state.copyWith(isLoading: false, hasActiveSession: false));
    }
  } catch (e) {
    emit(state.copyWith(error: e.toString(), isLoading: false));
  }
}
```

### 3. Обёртка функция (`lib/core/presentation/widgets/modals_and_bottomSheets.dart`)

```dart
Future<void> startTestingFlow({required BuildContext context}) async {
  final sessionCubit = getIt<TestSessionCubit>();
  
  // Проверяем есть ли активная сессия
  await sessionCubit.checkActiveSessionAny();
  
  if (!context.mounted) return;
  
  if (sessionCubit.state.hasActiveSession && sessionCubit.state.activeSession != null) {
    // Есть активная сессия - показываем диалог продолжения
    final parentContext = context;
    final activeSession = sessionCubit.state.activeSession!;
    
    // Получить данные о сертификате из БД
    final certificateSettings = await getIt<AppDb>().getSettingsForCertificate(
      certificateTypeId: activeSession.certificateTypeId
    );
    final certificateTitle = certificateSettings?.title ?? 'Тестирование';
    final certificateImage = certificateSettings?.image ?? '';
    
    if (!parentContext.mounted) return;
    
    await showDialog<void>(
      context: parentContext,
      barrierDismissible: true,
      builder: (dialogContext) => ResumeTestDialog(
        activeSession: activeSession,
        certificateTitle: certificateTitle,
        certificateImage: certificateImage,
        onResume: () {
          Navigator.pop(dialogContext);
          sessionCubit.resumeSession(activeSession.id);
          parentContext.router.push(TestByModeRoute(typeCertificateId: activeSession.certificateTypeId));
        },
        onStartNew: () {
          Navigator.pop(dialogContext);
          if (parentContext.mounted) {
            testingModeDialog(context: parentContext);
          }
        },
        onCancel: () => Navigator.pop(dialogContext),
      ),
    );
  } else {
    // Нет активной сессии - показываем выбор режима
    if (context.mounted) {
      testingModeDialog(context: context);
    }
  }
}
```

## 📝 Обновленные файлы

### 1. `lib/learning/learning_screen.dart`
- Изменена кнопка "Тестирование" с `testingModeDialog(context: context)` на `startTestingFlow(context: context)`

### 2. `lib/learning/ros_avia_test/presentation/widgets/test_my_self_widget.dart`
- Изменена кнопка "Тестирование" с `testingModeDialog(context: context)` на `startTestingFlow(context: context)`

### 3. `lib/learning/ros_avia_test/presentation/pages/test_by_mode_screen.dart`
- Удален метод `_initializeTestSession()`
- Упрощена инициализация `initState()` - просто получаем ID сессии из `TestSessionCubit.state`
- Удален неиспользуемый импорт `helper.dart`

### 4. `lib/core/presentation/widgets/modals_and_bottomSheets.dart`
- Добавлена функция `startTestingFlow()`
- Обновлена функция `selectTopics()` - добавлено создание новой сессии перед переходом на `TestByModeScreen`

### 5. `lib/core/data/database/app_db.dart`
- Добавлен метод `getAnyActiveTestSession()`

### 6. `lib/learning/ros_avia_test/presentation/bloc/test_session_cubit.dart`
- Добавлен метод `checkActiveSessionAny()`

## 🔄 Полный поток с примером

1. **Пользователь нажимает кнопку "Тестирование"** на главном экране обучения
2. **startTestingFlow() проверяет:**
   - Есть ли незавершённые сессии
   - Если есть - показывает `ResumeTestDialog` с прогрессом
   - Если нет - показывает `TestingModeDialog` для выбора режима

3. **Если выбрал "Продолжить":**
   - Вызывает `resumeSession(sessionId)`
   - Переходит на `TestByModeScreen` с тем же режимом и категориями
   - На экране загружаются вопросы, и пользователь продолжает с последнего пройденного вопроса

4. **Если выбрал "Начать заново":**
   - Показывает `TestingModeDialog` для выбора режима тестирования
   - Затем `selectTopics()` для выбора категорий
   - В `selectTopics()` создаётся новая сессия через `createNewSession()`
   - Переходит на `TestByModeScreen` с новой сессией

5. **На TestByModeScreen:**
   - Просто загружает ID сессии из `TestSessionCubit.state`
   - Сессия уже существует (либо загружена, либо создана)
   - Пользователь проходит тест, ответы сохраняются в `TestAnswers`
   - Прогресс обновляется в `TestSessions`

## ✅ Преимущества решения

- ✅ **Просто логика:** Проверка активной сессии происходит ДО входа на тестовый экран
- ✅ **Явный UX:** Пользователь видит диалог с выбором
- ✅ **Работает для всех режимов:** Training и Standard
- ✅ **БЕЗ конфликтов:** Нет двойной проверки сессии
- ✅ **Полная информация:** ResumeTestDialog получает данные о сертификате из БД
- ✅ **Чистая архитектура:** Логика разделена правильно между слоями

---

# 🔧 ФИНАЛЬНОЕ ИСПРАВЛЕНИЕ: Использование ID вопросов вместо индексов

## 🚀 Проблема с индексами

**Исходная проблема:**
- Пользователь ответил на вопросы с индексами [0, 1, 2]
- Закрыл приложение
- Вернулся и вопросы загружаются **перемешанные** (mixQuestions = true)
- Индекс 2 теперь указывает на **совсем другой вопрос** ❌

**Решение:**
Вместо `currentQuestionIndex` теперь используем **Set<int> ID отвеченных вопросов**

## ✅ Новая логика

### 1. При resume - загружаем ID отвеченных вопросов

```dart
/// Загрузить ID отвеченных вопросов при resume
Future<void> _loadAnsweredQuestionIds(TestSessionCubit sessionCubit) async {
  if (_sessionId != null) {
    _answeredQuestionIds = await sessionCubit.getAnsweredQuestionIds(_sessionId!);
  }
}
```

### 2. Фильтруем вопросы - показываем только неотвеченные

```dart
/// Фильтруем вопросы - показываем только те, на которые не ответили
final filteredQuestions = _answeredQuestionIds.isEmpty
    ? value.questionsWithAnswers
    : value.questionsWithAnswers
        .where((q) => !_answeredQuestionIds.contains(q.questionId))
        .toList();
```

### 3. При ответе - добавляем ID в список отвеченных

```dart
// Добавить ID вопроса в список отвеченных
_answeredQuestionIds.add(question.questionId);
```

## 🔄 Полный поток (исправленный)

**Сценарий: Resume с перемешиванием вопросов:**

1. ✅ Пользователь ответил на 3 вопроса (ID: 5, 8, 12)
2. ✅ Закрыл приложение
3. ✅ Вернулся → `startTestingFlow()` находит активную сессию
4. ✅ Показываем `ResumeTestDialog`
5. ✅ Нажимает "Продолжить"
6. ✅ Загружаем ID отвеченных вопросов: {5, 8, 12}
7. ✅ Загружаем вопросы (они перемешаны: 20, 5, 15, 8, 3, 12, ...)
8. ✅ Фильтруем → оставляем только: {20, 15, 3, ...} (те, на которые не ответили)
9. ✅ **Показываем первый неотвеченный вопрос (ID 20)** ✅
10. ✅ Пользователь ответил на вопрос 20
11. ✅ Добавляем 20 в `_answeredQuestionIds`
12. ✅ При нажатии "Следующий" → фильтруем снова → показываем следующий неотвеченный

## 🛠️ Добавленные методы

### 1. Cubit - получение ID отвеченных вопросов

```dart
/// Получить Set ID уже отвеченных вопросов в сессии
Future<Set<int>> getAnsweredQuestionIds(int sessionId) async {
  try {
    final answers = await db.getSessionAnswers(sessionId);
    return answers.map((a) => a.questionId).toSet();
  } catch (e) {
    emit(state.copyWith(error: e.toString()));
    return {};
  }
}
```

### 2. Screen - фильтрация вопросов

- Добавлен `Set<int> _answeredQuestionIds` для хранения ID отвеченных вопросов
- Добавлена `_loadAnsweredQuestionIds()` для загрузки ID при resume
- Вопросы фильтруются в двух местах:
  1. При выборе текущего вопроса
  2. При клике "Следующий"
- При сохранении ответа добавляется ID в `_answeredQuestionIds`

## ✅ Преимущества

- ✅ **Работает с перемешиванием:** Порядок вопросов не важен
- ✅ **Правильно показывает неотвеченные:** Фильтрация по ID, а не по индексу
- ✅ **Безопасно при resume:** Даже если вопросы загружены в другом порядке
- ✅ **Масштабируемо:** Работает для любого количества вопросов и сессий
