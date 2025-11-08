dart pub global activate flutterfire_cli
flutterfire configure   

fvm dart pub run build_runner build --delete-conflicting-outputs

# Генерация иконок для андройд
https://iconnaut.com/android.php#ready
flutter build web --release

# 1. Локально собираешь production версию

flutter build web --release --dart-define=isDevelopment=false

# 2. Копируешь на VPS
scp -r build/web/* root@83.166.246.205:/home/aviapoint/
