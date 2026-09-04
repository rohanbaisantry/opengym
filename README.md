# openGym

Personal gym tracker — standalone PWA, all data on your phone.

## Setup

```bash
npm install
npm run fetch-media   # one-time: downloads exercise images & GIFs (~140 MB)
npm run dev
```

## Install on your phone

```bash
npm run build
```

Deploy `dist/` to any HTTPS static host, then add to home screen:
- **Android:** Chrome → Add to Home screen
- **iPhone:** Safari → Share → Add to Home Screen

Export JSON backups from Settings occasionally.
