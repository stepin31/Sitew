# Обход — Android-клиент (Rust-ядро + Kotlin UI + sing-box)

**Проверено:** Rust-ядро (`core/`), `cargo test` — 5/5 (парсинг vless/vmess/trojan/ss/hysteria2, подписки, конфиг, split tunneling).
**Не проверено:** Kotlin-приложение и стыковка с libbox (PlatformImpl.kt написан по исходникам sing-box v1.10.7) — в среде разработки нет Android SDK, первая сборка в Actions может потребовать правок.

## Сборка APK (GitHub Actions)
Загрузите папку в репозиторий на GitHub → вкладка Actions → build-apk → Run workflow. Через ~15 минут APK появится в Artifacts (obhod-apk). Ядро: sing-box v1.10.7.

## Сборка вручную
1. Установить Android Studio (SDK + NDK), Rust (`rustup`), Go.
2. `./build-rust.sh` — соберёт `.so` для трёх ABI.
3. Собрать `libbox.aar` из sing-box: `git clone https://github.com/SagerNet/sing-box && cd sing-box && make lib_android`,
   положить в `android/app/libs/libbox.aar`.
4. Открыть `android/` в Android Studio → Run.

## Функции
- Подписки по URL (base64/обычный список), ручное добавление ссылок, deeplink'и (`vless://`, `obhod://add?url=`), автообновление списка
- Протоколы: VLESS (Reality, XTLS-Vision), VMess, Trojan, Shadowsocks, Hysteria2; транспорты ws/grpc/httpupgrade/h2
- Пинг серверов, выбор сервера
- Роутинг: RU-домены и локальные адреса напрямую, остальное через прокси; свои списки доменов
- Split tunneling по приложениям (include/exclude)
- Foreground-уведомление с кнопкой «Отключить»

## Не сделано
QR-сканер, UI выбора приложений и настроек (поля есть в `Settings`), kill switch, чтение заголовков подписки
(`profile-title`, `subscription-userinfo`), JSON-подписки, geoip/geosite-правила.
