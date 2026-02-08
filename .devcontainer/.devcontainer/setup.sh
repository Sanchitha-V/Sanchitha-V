#!/bin/bash
echo "Setting up PQC Benchmark Environment..."
echo "This may take 2-3 minutes..."

# Update and install ARM toolchain
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    gcc-arm-none-eabi \
    binutils-arm-none-eabi \
    libnewlib-arm-none-eabi \
    qemu-system-arm \
    qemu-user-static \
    python3-pip \
    python3-venv \
    git \
    make \
    cmake \
    gdb-multiarch \
    wget \
    curl

echo "Installing Python packages..."
# Create virtual environment
python3 -m venv /workspaces/venv
source /workspaces/venv/bin/activate

# Install Python packages
pip install --upgrade pip
pip install numpy pandas matplotlib seaborn jupyter scipy scikit-learn

echo " Cloning PQClean repository..."
cd /workspaces
git clone https://github.com/PQClean/PQClean.git --depth 1

echo " Setup complete!"
echo ""
echo " Available commands:"
echo "  cd /workspaces/PQClean/crypto_kem/kyber512/clean && make"
echo "  source /workspaces/venv/bin/activate"
echo "  python3 --version"
echo "  arm-none-eabi-gcc --version"
echo "  qemu-system-arm --version"