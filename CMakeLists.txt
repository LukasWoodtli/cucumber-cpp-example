cmake_minimum_required(VERSION 3.10)

project(CucumberCppExample)

find_package(CucumberCpp PATHS "${CMAKE_SOURCE_DIR}/third-party/install/cucumber-cpp/lib/cmake/")

find_package(Boost REQUIRED COMPONENTS unit_test_framework program_options system regex filesystem thread)

# Build library
add_library(Calc
    src/Calculator.cpp)
target_include_directories(Calc PUBLIC src)


# Build tests
add_executable(CalculatorSteps
    features/step_definitions/CalculatorSteps.cpp)

target_link_libraries(CalculatorSteps
    PRIVATE
        Calc
        cucumber-cpp
        Boost::thread
        Boost::unit_test_framework
        Boost::program_options
        Boost::system
        Boost::regex
        Boost::filesystem
        CucumberCpp::cucumber-cpp-nomain)
