#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
NC='\033[0m'

PORT=8080
NODE_TAR_URL="https://network3.io/ubuntu-node-v2.1.1.tar.gz"
NODE_DIR="$HOME/Network3"
FIREWALL_PORT=8080

log_message() {
    local level=$1
    local message=$2
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    local border="-----------------------------------------------------"
    
    echo -e "${border}"
    case $level in
        "INFO") echo -e "${CYAN}[INFO] ${timestamp} - ${message}${NC}" ;;
        "SUCCESS") echo -e "${GREEN}[SUCCESS] ${timestamp} - ${message}${NC}" ;;
        "ERROR") echo -e "${RED}[ERROR] ${timestamp} - ${message}${NC}" ;;
        *) echo -e "${YELLOW}[UNKNOWN] ${timestamp} - ${message}${NC}" ;;
    esac
    echo -e "${border}\n"
}

check_port() {
    local port=$1
    log_message "INFO" "Checking if port $port is available..."
    
    if ss -tuln | grep -q ":$port"; then
        log_message "ERROR" "Port $port is already in use. Please free it before proceeding."
        exit 1
    else
        log_message "SUCCESS" "Port $port is available."
    fi
}

get_server_ip() {
    ip route get 1 | awk '{print $7; exit}'
}

is_package_installed() {
    local package=$1
    dpkg -l | grep -qw $package
}

update_system() {
    log_message "INFO" "Starting system update and upgrade..."
    sudo apt update && sudo apt upgrade -y
    log_message "SUCCESS" "System updated successfully."

    log_message "INFO" "Checking and installing required dependencies..."

    if ! is_package_installed "net-tools"; then
        sudo apt install -y net-tools
        log_message "SUCCESS" "net-tools installed successfully."
    else
        log_message "INFO" "net-tools is already installed."
    fi

    if ! is_package_installed "ufw"; then
        sudo apt install -y ufw
        log_message "SUCCESS" "ufw installed successfully."
    else
        log_message "INFO" "ufw is already installed."
    fi

    if ! is_package_installed "wget"; then
        sudo apt install -y wget
        log_message "SUCCESS" "wget installed successfully."
    else
        log_message "INFO" "wget is already installed."
    fi
}

configure_firewall() {
    local port=$1
    log_message "INFO" "Configuring firewall to allow port $port..."
    sudo ufw allow $port
    sudo ufw reload
    log_message "SUCCESS" "Firewall configuration completed. Port $port is open."
}

install_node() {
    log_message "INFO" "Downloading node files..."
    cd $HOME
    wget -q $NODE_TAR_URL
    log_message "SUCCESS" "Node files downloaded successfully."

    log_message "INFO" "Extracting node files to '$NODE_DIR' folder..."
    mkdir -p $NODE_DIR
    tar -xzf ubuntu-node-v2.1.1.tar.gz -C $NODE_DIR --strip-components=1
    log_message "SUCCESS" "Files extracted to '$NODE_DIR' folder."
}

setup_node() {
    log_message "INFO" "Running node setup script..."
    cd $NODE_DIR
    sudo bash manager.sh up
    log_message "SUCCESS" "Node setup completed."

    log_message "INFO" "Saving node key..."
    NODE_KEY=$(sudo bash manager.sh key | grep -oP '^[A-Za-z0-9+/=]+$')  # Trích xuất key
    log_message "SUCCESS" "Key saved and bound successfully."

    local server_ip
    server_ip=$(get_server_ip)
    log_message "INFO" "Your server IP is: $server_ip"

    local link="https://account.network3.ai/main?o=${server_ip}:${FIREWALL_PORT}"

    echo -e "${GREEN}[+] KEY: ${CYAN}${NODE_KEY}${NC}"
    echo -e "${GREEN}[+] LINK CONNECT: ${CYAN}${link}${NC}"
}

main() {
    update_system
    check_port $PORT
    configure_firewall $PORT
    install_node
    setup_node
}

main
