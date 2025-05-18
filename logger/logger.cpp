#include "logger.h"
#include <iostream>
#include <chrono>
#include <ctime>

void Logger::log(const std::string& message) {
    auto now = std::chrono::system_clock::now();
    std::time_t now_c = std::chrono::system_clock::to_time_t(now);
    std::cout << "[" << std::ctime(&now_c) << "] " << message << std::endl;
}
