# SensorApp

A modular C++ sensor simulation application built with the Bazel build system.

---

## Folder Structure

```
SensorApp/
├── WORKSPACE
├── README.md
├── app/
│   ├── main.cpp
│   └── BUILD.bazel
├── sensor/
│   ├── sensor.h
│   ├── sensor.cpp
│   └── BUILD.bazel
└── logger/
    ├── logger.h
    ├── logger.cpp
    └── BUILD.bazel
```

---

## Features

- Modular design with independent sensor and logger libraries  
- Uses Bazel for fast, scalable, and reproducible builds  
- Simple sensor simulation generating random values  
- Console logger to print messages with timestamps  
- Easily extensible for multithreading and system programming concepts

---

## Prerequisites

- Bazel (version 6.x recommended)  
- C++ compiler (g++ or clang++)  
- Compatible POSIX environment (Linux, WSL2 on Windows, macOS)

---

## Build and Run

Build the application:

```bash
bazel build //app:sensor_app
```

Run the application:

```bash
bazel run //app:sensor_app
```

---

## Future Roadmap

- Add multithreading support with C++ std::thread and synchronization  
- Integrate POSIX system programming examples  
- Extend sensor simulation with more realistic data sources  
- Implement logging levels and file output for Logger  
- Prepare for advanced interview topics with modular code

---

## License

MIT License

---

## Author

Prakyath - [GitHub Profile](https://github.com/prakyaths)

