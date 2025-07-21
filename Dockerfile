FROM python:3.12-slim

# Устанавливаю рабочую директорию
WORKDIR /app

# Копирую все файлы проекта в контейнер
COPY requirements.txt .

# Устанавливаю зависимости 
RUN pip install --no-cache-dir -r requirements.txt

# Открываю порт 5000
EXPOSE 5000

# Запускаю приложение с помощью uvicorn, делая его доступным по сети
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]