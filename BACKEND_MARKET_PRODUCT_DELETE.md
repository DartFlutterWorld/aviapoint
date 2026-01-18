# Backend API Specification: Удаление товара из маркета

## 📋 Обзор

Эта спецификация описывает API endpoint для удаления товара из маркета. При удалении товара также должны удаляться все связанные файлы изображений.

## 🗄️ База данных

### Таблица `market_products`

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
    location_type VARCHAR(50),
    
    -- Характеристики самолёта
    year INTEGER,
    flight_hours NUMERIC(10, 2),
    seats INTEGER,
    condition VARCHAR(50),
    
    is_active BOOLEAN DEFAULT TRUE,
    views_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

## 🔌 Endpoint

### DELETE `/api/market/products/{id}`

Удаляет товар из маркета. Удаление может выполнить только владелец товара (seller_id должен совпадать с ID текущего пользователя).

**Авторизация:** Требуется (Bearer token), только владелец товара

**Path Parameters:**
- `id` (required) - ID товара для удаления

**Request Headers:**
```
Authorization: Bearer <jwt_token>
```

**Response:**

**Успех (200 OK):**
```json
{
  "message": "Product deleted successfully"
}
```

**Ошибки:**
- `401 Unauthorized` - не авторизован
- `403 Forbidden` - пользователь не является владельцем товара
- `404 Not Found` - товар не найден
- `500 Internal Server Error` - ошибка при удалении

## 📝 Логика удаления на бэкенде

### Что нужно сделать:

1. **Проверка авторизации и прав:**
   - Проверить, что пользователь авторизован
   - Проверить, что `seller_id` товара совпадает с ID текущего пользователя

2. **Получить пути к файлам:**
   - Получить `main_image_url` из БД
   - Получить `additional_image_urls` из БД (массив JSONB)

3. **Удалить файлы с диска:**
   - Удалить основной файл изображения (если `main_image_url` не null)
   - Удалить все дополнительные файлы из массива `additional_image_urls`
   - Удалить директорию товара (если она существует)

4. **Удалить запись из БД:**
   - Удалить запись из таблицы `market_products`
   - Удалить связанные записи (если есть):
     - Записи из `user_favorite_products` (избранное)

### Пример реализации (Node.js/Express с PostgreSQL):

```javascript
// routes/market.js
router.delete('/api/market/products/:id', authenticateToken, async (req, res) => {
  const productId = parseInt(req.params.id);
  const userId = req.user.id; // из JWT токена
  
  const client = await pool.connect();
  
  try {
    await client.query('BEGIN');
    
    // 1. Получаем товар и проверяем права
    const productResult = await client.query(
      'SELECT seller_id, main_image_url, additional_image_urls FROM market_products WHERE id = $1',
      [productId]
    );
    
    if (productResult.rows.length === 0) {
      await client.query('ROLLBACK');
      return res.status(404).json({ error: 'Product not found' });
    }
    
    const product = productResult.rows[0];
    
    // Проверяем права доступа
    if (product.seller_id !== userId) {
      await client.query('ROLLBACK');
      return res.status(403).json({ error: 'You do not have permission to delete this product' });
    }
    
    // 2. Собираем все пути к файлам
    const filesToDelete = [];
    
    if (product.main_image_url) {
      filesToDelete.push(product.main_image_url);
    }
    
    if (product.additional_image_urls) {
      const additionalUrls = Array.isArray(product.additional_image_urls) 
        ? product.additional_image_urls 
        : JSON.parse(product.additional_image_urls);
      filesToDelete.push(...additionalUrls);
    }
    
    // 3. Удаляем связанные записи
    await client.query(
      'DELETE FROM user_favorite_products WHERE product_id = $1',
      [productId]
    );
    
    // 4. Удаляем запись из БД
    await client.query(
      'DELETE FROM market_products WHERE id = $1',
      [productId]
    );
    
    // 5. Удаляем файлы с диска
    const fs = require('fs').promises;
    const path = require('path');
    
    for (const fileUrl of filesToDelete) {
      if (fileUrl) {
        // Преобразуем URL в путь к файлу
        // /market/products/123/photo.jpg → /app/public/market/products/123/photo.jpg
        const filePath = path.join(process.cwd(), 'public', fileUrl);
        
        try {
          await fs.unlink(filePath);
          console.log(`Deleted file: ${filePath}`);
        } catch (err) {
          // Файл может не существовать, это не критично
          console.warn(`File not found: ${filePath}`, err);
        }
      }
    }
    
    // 6. Удаляем директорию товара (если она существует)
    const productDir = path.join(process.cwd(), 'public', 'market', 'products', productId.toString());
    try {
      await fs.rmdir(productDir, { recursive: true });
      console.log(`Deleted directory: ${productDir}`);
    } catch (err) {
      // Директория может не существовать или быть не пустой, это не критично
      console.warn(`Directory not found or not empty: ${productDir}`, err);
    }
    
    await client.query('COMMIT');
    res.status(200).json({ message: 'Product deleted successfully' });
    
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Error deleting product:', error);
    res.status(500).json({ error: 'Failed to delete product' });
  } finally {
    client.release();
  }
});
```

