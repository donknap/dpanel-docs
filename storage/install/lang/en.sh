#!/bin/bash

TXT_START_INSTALLATION="======================= Starting DPanel Installation ======================="
TXT_RUN_AS_ROOT="Please run this script as root user or with sudo privileges"

TXT_SELECT_LANGUAGE="Select language:"
TXT_SELECT_LANGUAGE_CHOICE="Enter language option [Default:"

TXT_SUCCESS_MESSAGE="Success"
TXT_SUCCESSFULLY_MESSAGE="Successfully"
TXT_FAIELD_MESSAGE="Failed"
TXT_IGNORE_MESSAGE="Ignored"
TXT_SKIP_MESSAGE="Skipped"

TXT_COMMAND_NOT_FOUND="Command not found. Please install required package and retry (apt install | yum install | apk add | brew install)"

TXT_INSTALL_VERSION="Select the version to install"
TXT_INSTALL_VERSION_NAME=("Standard Edition (Requires binding to ports 80 & 443)" "Lite Edition (Excludes domain forwarding features)" "Standard Edition (Pro)" "Lite Edition (Pro)" "Standard Edition (Beta)" "Lite Edition (Beta)")
TXT_INSTALL_VERSION_CHOICE="Enter the version number to install [Default: 2]: "
TXT_INSTALL_VERSION_IMAGE_SET="Installation uses image"
TXT_INSTALL_VERSION_REGISTRY_CHOICE="Select image registry [Default: 1]: "
TXT_INSTALL_VERSION_REGISTRY_NAME=("Docker Hub" "ALiYun")

TXT_INSTALL_NAME="Set DPanel container name. For updates, configure this as the current panel container name."
TXT_INSTALL_NAME_INPUT="Enter name [Default:"
TXT_INSTALL_NAME_RULE="Error: Container name must contain only letters, numbers, '-', '_', '.', and be 3-30 characters long."
TXT_INSTALL_NAME_SET="Container name set to"

TXT_UPGRADE_MESSAGE="Specified container name already exists. Script will use the old container's configuration. If you need to change the configuration, please change the container name."
TXT_UPGRADE_CHOICE="Upgrade the panel container? [Y/n]: "
TXT_UPGRADE_START="... Upgrading panel container"
TXT_UPGRADE_EMPTY_PORT="Old container has no exposed ports"
TXT_UPGRADE_EMPTY_MOUNT="Old container has no mounted directories or files"
TXT_UPGRADE_BACKUP="... Backing up old container and creating new container "
TXT_UPGRADE_BACKUP_RESUME="... Restoring backup container "
TXT_UPGRADE_JOIN_DPANEL_LOCAL="... Joining network"

TXT_INSTALL_DIR="Set DPanel container mount directory [Default:"
TXT_INSTALL_DIR_PROVIDE_FULL_PATH="Please specify the absolute path, e.g., /home/dpanel"
TXT_INSTALL_DIR_SET="Panel container mount directory set to"

TXT_INSTALL_PORT="Set DPanel access port [Default:"
TXT_INSTALL_PORT_RULE="Error: Port number must be between 1 and 65535"
TXT_INSTALL_PORT_SET="Panel access port set to: "
TXT_INSTALL_PORT_USE_80="The Standard Edition you are installing requires binding ports 80 and 443. Ensure these ports are available, or install the Lite Edition."
TXT_INSTALL_PORT_OCCUPIED="If the port is already in use, resolve the conflict and rerun the script with a different port."

TXT_INSTALL_SOCK_TIPS_1="Current Docker Sock might be located at: "
TXT_INSTALL_SOCK_TIPS_2="You can manually execute the command below to map the sock file to the default path"
TXT_INSTALL_SOCK_TIPS_3="If issues persist after creation, manually locate the sock file and specify its path."
TXT_INSTALL_SOCK="Mount Docker Sock file [Default:"
TXT_INSTALL_SOCK_SET="Docker Sock file mounted at: "

TXT_INSTALL_PROXY="Configure proxy address for the panel container to access Docker. Leave empty for no proxy."
TXT_INSTALL_PROXY_SET="Panel container proxy set to"
TXT_INVALID_PROXY_NOT_HTTP="Proxy address must start with http:// or https://, e.g., http://192.168.1.2:7890"
TXT_INVALID_PROXY_NOT_LOCAHOST="Localhost addresses point to the container, not the host. Use a local network IP address."

TXT_INSTALL_DNS="Manually configure DNS address for the container if domain resolution fails. Leave empty for no configuration."
TXT_INSTALL_DNS_SET="Panel DNS address set to"

TXT_INSTALL_LOW_DOCKER_VERSION="Detected server Docker version below 20.x. Manual upgrade is recommended to avoid feature limitations."
TXT_INSTALL_DOCKER_MESSAGE="Attempt online Docker installation (retry manually if fails)? [Y/n]: "
TXT_INSTALL_DOCKER_INSTALL_ONLINE="... Installing Docker online"
TXT_INSTALL_DOCKER_CHOOSE_LOWEST_LATENCY_SOURCE="Select the source with the lowest latency"
TXT_INSTALL_DOCKER_CHOOSE_LOWEST_LATENCY_DELAY="Latency (seconds)"
TXT_INSTALL_DOCKER_INSTALL_FAILED="Docker installation failed.\nYou may try installing Docker using an offline package."
TXT_INSTALL_DOCKER_INSTALL_SUCCESS="Docker installed successfully"
TXT_INSTALL_DOCKER_CANNOT_SELECT_SOURCE="Unable to select installation source"
TXT_INSTALL_DOCKER_START_NOTICE="... Starting Docker"

TXT_DOWNLOAD_DOCKER_SCRIPT_FAIL="Failed to download installation script"
TXT_DOWNLOAD_DOCKER_SCRIPT_SUCCESS="Docker installation script downloaded successfully"
TXT_DOWNLOAD_DOCKER_FAILED="Download of installation script failed"
TXT_DOWNLOAD_DOCKER_TRY_NEXT_LINK="Trying next alternative link"
TXT_DOWNLOAD_ALL_ATTEMPTS_FAILED="All download attempts failed. You can try installing Docker manually by running: "
TXT_DOWNLOAD_REGIONS_OTHER_THAN_CHINA="No need to change source"

TXT_RESULT_FAILED="Installation failed. Ensure Docker is installed correctly, images can be pulled normally, and ports are available."
TXT_RESULT_THANK_YOU_WAITING="================= Thank you for waiting. Installation/Upgrade completed successfully. =================="
TXT_RESULT_BROWSER_ACCESS_PANEL="Please access the panel in your browser and initialize the admin account: "
TXT_RESULT_EXTERNAL_ADDRESS="External Address: "
TXT_RESULT_INTERNAL_ADDRESS="Internal Address: "
TXT_RESULT_PROJECT_WEBSITE="Official Website & Documentation: https://dpanel.cc"
TXT_RESULT_PROJECT_REPOSITORY="Source Code Repository: https://github.com/donknap/dpanel"
TXT_RESULT_OPEN_PORT_SECURITY_GROUP="If using a cloud server, open the port in the security group"