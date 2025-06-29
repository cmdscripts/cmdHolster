# Holster Script (DE/EN)

## 🇩🇪 Deutsch

Ein einfaches Holster-Auswahlmenü für ESX mit `ox_lib`.
Du kannst über `/holster` dein Holster wählen (Gürtel, Bein, Schulter) – die Kleidung wird direkt am Ped geändert.

### 📦 Installation
1. Ziehe den `cmdHolster`-Ordner in deinen `resources`.
2. In deiner `server.cfg`:
```
ensure HolsterScript
```

### 🌐 Sprache einstellen
Die Sprache wird über eine Convar eingestellt:

```
set holster:locale de   # oder en
```

### 🕹️ Befehle
- `/holster` → Menü zur Holsterwahl öffnen
- `/getcloth` → Kleidung aktuell anzeigen (für Dev-Zwecke)

### 🛠️ Konfiguration
- Befehlsnamen lassen sich in `config.lua` unter `Config.Commands` ändern.
- Die Benachrichtigungen können über `Config.Notify` angepasst werden.
- Dauerhafte Speicherung des Holsters steuert `Config.PersistHolster`.

---

## 🇬🇧 English

A simple holster selection menu for ESX using `ox_lib`.
Use `/holster` to choose a holster style (belt, leg, shoulder) – it changes ped clothing directly.

### 📦 Installation
1. Drop the `cmdHolster` folder into your `resources`.
2. In your `server.cfg`:
```
ensure HolsterScript
```

### 🌐 Set language
Language is controlled via convar:

```
set holster:locale en   # or de
```

### 🕹️ Commands
- `/holster` → Open holster selection menu
- `/getcloth` → Print current clothing to F8 console (for developers)

### 🛠️ Configuration
- Command names can be changed via `Config.Commands` in `config.lua`.
- The notification function can be overwritten with `Config.Notify`.
- Set `Config.PersistHolster` to control if holsters are saved permanently.
