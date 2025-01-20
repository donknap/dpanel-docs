#!/bin/bash

# 创建 static 目录
mkdir -p static

# 下载 CSS 文件
wget -O static/buble.css "https://cdn.jsdelivr.net/npm/docsify@4/lib/themes/buble.css"
wget -O static/light.css "https://unpkg.com/docsify-plugin-toc@1.3.1/dist/light.css"
wget -O static/fonts.css "https://fonts.googleapis.com/css?family=Inconsolata|Inconsolata-Bold"

sed -i '' 's#https://fonts\.googleapis\.com/css\?family=Inconsolata|Inconsolata-Bold#https://cdn.w7.cc/dpanel/static/fonts.css#g' static/buble.css

# 下载 JS 文件
wget -LO static/docsify.js "https://cdn.jsdelivr.net/npm/docsify@4"
wget -LO static/zoom-image.min.js "https://cdn.jsdelivr.net/npm/docsify/lib/plugins/zoom-image.min.js"
wget -LO static/docsify-plugin-toc.min.js "https://unpkg.com/docsify-plugin-toc@1.3.1/dist/docsify-plugin-toc.min.js"
wget -LO static/beian.min.js "https://cdn.jsdelivr.net/npm/docsify-beian@latest/dist/beian.min.js"
wget -LO static/docsify-edit-on-github.js "https://cdn.jsdelivr.net/npm/docsify-edit-on-github"
echo "资源下载完成并保存到 static 目录"