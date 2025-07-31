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
        text: 'Install',
        collapsed: false,
        items: [
          { text: 'Install Script', link: getLink("install/shell") },
          { text: 'Install with Docker', link: getLink("install/docker") },
          { text: 'Install with Compose', link: getLink("install/compose") },
          { text: 'Install with binary', link: getLink("install/source") },
          { text: 'Install with DinD', link: getLink("install/dind") },
        ]
      },
      {
        text: 'Extended',
        collapsed: false,
        items: [
          { text: 'Custom image', link: getLink("install/custom-image") },
          { text: 'Bind domain', link: getLink("install/bind-domain") },
          { text: 'Control command', link: getLink("install/ctrl") }
        ]
      },
    ]
  }
}