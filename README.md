# 🇺🇸 / 🇵🇱 MY_AUTOSTART_SETS

Welcome to **MY_AUTOSTART_SETS**. This repository houses professional Bash automation scripts designed to instantly deploy mission-critical "Command Center" environments on Ubuntu systems.

The core script, `mdc2_autostart.sh`, acts as a **Bilingual Automation Architect**, orchestrating the launch of GNOME Terminal with 10 specialized tabs, activating Python virtual environments, securing SSH connections with dynamic title logic, and launching essential GUI tools (PyCharm, Text Editor, Firefox) in a single click.

<details>

<summary>🇵🇱 [Kliknij Trójkąt Po Lewej Stronie Aby Rozwinąć Opis w Języku Polskim]</summary>

# 🇵🇱 MY_AUTOSTART_SETS

Witaj w **MY_AUTOSTART_SETS**. To repozytorium zawiera profesjonalne skrypty automatyzacji Bash, zaprojektowane do natychmiastowego wdrażania krytycznych środowisk typu "Command Center" na systemach Ubuntu.

Główny skrypt, `mdc2_autostart.sh`, działa jako **Dwujęzyczny Architekt Automatyzacji**, koordynując uruchomienie Terminala GNOME z 10 wyspecjalizowanymi zakładkami, aktywując wirtualne środowiska Python, zabezpieczając połączenia SSH dynamiczną logiką tytułów oraz uruchamiając niezbędne narzędzia GUI (PyCharm, Edytor Tekstu, Firefox) jednym kliknięciem.

</details>

---

<div align="center">  

  <img src="Screenshot from 2026-02-02 05-31-10.png" width="" height=""/>

</div>

---

## 🇺🇸 Core Features / 🇵🇱 Główne Funkcjonalności

* **10-Tab Command Center**: Instantly generates a structured GNOME Terminal window with dedicated tabs for Admin tasks, GCP Servers, WireShark sniffers (`mdc2`, `home_end0`, `home_wg0`), Python scripts, and SSH connections.
* **Vertical Bilingual Architecture**: The code and its outputs strictly follow the "Bilingual Architect" standard—every comment and console prompt is presented in both English and Polish (Vertical Stack Style) for maximum clarity.
* **Smart SSH Logic**: Features a dynamic "Wait-for-Input" mechanism for SSH tabs. The user enters an IP suffix (e.g., 'X' -> '55'), and the script automatically renames the terminal tab to the target IP while establishing the connection.
* **Auto-Venv Activation**: Automatically detects and activates Python virtual environments (`.venv`) for project-specific tabs before handing control to the user.
* **Safety Interlocks**: Critical commands (like `sudo wg-quick down` or Python capture scripts) are pre-filled but pause for user confirmation (`ENTER`) to prevent accidental execution.
* **GUI Orchestration**: Launches PyCharm (custom paths supported), Text Editor (Creds/Notes), and Firefox in the background using `nohup` to ensure process independence.

<details>

<summary>🇵🇱</summary>

## 🇵🇱 Główne Funkcjonalności

* **10-Zakładkowe Centrum Dowodzenia**: Natychmiast generuje ustrukturyzowane okno Terminala GNOME z dedykowanymi zakładkami do zadań administracyjnych, serwerów GCP, snifferów WireShark (`mdc2`, `home_end0`, `home_wg0`), skryptów Python oraz połączeń SSH.
* **Pionowa Architektura Dwujęzyczna**: Kod i jego wyjścia ściśle przestrzegają standardu "Bilingual Architect" – każdy komentarz i komunikat konsoli jest prezentowany zarówno w języku angielskim, jak i polskim (styl pionowy) dla maksymalnej przejrzystości.
* **Inteligentna Logika SSH**: Zawiera dynamiczny mechanizm "Czekaj na Dane" dla zakładek SSH. Użytkownik wpisuje końcówkę IP (np. 'X' -> '55'), a skrypt automatycznie zmienia nazwę zakładki na docelowe IP podczas nawiązywania połączenia.
* **Automatyczna Aktywacja Venv**: Automatycznie wykrywa i aktywuje wirtualne środowiska Python (`.venv`) dla zakładek projektowych przed przekazaniem kontroli użytkownikowi.
* **Blokady Bezpieczeństwa**: Krytyczne komendy (takie jak `sudo wg-quick down` czy skrypty przechwytywania Python) są wstępnie wpisane, ale czekają na potwierdzenie użytkownika (`ENTER`), aby zapobiec przypadkowemu wykonaniu.
* **Orkiestracja GUI**: Uruchamia PyCharm (obsługa niestandardowych ścieżek), Edytor Tekstu (Hasła/Notatki) oraz Firefox w tle przy użyciu `nohup`, zapewniając niezależność procesów.

