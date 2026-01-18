// Firebase Cloud Messaging Service Worker для веба
// Этот файл нужен для получения push-уведомлений в фоновом режиме

importScripts('https://www.gstatic.com/firebasejs/10.7.1/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.7.1/firebase-messaging-compat.js');

// Конфигурация Firebase из firebase_options.dart (веб)
const firebaseConfig = {
  apiKey: 'AIzaSyAfxnnGLqc5c2F0yFu421Jh9YM_Ed2Dj5I',
  appId: '1:591230040091:web:0a26e42135d38dce37a0be',
  messagingSenderId: '591230040091',
  projectId: 'aviapoint',
  authDomain: 'aviapoint.firebaseapp.com',
  storageBucket: 'aviapoint.firebasestorage.app',
};

// Инициализация Firebase
firebase.initializeApp(firebaseConfig);

// Получение экземпляра Messaging
const messaging = firebase.messaging();

// Обработка уведомлений в фоновом режиме (когда приложение закрыто)
messaging.onBackgroundMessage((payload) => {
  console.log('[firebase-messaging-sw.js] Получено фоновое сообщение:', payload);
  
  const notificationTitle = payload.notification?.title || 'AviaPoint';
  const notificationOptions = {
    body: payload.notification?.body || '',
    icon: '/icons/Icon-512.png',
    badge: '/icons/Icon-512.png',
    tag: payload.data?.type || 'default',
    data: payload.data || {},
  };

  return self.registration.showNotification(notificationTitle, notificationOptions);
});

// Обработка клика по уведомлению в фоновом режиме
self.addEventListener('notificationclick', (event) => {
  console.log('[firebase-messaging-sw.js] Клик по уведомлению:', event.notification);
  
  event.notification.close();

  const data = event.notification.data || {};
  const type = data.type;
  let url = '/'; // URL по умолчанию

  // Определяем URL в зависимости от типа уведомления
  if (type === 'new_booking' || type === 'booking_confirmed' || type === 'booking_cancelled' || type === 'flight_reminder') {
    const flightId = data.flight_id;
    if (flightId) {
      url = `/on-the-way/flights/${flightId}`;
    }
  } else if (type === 'listing_unpublished') {
    const listingId = data.listing_id;
    if (listingId) {
      url = `/market/aircraft/${listingId}`;
    }
  }

  // Открываем или фокусируем окно
  event.waitUntil(
    clients.matchAll({ type: 'window', includeUncontrolled: true }).then((clientList) => {
      // Если окно уже открыто, фокусируем его
      for (const client of clientList) {
        if (client.url === url && 'focus' in client) {
          return client.focus();
        }
      }
      // Если окно не открыто, открываем новое
      if (clients.openWindow) {
        return clients.openWindow(url);
      }
    })
  );
});
