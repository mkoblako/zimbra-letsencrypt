zimbra-letsencrypt.sh --register-unsafely-without-email - Генерирует/обновляет letsencrypt сертификаты.
Для использования требуется выполнить:
yum install git epel-release
yum install certbot
Поместить все файлы репозитория по пути:
/usr/bin/zimbra-letsencrypt/
Запустить zimbra-letsencrypt.sh --register-unsafely-without-email от пользователя с правами sudo
После генерации и деплоя сертификата в крон добавиться задача по обновлению сертификата.
