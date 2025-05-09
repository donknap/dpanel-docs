#!/bin/bash

TXT_START_INSTALLATION="======================= 开始安装 DPanel 面板 ======================="
TXT_RUN_AS_ROOT="请以root用户身份运行此脚本或使用sudo权限"

TXT_SELECT_LANGUAGE="请选择语言:"
TXT_SELECT_LANGUAGE_CHOICE="输入语言选项 [默认:"

TXT_SUCCESS_MESSAGE="成功"
TXT_SUCCESSFULLY_MESSAGE="成功"
TXT_FAIELD_MESSAGE="失败"
TXT_IGNORE_MESSAGE="忽略"
TXT_SKIP_MESSAGE="跳过"

TXT_COMMAND_NOT_FOUND="命令不存在, 请安装后继续 (apt install | yum install | apk add | brew install)"

TXT_INSTALL_VERSION="选择你需要安装的版本"
TXT_INSTALL_VERSION_NAME=("标准版 (需要绑定 80 及 443 端口)" "Lite版 (不包含域名转发相关功能)" "标准版 (Pro)" "Lite版 (Pro)" "标准版 (Beta)" "Lite版 (Beta)")
TXT_INSTALL_VERSION_CHOICE="输入你要安装的版本编号 [默认: 2]: "
TXT_INSTALL_VERSION_IMAGE_SET="你安装使用的镜像为"
TXT_INSTALL_VERSION_REGISTRY_CHOICE="选择镜像源 [默认: 1]: "
TXT_INSTALL_VERSION_REGISTRY_NAME=("Docker Hub" "ALiYun")

TXT_INSTALL_NAME="设置 DPanel 容器名称, 更新面板时请配置为当前面板容器名称"
TXT_INSTALL_NAME_INPUT="请输入名称 [默认:"
TXT_INSTALL_NAME_RULE="错误: 容器名称仅支持字母、数字、-、_、., 长度为3-30个字符"
TXT_INSTALL_NAME_SET="你指定的容器名称为"

TXT_UPGRADE_MESSAGE="指定的容器已经存在"
TXT_UPGRADE_CHOICE="是否升级面板容器？ [Y/n]: "
TXT_UPGRADE_START="... 正在升级面板容器"
TXT_UPGRADE_EMPTY_PORT="旧容器未暴露任何端口"
TXT_UPGRADE_EMPTY_MOUNT="旧容器未挂载任何目录或是文件"
TXT_UPGRADE_BACKUP="... 正在备份旧容器并创建新容器 "
TXT_UPGRADE_BACKUP_RESUME="... 正在恢复备份容器 "
TXT_UPGRADE_JOIN_DPANEL_LOCAL="... 加入网络"

TXT_INSTALL_DIR="设置 DPanel 容器挂载目录 [默认:"
TXT_INSTALL_DIR_PROVIDE_FULL_PATH="请指定绝对路径, 例如：/home/dpanel"
TXT_INSTALL_DIR_SET="您选择的面板容器挂载目录是"

TXT_INSTALL_PORT="设置 DPanel 端口 [默认:"
TXT_INSTALL_PORT_RULE="错误: 输入的端口号必须在 1 到 65535 之间"
TXT_INSTALL_PORT_SET="您设置的面板访问端口是: "
TXT_INSTALL_PORT_USE_80="您当前安装的标准版还需要绑定 80 及 443 端口, 请保证端口均被未被占用或是安装 Lite 版"
TXT_INSTALL_PORT_OCCUPIED="如果端口已经被占用, 请修复后再次执行脚本更换端口后重新安装"

TXT_INSTALL_SOCK_TIPS_1="当前 Docker Sock 可能位于: "
TXT_INSTALL_SOCK_TIPS_2="你可以手动执行下方命令，将 sock 文件映射到默认路径"
TXT_INSTALL_SOCK_TIPS_3="如果创建后依然无法正常请求, 请手动查找 sock 文件并指定"
TXT_INSTALL_SOCK="挂载 Docker Sock 文件 [默认:"
TXT_INSTALL_SOCK_SET="您挂载的 Docker Sock 文件是: "

TXT_INSTALL_PROXY="配置面板容器代理地址用于访问 docker, 为空时不配置代理"
TXT_INSTALL_PROXY_SET="您配置的面板代理地址是"
TXT_INVALID_PROXY_NOT_HTTP="代理地址必须以 http 或是 https 开头, 例如: http://192.168.1.2:7890"
TXT_INVALID_PROXY_NOT_LOCAHOST="本地地址指向的是容器并非宿主机, 请使用局域网内 ip 地址"

TXT_INSTALL_DNS="容器内无法解析域名时, 请手动配置 DNS 地址, 为空时为不配置"
TXT_INSTALL_DNS_SET="您配置的面板 DNS 地址是"

TXT_INSTALL_LOW_DOCKER_VERSION="检测到服务器Docker版本低于20.x, 建议手动升级以避免功能受限。"
TXT_INSTALL_DOCKER_MESSAGE="是否尝试在线安装 Docker (安装失败后请手动安装)？ [Y/n]: "
TXT_INSTALL_DOCKER_INSTALL_ONLINE="... 在线安装Docker"
TXT_INSTALL_DOCKER_CHOOSE_LOWEST_LATENCY_SOURCE="选择延迟最低的源"
TXT_INSTALL_DOCKER_CHOOSE_LOWEST_LATENCY_DELAY="延迟(秒)"
TXT_INSTALL_DOCKER_INSTALL_FAILED="Docker安装失败\n您可以尝试使用离线包安装Docker"
TXT_INSTALL_DOCKER_INSTALL_SUCCESS="Docker安装成功"
TXT_INSTALL_DOCKER_CANNOT_SELECT_SOURCE="无法选择安装源"
TXT_INSTALL_DOCKER_START_NOTICE="... 启动Docker"

TXT_DOWNLOAD_DOCKER_SCRIPT_FAIL="下载安装脚本失败"
TXT_DOWNLOAD_DOCKER_SCRIPT_SUCCESS="已成功下载Docker安装脚本"
TXT_DOWNLOAD_DOCKER_FAILED="下载安装脚本失败"
TXT_DOWNLOAD_DOCKER_TRY_NEXT_LINK="尝试下一个备用链接"
TXT_DOWNLOAD_ALL_ATTEMPTS_FAILED="所有下载尝试均已失败。您可以尝试通过运行以下命令手动安装Docker: "
TXT_DOWNLOAD_REGIONS_OTHER_THAN_CHINA="无需更改源"

TXT_RESULT_FAILED="安装失败, 请确保 Docker 已经正常安装、镜像可以正常拉取、端口没有被占用"
TXT_RESULT_THANK_YOU_WAITING="=================感谢您的耐心等待, 安装、升级已完成=================="
TXT_RESULT_BROWSER_ACCESS_PANEL="请使用您的浏览器访问面板, 并初始化管理员帐号: "
TXT_RESULT_EXTERNAL_ADDRESS="外部地址: "
TXT_RESULT_INTERNAL_ADDRESS="内部地址: "
TXT_RESULT_PROJECT_WEBSITE="官方网站及文档: https://dpanel.cc"
TXT_RESULT_PROJECT_REPOSITORY="代码仓库: https://github.com/donknap/dpanel"
TXT_RESULT_OPEN_PORT_SECURITY_GROUP="如果您使用的是云服务器, 请在安全组中打开端口"