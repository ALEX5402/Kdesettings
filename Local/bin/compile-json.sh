#!/bin/bash

# Path to the Android NDK clang++
CLANG_PATH="/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++"

# Target and sysroot
TARGET="aarch64-none-linux-android24"
SYSROOT="/opt/android-ndk/toolchains/llvm/prebuilt/linux-x86_64/sysroot"

# Compilation flags
FLAGS="-Dcmaketest_EXPORTS -g -DANDROID -fdata-sections -ffunction-sections -funwind-tables -fstack-protector-strong -no-canonical-prefixes -D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security -fno-limit-debug-info -fPIC"

# Output file
OUTPUT="compile_commands.json"
NDK_PATH="/opt/android-ndk"

# Initialize the JSON array
echo "[" > $OUTPUT

# Extract .cpp and .c files from Android.mk
FILES=$(grep -oP '(\S+\.cpp|\S+\.c)' Android.mk)

# Loop through each file and add to compile_commands.json
for FILE in $FILES; do
    echo "{" >> $OUTPUT
    echo "  \"directory\": \"$(pwd)\"," >> $OUTPUT
    echo "  \"command\": \"$CLANG_PATH --target=$TARGET --sysroot=$SYSROOT $FLAGS -c $FILE -o ${FILE%.cpp}.o\"," >> $OUTPUT
    echo "  \"file\": \"$FILE\"" >> $OUTPUT
    echo "}," >> $OUTPUT
done

# Remove the last comma and close the JSON array
sed -i '$ s/,$//' $OUTPUT
echo "]" >> $OUTPUT

echo "compile_commands.json generated successfully."


# Create a .clangd file in the current directory
cat <<EOL > .clangd
CompileFlags:
  Add:
    - -std=c++14  # Use C++14 standard; adjust if needed
    - -I$NDK_PATH/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include  # NDK headers
    - -I$CURRENT_DIR  # Current project headers
    - -DANDROID  # Define for Android
    - -fexceptions  # Enable exception handling
    - -funwind-tables  # Enable stack unwinding
    - -frtti  # Enable run-time type information
  Remove:
    - -W*  # Remove all warning flags if needed

CompilationDatabase:
  Ancestors: true  # Look for compile_commands.json in parent directories

Index:
  Background: Build  # Enable background indexing

Diagnostics:
  ClangTidy:
    Add:
      - modernize-*  # Enable all modernize checks
    Remove:
      - modernize-use-trailing-return-type  # Exclude a specific check

InlayHints:
  Enabled: true
  ParameterNames: true
  DeducedTypes: true

# Optional: Customize the indexing behavior
Index:
  StandardLibrary: No  # Disable eager indexing of the standard library

# Optional: Configure unused includes diagnostics
Diagnostics:
  UnusedIncludes: Strict  # Enable strict checks for unused includes
EOL

if [ -f "./CMakeLists.txt" ]; then
    # Check if the line is already present
    if ! grep -q "set(CMAKE_EXPORT_COMPILE_COMMANDS ON)" "./CMakeLists.txt"; then
        echo "Adding 'set(CMAKE_EXPORT_COMPILE_COMMANDS ON)' to CMakeLists.txt"
        echo "set(CMAKE_EXPORT_COMPILE_COMMANDS ON)" >> "./CMakeLists.txt"
    else
        echo "'set(CMAKE_EXPORT_COMPILE_COMMANDS ON)' is already present in CMakeLists.txt"
    fi

    # Create a build directory if it doesn't exist
    mkdir -p build

    # Run CMake to generate compile_commands.json and use the Android NDK
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
          -DCMAKE_TOOLCHAIN_FILE="$NDK_PATH/build/cmake/android.toolchain.cmake" \
          -DANDROID_ABI=arm64-v8a \
          -DANDROID_PLATFORM=android-21 \
          -B build

    echo "compile_commands.json has been generated in the build directory."
else
    echo "CMakeLists.txt not found in the current directory."
fi
