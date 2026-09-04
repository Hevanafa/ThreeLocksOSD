# ThreeLocksOSD

![ThreeLocksOSD preview](./preview.png)

An app to show lock key statuses without 200+ MB of bloat

Basically a tiny Windows on-screen display telling you whether the Num Lock, Caps Lock, or Scroll Lock is on or not.  When one of these keys changes state, a small overlay briefly shows its current status

## Features

- Shows the status of Num Lock, Caps Lock, and Scroll Lock
- Brief (1 second), semitransparent on-screen display (OSD) whenever a lock key changes
- Automatically positions the OSD on the currently focused screen
- Click-through and doesn't steal focus from other apps
- Stays out of the taskbar and sits idly in the background
- Can minimise to the system tray
- Can automatically start with Windows
- Small native executable with no additional runtime required

## Usage

1. Download the latest version from the releases page,
2. Run `ThreeLocksOSD.exe`,
3. Press any lock keys: num lock, caps lock, or scroll lock

## Building

I use **Lazarus IDE v4.6** along with **Free Pascal Compiler 3.2.2** to build this app

Open the project (`project.lpi`) in Lazarus and build it normally

No additional runtime is required by the resulting executable

## Licence

ThreeLocksOSD is licensed under the MIT Licence.  See [COPYING.TXT](./COPYING.TXT) for details.
