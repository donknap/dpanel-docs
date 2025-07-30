import { LocaleSpecificConfig, DefaultTheme } from 'vitepress'

function getLink(link?: string): string {
  return `/docs/en-US${link ? `/${link}` : ""}`
}

export const enUSConfig: LocaleSpecificConfig<DefaultTheme.Config> = {
  themeConfig: {
    nav: [
      { text: 'Home', link: getLink("") },
      { text: 'License', link: getLink("license") },
      { text: 'Pro Edition', link: getLink("pro") },
      { text: 'Sponsor', link: 'https://afdian.com/a/dpanel' },
      { text: 'Demo', link: "https://dpanel.park1991.com" },
    ],

    sidebar: [
      {
        text: 'Quick',
        collapsed: false,
        items: [
          { text: 'Install Script', link: getLink("install/shell") },
          { text: 'Docker', link: getLink("install/docker") },
          { text: 'Compose', link: getLink("install/compose") },
          { text: 'In Docker', link: getLink("install/dind") },
          { text: 'Binary', link: getLink("install/source") },
          // { text: '自定义镜像', link: getLink("install/build") },
          // { text: '域名子目录', link: getLink("install/nginx-location") },
          { text: 'Control Command', link: getLink("install/ctrl") }
        ]
      },
    ]
  }
}