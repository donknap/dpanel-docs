import { defineConfig } from 'vitepress'
import { zhCNConfig } from './locales/zh-CN'
import { enUSConfig } from './locales/en-US'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  rewrites: {
    'docs/zh-CN/:rest*': ':rest*'
  },
  title: "DPanel",
  titleTemplate: 'DPanel',
  head: [
    [
      'link',
      { rel: 'icon', href: '/storage/image/dpanel.ico' }
    ],
    [
      'script',
      {
        id: "baidu"
      },
      `var _hmt = _hmt || [];
      (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?e5b6e51aa6276fb32c9c2bfb075a1b14";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();`
    ]
  ],
  description: "轻量化的 Docker 可视化管理面板",
  lang: "zh-CN",
  cleanUrls: true,
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: {
      src: "https://cdn.w7.cc/dpanel/dpanel-logo-small.png"
    },
    editLink: {
      pattern: 'https://github.com/donknap/dpanel-docs/tree/master/docs/:path'
    },
    socialLinks: [
      { icon: 'github', link: 'https://github.com/donknap/dpanel' },
    ],
    search: {
      provider: "local",
    },
    footer: {
      message: `<div style="display:flex; justify-content: center; gap: 10px; margin-bottom:20px;">
      <a href="https://github.com/donknap/dpanel" target="_blank"><img src="https://img.shields.io/github/stars/donknap/dpanel.svg" /></a>
      <a href="https://github.com/donknap/dpanel" target="_blank"><img src="https://img.shields.io/docker/pulls/dpanel/dpanel" /></a>
      <a href="https://github.com/donknap/dpanel/releases" target="_blank"><img src="https://img.shields.io/github/v/release/donknap/dpanel" /></a>
      <a href="https://hellogithub.com/repository/c69089b776704985b989f98626de977a" target="_blank"><img src="https://abroad.hellogithub.com/v1/widgets/recommend.svg?rid=c69089b776704985b989f98626de977a&claim_uid=ekhLfDOxR5U0mVw&theme=small" alt="Featured｜HelloGitHub" /></a>
      </div>`,
      copyright: 'Copyright © 2024-present DPanel Development Team <a href="https://beian.miit.gov.cn/" target="_blank">晋ICP备2022006920号-3</a>'
    },
    outline: {
      level: [2, 4]
    },
  },
  lastUpdated: true,
  locales: {
    root: { label: '简体中文', ...zhCNConfig },
    "docs/en-US": { label: 'English', ...enUSConfig },
  },
})