### Пример реализации (Dart/Server):

```dart
// routes/market_route.dart
@Route.delete('/api/market/products/:id')
Future<Response> deleteProduct(Request request) async {
  // Получаем пользователя из сессии/JWT
  final userId = request.context['userId'] as int?;
  if (userId == null) {
    return Response.unauthorized(body: {'error': 'Unauthorized'});
  }
  
  final productId = int.tryParse(request.params['id'] ?? '');
  if (productId == null) {
    return Response.badRequest(body: {'error': 'Invalid product ID'});
  }
  
  final db = request.context['db'] as Database;
  
  try {
    await db.transaction((txn) async {
      // 1. Получаем товар и проверяем права
      final productResult = await txn.query(
        'SELECT seller_id, main_image_url, additional_image_urls FROM market_products WHERE id = ?',
        [productId],
      );
      
      if (productResult.isEmpty) {
        throw Exception('Product not found');
      }
      
      final product = productResult.first;
      final sellerId = product['seller_id'] as int;
      
      // Проверяем права доступа
      if (sellerId != userId) {
        throw Exception('You do not have permission to delete this product');
      }
      
      // 2. Собираем все пути к файлам
      final filesToDelete = <String>[];
      
      if (product['main_image_url'] != null) {
        filesToDelete.add(product['main_image_url'] as String);
      }
      
      if (product['additional_image_urls'] != null) {
        final additionalUrls = jsonDecode(product['additional_image_urls'] as String) as List;
        filesToDelete.addAll(additionalUrls.map((e) => e.toString()));
      }
      
      // 3. Удаляем связанные записи
      await txn.execute(
        'DELETE FROM user_favorite_products WHERE product_id = ?',
        [productId],
      );
      
      // 4. Удаляем запись из БД
      await txn.execute(
        'DELETE FROM market_products WHERE id = ?',
        [productId],
      );
      
      // 5. Удаляем файлы с диска
      final directory = Directory('public');
      for (final fileUrl in filesToDelete) {
        if (fileUrl.isNotEmpty) {
          final file = File(path.join(directory.path, fileUrl));
          if (await file.exists()) {
            await file.delete();
            print('Deleted file: ${file.path}');
          }
        }
      }
      
      // 6. Удаляем директорию товара
      final productDir = Directory(path.join(directory.path, 'market', 'products', productId.toString()));
      if (await productDir.exists()) {
        await productDir.delete(recursive: true);
        print('Deleted directory: ${productDir.path}');
      }
    });
    
    return Response.ok({'message': 'Product deleted successfully'});
  } on Exception catch (e) {
    if (e.toString().contains('not found')) {
      return Response.notFound(body: {'error': 'Product not found'});
    }
    if (e.toString().contains('permission')) {
      return Response.forbidden(body: {'error': 'You do not have permission to delete this product'});
    }
    print('Error deleting product: $e');
    return Response.internalServerError(
      body: {'error': 'Failed to delete product'},
    );
  }
}
```

## 📁 Структура файлов

Файлы товаров хранятся в следующей структуре:

```
/app/public/
  └── market/
      └── products/
          └── {product_id}/
              ├── main_photo.jpg          (основное фото)
              ├── photo1.jpg              (дополнительные)
              ├── photo2.jpg
              └── photo3.jpg
```

При удалении товара:
1. Удаляются все файлы из директории `{product_id}/`
2. Удаляется сама директория `{product_id}/`

## ⚠️ Важные моменты

1. **Безопасность:**
   - Только владелец товара может удалить свой товар
   - Проверка прав должна выполняться до любых операций с файлами

2. **Транзакции:**
   - Все операции (удаление из БД, удаление файлов) должны выполняться в транзакции
   - При ошибке удаления файлов транзакция должна откатываться

3. **Обработка ошибок:**
   - Если файл не найден, это не должно блокировать удаление записи из БД
   - Логируйте все ошибки для отладки

4. **Производительность:**
   - Удаление файлов может быть медленным, рассмотрите возможность асинхронной обработки
   - Для больших объемов данных можно использовать очереди задач

## 🔄 Связанные операции

При удалении товара также должны быть удалены:
- Записи из `user_favorite_products` (избранное пользователей)
- Все файлы изображений товара
- Директория товара
