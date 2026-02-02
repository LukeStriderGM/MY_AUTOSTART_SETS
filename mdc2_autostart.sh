#!/bin/bash

# SYSTEM ROLE: BASH AUTOMATION ARCHITECT
# ROLA SYSTEMOWA: ARCHITEKT AUTOMATYZACJI BASH

# --- CONFIGURATION SECTION ---
# --- SEKCJA KONFIGURACJI ---

# Define user home directory
# Definiuj katalog domowy użytkownika
USER_HOME="/home/blox-tak-sf"

# Define Wireshark project directory
# Definiuj katalog projektu Wireshark
WS_DIR="/home/blox-tak-sf/PyCharmProjects/WireShark"

# Define GCP Server project directory
# Definiuj katalog projektu GCP Server
GCP_DIR="/home/blox-tak-sf/PyCharmProjects/BLOX-TAK-SERVER-GCP"

# Define path to credentials file
# Definiuj ścieżkę do pliku z poświadczeniami
CREDS_FILE="$USER_HOME/Documents/creds.txt"

# Define path to command cheat sheet
# Definiuj ścieżkę do pliku ze ściągą komend
COMMANDS_FILE="$GCP_DIR/command.txt"

# Define path to PyCharm executable
# Definiuj ścieżkę do pliku wykonywalnego PyCharm
PYCHARM_PATH="/home/blox-tak-sf/pycharm-2025.1.3.1/bin/pycharm.sh"


# ==============================================================================
# RC FILE GENERATION (TERMINAL TABS CONFIGURATION)
# GENEROWANIE PLIKÓW RC (KONFIGURACJA ZAKŁADEK TERMINALA)
# ==============================================================================

# 🔄 Generating configuration for ADMIN BTSF...
# 🔄 Generuję konfigurację dla ADMIN BTSF...

cat << EOF > /tmp/rc_admin.rc
source ~/.bashrc
cd "$USER_HOME"
PS1="\$PS1\[\033]0;ADMIN BTSF\007\]"

# 💬 Interaction: User needs to confirm WG shutdown
# 💬 Interakcja: Użytkownik musi potwierdzić wyłączenie WG
echo -e "🟢 READY. Press ENTER to shutdown WireGuard:"
echo -e "🟢 GOTOWY. Wciśnij ENTER, aby wyłączyć WireGuard:"

read -e -i "sudo wg-quick down /etc/wireguard/admin.conf" -p "root@wg $ " CMD
history -s "\$CMD"
eval "\$CMD"
EOF

# 🔄 Generating configuration for BTS-GCP...
# 🔄 Generuję konfigurację dla BTS-GCP...

cat << EOF > /tmp/rc_bts_gcp.rc
source ~/.bashrc
cd "$GCP_DIR"
source .venv/bin/activate
PS1="\$PS1\[\033]0;BTS-GCP\007\]"
EOF

# 🔄 Generating configuration for mdc2_enp3s0 (Auto-Start)...
# 🔄 Generuję konfigurację dla mdc2_enp3s0 (Auto-Start)...

cat << EOF > /tmp/rc_mdc2.rc
source ~/.bashrc
cd "$WS_DIR"
source .venv/bin/activate

# 🔄 Setting terminal title
# 🔄 Ustawiam tytuł terminala
echo -ne "\033]0;mdc2_enp3s0\007"
PS1="\$PS1\[\033]0;mdc2_enp3s0\007\]"

# 🚀 Execute capture script immediately
# 🚀 Wykonaj skrypt przechwytywania natychmiast
./capture_mdc2_enp3s0.sh
EOF

# 🔄 Generating configuration for home_end0...
# 🔄 Generuję konfigurację dla home_end0...

cat << EOF > /tmp/rc_home_end0.rc
source ~/.bashrc
cd "$WS_DIR"
source .venv/bin/activate
PS1="\$PS1\[\033]0;home_end0\007\]"

# 💬 Prompt user for execution
# 💬 Poproś użytkownika o wykonanie
echo -e "🟢 READY. Press ENTER to start capture:"
echo -e "🟢 GOTOWY. Wciśnij ENTER, aby rozpocząć przechwytywanie:"

read -e -i "./capture_remote_home_end0.sh" -p "(.venv) $ " CMD
history -s "\$CMD"
eval "\$CMD"
EOF

# 🔄 Generating configuration for home_wg0...
# 🔄 Generuję konfigurację dla home_wg0...

cat << EOF > /tmp/rc_home_wg0.rc
source ~/.bashrc
cd "$WS_DIR"
source .venv/bin/activate
PS1="\$PS1\[\033]0;home_wg0\007\]"

echo -e "🟢 READY. Press ENTER to start capture:"
echo -e "🟢 GOTOWY. Wciśnij ENTER, aby rozpocząć przechwytywanie:"

read -e -i "./capture_remote_home_wg0.sh" -p "(.venv) $ " CMD
history -s "\$CMD"
eval "\$CMD"
EOF

# 🔄 Generating configuration for vm_ens4 (Python)...
# 🔄 Generuję konfigurację dla vm_ens4 (Python)...

cat << EOF > /tmp/rc_vm_ens4.rc
source ~/.bashrc
cd "$WS_DIR"
source .venv/bin/activate
PS1="\$PS1\[\033]0;vm_ens4\007\]"

