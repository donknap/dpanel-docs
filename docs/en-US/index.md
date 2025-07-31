---
# https://vitepress.dev/reference/default-theme-home-page
layout: home

hero:
  name: "DPanel"
  text: "Lightweight container management panel"
  tagline: Manage Docker & Podman with just one panel!
  image:
    src: https://cdn.w7.cc/dpanel/dpanel-logo-1.png
    alt: DPanel
  actions:
    - theme: alt
      text: Overview
      link: /docs/en-US/README
    - theme: alt
      text: Pro Edition
      link: /docs/en-US/pro
    - theme: brand
      text: Start
      link: /docs/en-US/install/docker
features:
  - title: Multi-language Support
    icon: 🇨🇳
    details: Native support for Chinese, English, Japanese and other languages without installing plugins.
  - title: Quick Deployment
    icon: 🐳
    details: Supports container and binary package deployment—simple, easy to use, and highly compatible.
  - title: Lightweight
    icon: 📊
    details: Extremely low resource consumption (image ~150MB, memory ~20MB), suitable for NAS, routers, and small servers.
  - title: Security
    icon: 🔐
    details: Runs in containers without privileged mode, no host dependency or intrusion, secure and reliable.
  - title: Domain Forwarding & SSL
    icon: 🆖
    details: Built-in Nginx component in Standard Edition for quick domain binding and container port forwarding.
  - title: App Store
    icon: 🎁
    details: Supports multiple protocols including 1Panel, CasaOS, and allows adding multiple stores simultaneously.
  - title: Multi-host Management
    icon: 💻
    details: Manage multiple Docker hosts concurrently via API (TLS) or SSH.
  - title: Container Snapshots
    icon: 📷
    details: Full snapshot backup, restore, and migration across Docker environments.
  - title: Container File Management
    icon: 📂
    details: Manage files within containers and on the host system.
  - title: One-click Container Upgrade
    icon: 🚀
    details: Automatic image update detection and rapid upgrade capability.
  - title: Tag-based Grouping & Quick Access
    icon: 📌
    details: Group and filter containers using compose, swarm, or labels; configure quick access to containers.
  - title: Compose
    icon: 📝
    details: Supports multiple methods to add and manage Compose projects.
  - title: Swarm
    icon: 🐝
    details: Supports management of Docker Swarm clusters.
  - title: Dark Mode & Custom Themes
    icon: 🎨
    details: UI customization including dark mode, menu position, font size, pagination, and console style.
  - title: Permission System
    icon: 👨🏻‍💻
    details: Supports multi-user, menu-level, and data-level permissions.
---