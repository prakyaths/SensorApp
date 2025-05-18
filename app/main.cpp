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
