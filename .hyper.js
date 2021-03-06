// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    hyperline: {
      plugins: [
        'battery',
        'network',
        'memory',
        'cpu'
      ]
    },
    hyperTabs: {
      tabIcons: false,
      tabIconsColored: true
    },
    hyperlinks: {
      defaultBrowser: true
    },
	hyperCustomTouchbar: [
        // if you just need a single button then don't add options array
        {
            label: 'general',
            backgroundColor: '#000000',
            options: [
                {
                    label: 'clear',
                    command: 'clear'
                },
                {
                    label: 'update',
                    command: 'updateSys'
                }
            ]
        },
        {
            icon: '/Users/keloran/.hyper_plugins/icons/localstack.png',
            backgroundColor: '#000000',
            options: [
                {
                    label: 'dynamodb',
                    command: 'SERVICES=dynamodb TMPDIR=private$TMPDIR localstack start --docker'
                }
            ]
        },
        {
            icon: '/Users/keloran/.hyper_plugins/icons/docker.png',
            options: [
                {
                    icon: '/Users/keloran/.hyper_plugins/icons/info.png',
                    command: 'docker ps -a',
                    backgroundColor: '#6767FF'
                },
                {
                    icon: '/Users/keloran/.hyper_plugins/icons/start.png',
                    command: 'dockerStart',
                    backgroundColor: '#6767FF'
                },
                {
                    icon: '/Users/keloran/.hyper_plugins/icons/stop.png',
                    command: 'dockerStop',
                    backgroundColor: '#6767FF'
                }
            ]
        },
        {
            icon: '/Users/keloran/.hyper_plugins/icons/github.png',
            options: [
                {
                    icon: '/Users/keloran/.hyper_plugins/icons/diff.png',
                    command: 'git diff',
                    backgroundColor: '#CFCFCF'
                },
                {
                    icon: '/Users/keloran/.hyper_plugins/icons/info.png',
                    command: 'git status',
                    backgroundColor: '#CFCFCF'
                },
                {
                    command: 'git log',
                    icon: '/Users/keloran/.hyper_plugins/icons/log.png',
                    backgroundColor: '#CFCFCF'
                },
                {
                    command: 'git add .',
                    icon: '/Users/keloran/.hyper_plugins/icons/add.png',
                    backgroundColor: '#CFCFCF'
                },
                {
                    icon: '/Users/keloran/.hyper_plugins/icons/download.png',
                    backgroundColor: '#CFCFCF',
                    command: 'git clone ',
                    prompt: true
                },
            ]
        },
        {
            icon: '/Users/keloran/.hyper_plugins/icons/vim.png',
            backgroundColor: '#B2D8B2',
            options: [
                {
                    icon: '/Users/keloran/.hyper_plugins/icons/quit.png',
                    command: ':q!',
                    esc: true
                },
		        {
                    icon: '/Users/keloran/.hyper_plugins/icons/save.png',
                    command: ':w',
                    esc: true
                },
            ]
        },
    ],

    // default font size in pixels for all tabs
    fontSize: 11,

    // font family with optional fallbacks
    fontFamily: '"Monoid Nerd Font", "MesloLGM Nerd Font", "DejaVuSansMono Nerd Font", "TerminessTTF Nerd Font", "SauceCodePro Nerd Font"',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(248,28,229,0.8)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // set to true for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    backgroundColor: '#000',

    // border color (window, tabs)
    borderColor: '#333',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: '.unicode-node {position: relative}',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '.5rem .5rem .8rem .5rem',
    // padding: '3px 5px 8px 8px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#ff0000',
      green: '#33ff00',
      yellow: '#ffff00',
      blue: '#0066ff',
      magenta: '#cc00ff',
      cyan: '#00ffff',
      white: '#d0d0d0',
      lightBlack: '#808080',
      lightRed: '#ff0000',
      lightGreen: '#33ff00',
      lightYellow: '#ffff00',
      lightBlue: '#0066ff',
      lightMagenta: '#cc00ff',
      lightCyan: '#00ffff',
      lightWhite: '#ffffff'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    // make sure to use a full path if the binary name doesn't work
    // (e.g `C:\\Windows\\System32\\bash.exe` instead of just `bash.exe`)
    // if you're using powershell, make sure to remove the `--login` below
      shell: '/bin/zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: true

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyperline',
    'hyperlinks',
    'hyper-tabs-enhanced',
    'hyper-history',
//    'hyper-seti-monokai',
    'hyper-afterglow',
    'hyper-broadcast',
    'hyper-hide-title',
    "hypercwd",
    "hyper-custom-touchbar",
    "hyper-quit"
],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
//    'hyperline'
  ]
};