echo -e "🟢 READY. Press ENTER to start Python script:"
echo -e "🟢 GOTOWY. Wciśnij ENTER, aby uruchomić skrypt Python:"

read -e -i "python3 capture_traffic_ens4_vms_gcp.py" -p "(.venv) $ " CMD
history -s "\$CMD"
eval "\$CMD"
EOF

# 🔄 Generating configuration for vm_wg0 (Python)...
# 🔄 Generuję konfigurację dla vm_wg0 (Python)...

cat << EOF > /tmp/rc_vm_wg0.rc
source ~/.bashrc
cd "$WS_DIR"
source .venv/bin/activate
PS1="\$PS1\[\033]0;vm_wg0\007\]"

echo -e "🟢 READY. Press ENTER to start Python script:"
echo -e "🟢 GOTOWY. Wciśnij ENTER, aby uruchomić skrypt Python:"

read -e -i "python3 capture_traffic_wg0_vms_gcp.py" -p "(.venv) $ " CMD
history -s "\$CMD"
eval "\$CMD"
EOF

# 🔄 Generating SSH Logic Template...
# 🔄 Generuję szablon logiki SSH...

cat << EOF > /tmp/ssh_logic_template.sh
source ~/.bashrc
cd "$USER_HOME"
echo -ne "\033]0;SSH Setup\007"

# 💬 Instruction for dynamic IP entry
# 💬 Instrukcja dla dynamicznego wprowadzania IP
echo -e "🧠 Change 'X' to IP and press ENTER."
echo -e "🧠 Zmień 'X' na IP i wciśnij ENTER."

read -e -i "ssh blox_tak_server_admin@10.166.0.X" -p "ssh > " CMD

# 🔄 Extracting IP to update window title
# 🔄 Wyciągam IP, aby zaktualizować tytuł okna
NEW_IP=\$(echo "\$CMD" | awk -F'@' '{print \$2}')
echo -ne "\033]0;SSH \$NEW_IP\007"
PS1="\[\033]0;SSH \$NEW_IP\007\]$ "

history -s "\$CMD"
eval "\$CMD"
EOF

# 📂 Copying template to instance files
# 📂 Kopiuję szablon do plików instancji
cp /tmp/ssh_logic_template.sh /tmp/rc_ssh_x1.rc
cp /tmp/ssh_logic_template.sh /tmp/rc_ssh_x2.rc
cp /tmp/ssh_logic_template.sh /tmp/rc_ssh_x3.rc


# ==============================================================================
# GUI APPLICATIONS LAUNCH
# URUCHAMIANIE APLIKACJI GRAFICZNYCH
# ==============================================================================

# 📂 Opening text files (Notes & Credentials)
# 📂 Otwieram pliki tekstowe (Notatki i Poświadczenia)
nohup gnome-text-editor "$CREDS_FILE" >/dev/null 2>&1 &
nohup gnome-text-editor "$COMMANDS_FILE" >/dev/null 2>&1 &

# 🌍 Opening Web Browser
# 🌍 Otwieram przeglądarkę internetową
nohup firefox >/dev/null 2>&1 &

# 🧠 Opening PyCharm IDE
# 🧠 Otwieram środowisko PyCharm IDE
if [ -f "$PYCHARM_PATH" ]; then
    # ✅ Path found, launching specific version
    # ✅ Ścieżka znaleziona, uruchamiam konkretną wersję
    nohup "$PYCHARM_PATH" >/dev/null 2>&1 &
else
    # ⚠️ Path not found, trying default command
    # ⚠️ Ścieżka nieznaleziona, próbuję domyślnej komendy
    nohup pycharm >/dev/null 2>&1 &
fi

# 🔄 Pausing for GUI stability
# 🔄 Pauzuję dla stabilności GUI
sleep 1


# ==============================================================================
# TERMINAL LAUNCH (10 TABS)
# URUCHAMIANIE TERMINALA (10 ZAKŁADEK)
# ==============================================================================

# 🚀 Launching GNOME Terminal with 10 configured tabs
# 🚀 Uruchamiam GNOME Terminal z 10 skonfigurowanymi zakładkami
gnome-terminal --maximize \
  --tab --title="ADMIN BTSF"   --command="bash --rcfile /tmp/rc_admin.rc" \
  --tab --title="BTS-GCP"      --command="bash --rcfile /tmp/rc_bts_gcp.rc" \
  --tab --title="mdc2_enp3s0"  --command="bash --rcfile /tmp/rc_mdc2.rc" \
  --tab --title="home_end0"    --command="bash --rcfile /tmp/rc_home_end0.rc" \
  --tab --title="home_wg0"     --command="bash --rcfile /tmp/rc_home_wg0.rc" \
  --tab --title="vm_ens4"      --command="bash --rcfile /tmp/rc_vm_ens4.rc" \
  --tab --title="vm_wg0"       --command="bash --rcfile /tmp/rc_vm_wg0.rc" \
  --tab --title="SSH X"        --command="bash --rcfile /tmp/rc_ssh_x1.rc" \
  --tab --title="SSH X"        --command="bash --rcfile /tmp/rc_ssh_x2.rc" \
  --tab --title="SSH X"        --command="bash --rcfile /tmp/rc_ssh_x3.rc" \
  2>/dev/null

# ✅ Script execution finished
# ✅ Wykonanie skryptu zakończone
exit 0