</details>

---

## 🇺🇸 Prerequisites / 🇵🇱 Wymagania Wstępne

To deploy `mdc2_autostart.sh` effectively, ensure your environment meets these criteria:

1.  **OS**: Ubuntu 22.04 LTS / 24.04 LTS (or any distro using GNOME Terminal).
2.  **Terminal**: `gnome-terminal` (The script relies on specific tab/profile handling).
3.  **Directory Structure**: The script assumes a specific folder layout (e.g., `~/PyCharmProjects/WireShark`). *Note: You must edit the "CONFIGURATION SECTION" in the script to match your paths.*
4.  **Tools**: Python 3, WireGuard tools (`wg-quick`), PyCharm (Community or Pro).

<details>

<summary>🇵🇱</summary>

## 🇵🇱 Wymagania Wstępne

Aby skutecznie wdrożyć `mdc2_autostart.sh`, upewnij się, że Twoje środowisko spełnia te kryteria:

1.  **System Operacyjny**: Ubuntu 22.04 LTS / 24.04 LTS (lub dowolna dystrybucja używająca GNOME Terminal).
2.  **Terminal**: `gnome-terminal` (Skrypt polega na specyficznej obsłudze zakładek/profili).
3.  **Struktura Katalogów**: Skrypt zakłada określony układ folderów (np. `~/PyCharmProjects/WireShark`). *Uwaga: Musisz edytować "SEKCJĘ KONFIGURACJI" w skrypcie, aby dopasować ją do swoich ścieżek.*
4.  **Narzędzia**: Python 3, narzędzia WireGuard (`wg-quick`), PyCharm (Community lub Pro).

</details>

---

## 🇺🇸 Installation & Configuration / 🇵🇱 Instalacja i Konfiguracja

### 🇺🇸 Step 1: Clone the Repository

```bash
git clone https://github.com/LukeStriderGM/MY_AUTOSTART_SETS
cd MY_AUTOSTART_SETS
```

### 🇺🇸 Step 2: Customize Paths

Open `mdc2_autostart.sh` and edit the top configuration block to match your user name and file paths:

```bash
# --- CONFIGURATION SECTION ---
USER_HOME="/home/your-username"
WS_DIR="/home/your-username/PyCharmProjects/WireShark"
# ... set your PyCharm path here
```

### 🇺🇸 Step 3: Make Executable

```bash
chmod +x mdc2_autostart.sh
```

### 🇺🇸 Step 4: Add to Startup Applications

1. Open **Startup Applications** in Ubuntu.
2. Click **Add**.
3. **Name**: Command Center Start.
4. **Command**: `/path/to/MY_AUTOSTART_SETS/mdc2_autostart.sh`.

<details>

<summary>🇵🇱</summary>

### 🇵🇱 Krok 1: Sklonuj Repozytorium

```bash
git clone https://github.com/LukeStriderGM/MY_AUTOSTART_SETS
cd MY_AUTOSTART_SETS
```

### 🇵🇱 Krok 2: Dostosuj Ścieżki

Otwórz `mdc2_autostart.sh` i edytuj górny blok konfiguracyjny, aby pasował do Twojej nazwy użytkownika i ścieżek plików:

```bash
# --- SEKCJA KONFIGURACJI ---
USER_HOME="/home/twoj-uzytkownik"
WS_DIR="/home/twoj-uzytkownik/PyCharmProjects/WireShark"
# ... ustaw tutaj swoją ścieżkę do PyCharm
```

### 🇵🇱 Krok 3: Nadaj Prawa Wykonywania

```bash
chmod +x mdc2_autostart.sh
```

### 🇵🇱 Krok 4: Dodaj do Programów Startowych

1. Otwórz **Programy Startowe** (Startup Applications) w Ubuntu.
2. Kliknij **Dodaj**.
3. **Nazwa**: Start Centrum Dowodzenia.
4. **Polecenie**: `/ścieżka/do/MY_AUTOSTART_SETS/mdc2_autostart.sh`.

</details>

---

## 🇺🇸 License / Licencja 🇵🇱

This project is licensed under the MIT License. See the LICENSE file for details.

<details>

<summary>🇵🇱</summary>

### Licencja

Ten projekt jest objęty licencją MIT. Zobacz plik LICENSE, aby uzyskać szczegółowe informacje.

</details>
