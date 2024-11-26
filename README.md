# i3blocks CPU Temperature Monitor

A minimalistic and informative CPU temperature monitoring block for i3blocks with interactive features.

## 🌡️ Features

- Real-time CPU temperature display
- Color-coded temperature indicators
- Interactive notifications with detailed system information
- Lightweight and easy to integrate

### Temperature Color Based on Temperature

- 🟢 Green: Normal temperature
- 🟠 Orange: Warm temperature (>70°C)
- 🔴 Red: High temperature (>80°C)

## 📋 Prerequisites

- Linux distribution (Arch Linux recommended)
- i3blocks
- `lm-sensors`
- `sysstat`
- `libnotify`

## 🛠️ Installation

### 1. Install dependencies:
```bash
sudo pacman -S i3blocks lm_sensors sysstat bc libnotify
```

### 2. Run sensor detection:
```bash
sudo sensors-detect
```

### 3. Clone the repository:
```bash
git clone https://github.com/yourusername/i3blocks-cpu-temperature-monitor.git
cd i3blocks-cpu-temperature-monitor
```

### 4. Copy the script to your local bin:
```bash
mkdir -p ~/.config/i3blocks
cp cpu_temp.sh ~/.config/i3blocks/
chmod +x ~/.config/i3blocks/cpu_temp.sh
```
### 5. Add to your `~/.config/i3blocks/config`:
```
[cpu_temperature]
command=/usr/local/bin/cpu_temp.sh
interval=5
markup=pango
```

## 🖱️ Interaction

### Left Click
- Displays detailed CPU information
  - Per-core temperatures
  - Per-core CPU usage

### Right Click
- Shows full sensor output
