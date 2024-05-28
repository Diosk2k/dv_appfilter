# Player Connect Filter

This resource allows server owners to filter player connections based on their Steam and Discord status in FiveM servers.

## Installation

1. Download the latest release from the [releases page](https://github.com/Diosk2k/dv_appfilter).
2. Extract the zip file into your FiveM server's `resources` folder.
3. Configure the resource by editing the `config.lua` file.
4. Optionally, add or modify language translations in the `locales.js` file.
5. Add `ensure player-connect-filter` to your `server.cfg` file.
6. Start your FiveM server.

## Configuration

### Configuring Filter Settings

In the `config.lua` file, you can adjust the filter settings to enable or disable Steam and Discord filtering.

```lua
Config = {}

-- Language settings ('en' for English, 'de' for German, 'es' for Spanish)
Config.language = 'en'

-- Filter settings
Config.filter = {
    ['steam'] = true,     -- Steam filter enabled (true) or disabled (false)
    ['discord'] = true,   -- Discord filter enabled (true) or disabled (false)
}
```

### Adding or Modifying Languages

To add or modify language translations, edit the `locales.js` file. Each language entry consists of key-value pairs where the key is the message identifier and the value is the translated message.

```javascript
const Locales = {
    'en': {
        'steam_not_started': 'You must have Steam started to join this server.',
        'discord_not_started': 'You must have Discord started to join this server.',
        // Add or modify more translations as needed
    },
    // Add translations for other languages if desired
};
```

## Support

For any issues or questions, please open an [issue](https://github.com/Diosk2k/dv_appfilter/issues) on GitHub.
