# MoodWave

Mood-based music discovery app — recommends tracks based on your mood, weather, and taste. Includes friends, matching, real-time listening rooms, and chat.

---

## Project Structure

```
diplom/
├── moodwave-backend/        # Python FastAPI backend
│   ├── app/
│   │   ├── routers/         # API endpoints (auth, music, playlists, chat, match, rooms…)
│   │   ├── models/          # Database models (SQLAlchemy)
│   │   ├── schemas/         # Request / response schemas (Pydantic)
│   │   ├── services/        # Business logic (Spotify, weather, matching, Firebase…)
│   │   └── main.py
│   ├── alembic/             # DB migrations
│   ├── Dockerfile
│   ├── docker-compose.yml
│   └── requirements.txt
│
└── diplom-frontend/         # Flutter mobile app (Android / iOS)
    └── lib/
        ├── screens/         # All app screens (login, home, player, chat, profile…)
        ├── services/        # API client (Dio)
        ├── providers/       # Auth state (Provider)
        └── widgets/
```

---

## Stack

| | |
|---|---|
| Mobile | Flutter 3 / Dart |
| Backend | Python 3.12 + FastAPI |
| Database | PostgreSQL 16 |
| Cache | Redis 7 |
| Auth | JWT |
| Realtime | WebSocket |
| Music | Spotify API |
| Weather | OpenWeatherMap |
| Infra | Docker Compose |

---

## Requirements

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Flutter SDK ≥ 3.0](https://docs.flutter.dev/get-started/install)
- Android emulator or physical device

---

## Running the Backend

#### 1. Get `.env` and `firebase-credentials.json`

You need two files inside `moodwave-backend/` — ask the project owner to send them.

#### 2. Start all services

```bash
cd moodwave-backend
docker compose up -d
```

Starts PostgreSQL (port 5434), Redis (6379), and the API (8000).

#### 3. Apply migrations

```bash
docker compose exec api alembic upgrade head
```

#### 4. Check it works

Open [http://localhost:8000/docs](http://localhost:8000/docs) — you should see the Swagger UI.

---

## Running the Frontend

#### 1. Install dependencies

```bash
cd diplom-frontend
flutter pub get
```

#### 2. Run

```bash
flutter run
```

> The app connects to `http://10.0.2.2:8000` by default (Android emulator localhost).
> Change the base URL in `lib/services/api_service.dart` if needed.

---

## Useful Commands

```bash
# Backend logs
docker compose logs -f api

# Stop backend
docker compose down

# Rebuild after changing requirements.txt
docker compose up -d --build
```
