# Mailpile Docker image

A minimal Mailpile Docker image based on Alpine Linux.

## Usage

```
docker run -d --name mailpile -p 80:80 rroemhild/mailpile
```

Bind volume `/root/.local/share/Mailpile` and `/root/.gnupg` for persistent storage:

```
docker run -d --name mailpile -p 80:80 -v /some/local/path:/root/.local/share/Mailpile -v /another/local/path:/root/.gnupg rroemhild/mailpile
```
