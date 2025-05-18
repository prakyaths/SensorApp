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
