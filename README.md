
# Temperature Converter Flutter App

## Overview

This Flutter app converts temperatures between Fahrenheit and Celsius. It features a user-friendly interface with toggle buttons to select the conversion direction, input validation, and a history of past conversions. The app supports both light and dark themes for improved accessibility.

## Features

- Convert Fahrenheit to Celsius and vice versa
- Input validation with error messages for invalid inputs
- Conversion history with clear display of past inputs and results
- Toggle buttons to select conversion direction
- Responsive UI with Material Design components
- Support for light and dark themes

## Getting Started

### Prerequisites

- Flutter SDK installed (version 3.0 or above recommended)
- An emulator or physical mobile device connected for testing

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/temp_converter_flutter.git
   cd temp_converter_flutter
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Usage

- Enter a temperature value in the input field.
- Select the conversion direction by tapping on the toggle buttons (Fahrenheit to Celsius or Celsius to Fahrenheit).
- Tap the "Convert" button.
- The converted temperature will be displayed below.
- Conversion history will update with each successful conversion.
- Switch between light and dark mode using device settings.

## Code Structure

- `main.dart`: Entry point, sets up the MaterialApp and theme.
- `home_page.dart`: Contains the main UI and state management logic.
- `widgets/`: (Optional) Custom reusable widgets if applicable.

## Notes

- Input validation prevents empty or non-numeric entries.
- Conversion results are rounded to two decimal places.
- The app demonstrates effective use of Flutter state management (`setState`) and widget composition.

## Author

Your Name - [GitHub Profile](https://github.com/yourusername)

## License

This project is licensed under the MIT License.
