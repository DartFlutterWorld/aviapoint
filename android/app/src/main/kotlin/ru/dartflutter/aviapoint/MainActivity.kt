package ru.dartflutter.aviapoint

import android.content.res.Configuration
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
        // Flutter автоматически обработает изменение конфигурации,
        // так как orientation указан в configChanges
        // Это заставит MediaQuery обновиться и виджеты перестроятся
    }
}
