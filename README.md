![PSFML](media/psfml-logo.png)  

[![Chat on Discord](https://img.shields.io/discord/754884471324672040.svg?logo=discord)](https://discord.gg/tPWjMwK) [![Twitter Follow](https://img.shields.io/twitter/follow/tinyBigGAMES?style=social)](https://twitter.com/tinyBigGAMES)

**PSFML** is Pascal binding for the **Simple and Fast Multimedia Library (SFML)**, allowing  Pascal developers with an easy way to use SFML’s multimedia features directly in their projects. Whether you are building games, interactive applications, or multimedia tools, PSFML enables seamless integration with SFML, bringing its robust functionality to the Pascal ecosystem.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Installation](#installation)
- [Usage](#usage)
  - [Basic Example](#basic-example)
- [Extensions](#extensions)
- [Contributing](#contributing)
- [License](#license)

## Introduction

PSFML leverages the power of **SFML** and makes it accessible to Pascal programmers. With PSFML, you can create windowed applications, manage graphics, handle real-time user input, play audio, and even stream video. Built to work on **Windows** (Windows 10 and higher), PSFML is compatible with both **Delphi** and **FreePascal**, making it a versatile choice for Pascal developers.

### Why PSFML?

- **Pascal-First**: PSFML is developed specifically for Pascal developers, providing a natural and intuitive API.
- **No DLL Hassles**: Simply add **PSFML** to your `uses` section, and everything you need is embedded in your executable. There’s no need to manage external DLLs.
- **Compiler Support**: Supports **Delphi** and **FreePascal**, and works on **Windows 64-bit** (tested on **Windows 10** and **Windows 11**).
- **Latest SFML**: In sync with latest **SFML** release, so you can use all the latest features of the library.

## Features

- **Core SFML Integration**: Use SFML’s core features directly from Pascal, including window management, real-time rendering, audio playback, and network communication.
- **Extensions**: 
  - **ZipFile**: Standard compression and encryption support, allowing you to handle archived content seamlessly.
  - **Video Playback (MPEG-1)**: Stream and play videos within your applications.
  - **Enhanced InputStream**: Works with **ZipFile**, enabling smooth file handling.
  - **HighDPI**: Routines that allows you to scale the render window size based on the desktop DPI value and automatically when the DPI value changes.
  - **More**: Additional extensions will be added in future updates.
- **Optimized for Windows**: Developed and tested on **Windows 11** with **Delphi 12.2**, PSFML is designed to be stable and performant for game and multimedia applications.

## Getting Started

### Requirements

- **Delphi/FreePascal** that supports **Windows 64-bit** and **Unicode**.
- **Windows 10** or higher (64-bit).

### Installation

1. Download the latest version of [PSFML](https://github.com/tinyBigGAMES/PSFML/archive/refs/heads/main.zip).
2. Extract the contents to your project directory.
3. Add the **PSFML** `src` folder to your **Library Path** in Delphi or FreePascal.
4. In your project, include `PSFML` in your `uses` section.
5. Refer to the `examples` folder for detailed usage instructions and examples on how to utilize PSFML effectively.
6. Make sure to run the `ZipFile01` example first to generate the `data.zip` file required by the other examples.

## Usage

### Basic Example

Here’s a simple example of how to create a window and handle real-time user input using **PSFML**:

```Pascal
uses
  SysUtils,  
  PSFML;

var
  LWindow: PsfRenderWindow;
  LMode: sfVideoMode;
  LSettings: sfContextSettings;
  LEvent: sfEvent;
  LFont: array[0..0] of PsfFont;
  LText: array[0..0] of PsfText;
begin
  LMode.size.x := 1920 div 2;
  LMode.size.y := 1080 div 2;
  LMode.bitsPerPixel := 32;

  LSettings := Default(sfContextSettings);
  LSettings.depthBits := 24;
  LSettings.stencilBits := 8;
  LSettings.antialiasingLevel := 8; // Set anti-aliasing level
  LSettings.majorVersion := 2; // OpenGL major version
  LSettings.minorVersion := 1; // OpenGL minor version

  LWindow := sfRenderWindow_Create(LMode, 'PSFML: RenderWindow #01',
    sfClose, sfWindowed, @LSettings);
  sfRenderWindow_ScaleToDPI(LWindow, LMode.size.x, LMode.size.y, True);
  sfRenderWindow_SetFramerateLimit(LWindow, 60);
  sfRenderWindow_setVerticalSyncEnabled(LWindow, False);

  LFont[0] := sfFont_CreateDefaultFont();
  sfFont_SetSmooth(LFont[0], True);

  LText[0] := sfText_Create(LFont[0]);
  sfText_SetCharacterSizeDPI(LWindow, LText[0], 12);

  while sfRenderWindow_isOpen(LWindow) do
  begin
    while sfRenderWindow_pollEvent(LWindow, @LEvent) do
    begin
      if LEvent.&type = sfEvtClosed then
        sfRenderWindow_close(LWindow);
    end;

    sfRenderWindow_ScaleOnDPIChange(LWindow);

    sfRenderWindow_Clear(LWindow, DARKSLATEBROWN);

    sfRenderWindow_DrawTextEx(LWindow, LText[0], 3, 3,
      WHITE, Format('%d fps', [sfRenderWindow_GetFrameRate(LWindow)]));

    sfRenderWindow_Display(LWindow);
  end;

  sfText_Destroy(LText[0]);
  sfFont_Destroy(LFont[0]);

  sfRenderWindow_Destroy(LWindow);
end.
```

This code opens a window, listens for a close event, displays a font and updates the display, giving you a starting point for any real-time application.

## Extensions

### ZipFile Support

PSFML includes built-in support for compressed and encrypted zip files using **ZipFile**. You can easily extract resources, such as textures or sounds, directly from a zip archive within your game or application.

### Video Playback (MPEG-1)

Play **MPEG-1** video files within your application using the video playback extension. This feature is particularly useful for cutscenes or background video.

### Enhanced InputStream

The **Enhanced InputStream** works seamlessly with **ZipFile**, allowing you to access archived files and stream them in real-time.

## Contributing

Contributions to **PSFML** are welcome! If you’d like to contribute to this project, feel free to submit issues or pull requests on our [GitHub repository](https://github.com/tinyBigGAMES/PSFML).

<a href="https://github.com/tinyBigGAMES/PSFML/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=tinyBigGAMES/PSFML&max=500&columns=20&anon=1" />
</a>

## License

**PSFML** is licensed under the **BSD-3-Clause License**, which permits redistribution and use in source and binary forms, with or without modification, under specific conditions. See the [LICENSE](https://github.com/tinyBigGAMES/PSFML?tab=BSD-3-Clause-1-ov-file#BSD-3-Clause-1-ov-file) file for more details.

### Support

- <a href="https://github.com/tinyBigGAMES/PSFML/issues" target="_blank">Issues</a>
- <a href="https://github.com/tinyBigGAMES/PSFML/discussions" target="_blank">Discussions</a>
- <a href="https://www.sfml-dev.org/" target="_blank">SFML website</a>
- <a href="https://www.youtube.com/results?search_query=SFML&sp=CAI%253D" target="_blank">SFML on YouTube</a>

<p align="center">
<img src="media/delphi.png" alt="Delphi">
</p>
<h5 align="center">

Made with :heart: in Delphi
</h5>