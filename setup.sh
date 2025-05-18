#!/bin/bash
set -e

echo "Creating folder structure inside current directory..."

mkdir -p app sensor logger

# Create WORKSPACE file (empty)
touch WORKSPACE

# Create README.md with project description and folder structure
cat > README.md <<EOL
# SensorApp

A modular C++ sensor simulation application built with the Bazel build system.

This project demonstrates a clean multi-module architecture with separate sensor and logger components, showcasing modern C++ coding practices and Bazel’s powerful build capabilities.

It is designed for learners to understand Bazel in real-world C++ projects and serves as a foundation to extend with multithreading, POSIX system programming, and other advanced features.

---

## Folder Structure

\`\`\`
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
\`\`\`

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

\`\`\`bash
bazel build //app:sensor_app
\`\`\`

Run the application:

\`\`\`bash
bazel run //app:sensor_app
\`\`\`

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

Your Name - [GitHub Profile](https://github.com/<your-username>)

EOL

# Create app/main.cpp with starter content
cat > app/main.cpp <<EOL
#include <iostream>
#include "sensor/sensor.h"
#include "logger/logger.h"

int main() {
    Logger logger;
    Sensor sensor;

    logger.log("Starting SensorApp...");

    for (int i = 0; i < 5; ++i) {
        int value = sensor.readValue();
        logger.log("Sensor reading: " + std::to_string(value));
    }

    logger.log("SensorApp finished.");

    return 0;
}
EOL

# Create app/BUILD.bazel
cat > app/BUILD.bazel <<EOL
cc_binary(
    name = "sensor_app",
    srcs = ["main.cpp"],
    deps = [
        "//sensor:sensor",
        "//logger:logger",
    ],
)
EOL

# Create sensor/sensor.h
cat > sensor/sensor.h <<EOL
#ifndef SENSOR_H
#define SENSOR_H

class Sensor {
public:
    Sensor();
    int readValue();
};

#endif  // SENSOR_H
EOL

# Create sensor/sensor.cpp
cat > sensor/sensor.cpp <<EOL
#include "sensor.h"
#include <cstdlib>  // For rand()
#include <ctime>

Sensor::Sensor() {
    std::srand(std::time(nullptr));  // Initialize random seed
}

int Sensor::readValue() {
    // Simulate sensor value between 0 and 100
    return std::rand() % 101;
}
EOL

# Create sensor/BUILD.bazel
cat > sensor/BUILD.bazel <<EOL
cc_library(
    name = "sensor",
    srcs = ["sensor.cpp"],
    hdrs = ["sensor.h"],
    visibility = ["//visibility:public"],
)
EOL

# Create logger/logger.h
cat > logger/logger.h <<EOL
#ifndef LOGGER_H
#define LOGGER_H

#include <string>

class Logger {
public:
    void log(const std::string& message);
};

#endif  // LOGGER_H
EOL

# Create logger/logger.cpp
cat > logger/logger.cpp <<EOL
#include "logger.h"
#include <iostream>
#include <chrono>
#include <ctime>

void Logger::log(const std::string& message) {
    auto now = std::chrono::system_clock::now();
    std::time_t now_c = std::chrono::system_clock::to_time_t(now);
    std::cout << "[" << std::ctime(&now_c) << "] " << message << std::endl;
}
EOL

# Create logger/BUILD.bazel
cat > logger/BUILD.bazel <<EOL
cc_library(
    name = "logger",
    srcs = ["logger.cpp"],
    hdrs = ["logger.h"],
    visibility = ["//visibility:public"],
)
EOL

echo "SensorApp folder structure and starter files created successfully in current directory!"
