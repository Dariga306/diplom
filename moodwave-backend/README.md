# MoodWave Backend API

## Quick Start
```bash
cd moodwave-backend
docker-compose up -d
# API runs at http://localhost:8000
# Swagger docs: http://localhost:8000/docs
```

## Environment Variables
See `.env.example` for all required variables.

## API Overview
- `POST /auth/register` creates a user account and sends a verification code.
- `POST /auth/login` authenticates a user and returns JWT tokens.
- `POST /auth/refresh` exchanges a refresh token for fresh tokens.
- `POST /auth/verify-email` verifies the six-digit email code.
- `POST /auth/resend-verification` resends an email verification code.
- `POST /auth/forgot-password` starts the password reset flow.
- `POST /auth/verify-reset-code` validates a reset code and returns a reset token.
- `POST /auth/reset-password` saves a new password using a reset token.
- `GET /auth/check-username` checks username availability.
- `GET /users/me` returns the authenticated user's profile.
- `PUT /users/me` updates editable profile fields.
- `PUT /users/me/fcm-token` stores the device push token.
- `POST /users/me/genres` saves onboarding genre selections.
- `POST /users/me/moods` saves onboarding mood selections.
- `GET /users/me/stats` returns listening and friend stats.
- `GET /users/search` searches public user profiles.
- `GET /users/{id}` returns a visible public profile.
- `DELETE /users/me` deletes the current account and related data.
- `GET /taste-vector/me` returns the user's taste vector.
- `GET /search` performs global search across tracks, users, and playlists.
- `GET /search/trending` returns trending search terms.
- `GET /search/users` searches users from the search router.
- `GET /search/playlists` searches playlists from the search router.
- `GET /tracks/search` searches tracks.
- `GET /tracks/charts` returns chart-style track results.
- `GET /tracks/recommendations` returns personalized recommendations.
- `POST /tracks/{id}/play` records a play event.
- `POST /tracks/{id}/like` records a like or dislike event.
- `POST /tracks/{id}/skip` records a skip event.
- `GET /playlists` lists the user's playlists.
- `POST /playlists` creates a playlist.
- `GET /playlists/{id}` returns playlist details.
- `PUT /playlists/{id}` updates playlist metadata.
- `DELETE /playlists/{id}` deletes a playlist.
- `POST /playlists/{id}/tracks` adds a track to a playlist.
- `DELETE /playlists/{id}/tracks/{spotify_id}` removes a track from a playlist.
- `POST /playlists/{id}/collaborate` adds a collaborator to a playlist.
- `GET /weather/current` returns current weather for a city.
- `GET /weather/playlist` returns playlists based on current weather.
- `GET /charts/city` returns top tracks for a city.
- `GET /matches` returns match candidates.
- `POST /matches/{id}/like` likes a candidate and may create a mutual match.
- `POST /matches/{id}/skip` skips a candidate.
- `GET /matches/confirmed` returns mutual matches.
- `GET /matches/taste-vector` returns raw match-vector data.
- `GET /chats` lists chat threads.
- `GET /chats/{match_id}/messages` returns recent chat messages.
- `POST /chats/{match_id}/send-text` sends a text message.
- `POST /chats/{match_id}/send-track` sends a track share.
- `POST /chats/{match_id}/react` adds a reaction to a message.
- `GET /friends` lists accepted friends.
- `GET /friends/activity` returns friends with now-playing activity.
- `POST /friends/{id}/request` sends a friend request.
- `POST /friends/{id}/accept` accepts a friend request.
- `DELETE /friends/{id}` removes a friend.
- `POST /users/{id}/block` blocks a user.
- `POST /users/{id}/report` submits a user report.
- `POST /rooms/create` creates a listening room.
- `GET /rooms/active` lists active public rooms.
- `GET /rooms/{id}` returns room details.
- `POST /rooms/{id}/join-request` sends a room join request.
- `POST /rooms/{id}/join-approve` approves a join request.
- `POST /rooms/{id}/join-decline` declines a join request.
- `POST /rooms/{id}/close` closes a room.
- `GET /health` returns API health status.

## Authentication
MoodWave uses JWT authentication.

1. `POST /auth/register` creates the account and returns an access token plus refresh token.
2. `POST /auth/verify-email` marks the account as verified using the six-digit code sent by email.
3. `POST /auth/login` can be used again at any time to get a fresh token pair.
4. Send `Authorization: Bearer <access_token>` on protected requests.
5. When the access token expires, call `POST /auth/refresh` with the refresh token.

Unverified users can log in, but they cannot access matches, chats, or rooms until email verification is complete.

## WebSocket
Listening rooms use a short-lived room WebSocket token.

1. Host calls `POST /rooms/create` and receives `room_id`, `ws_token`, and `ws_url`.
2. Guest calls `POST /rooms/{id}/join-request`.
3. Host calls `POST /rooms/{id}/join-approve` to issue a guest `ws_token`.
4. Client connects to `WS /ws/rooms/{room_id}?token=...`.
5. On connect, the server sends a `sync` event with the current playback state.
6. Host playback events such as `play`, `pause`, `seek`, `track_change`, and `heartbeat` are broadcast to connected guests.

Swagger documentation is available at `http://localhost:8000/docs`.
