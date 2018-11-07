# Xonotic Setup

## Download

Download the latest version from https://www.xonotic.org/download/

## Setup

### macOS (Mojave)

1.  Extract the ZIP file you downloaded.

2.  Copy the entire Xonotic folder to `/Applications`

3.  Open your terminal and execute:

    ```
    xattr -r -d com.apple.quarantine "/Applications/Xonotic/Xonotic.app"
    mkdir ~/.xonotic
    ```
4.  (optional) If you have an old installation you should copy the config:

    ```
    cp ~/Library/Application\ Support/xonotic/data/config.cfg
    ```
   
    If you have an old config folder, make sure to remove it:
   
    ```
    rm -rf ~/Library/Application\ Support/xonotic/
    ```

5.  Lauch Xonotic. If you are lauching the app for the first time you
    will need to override macOS GateKeeper.

## Xonotic Map Manager

The [Xonotic Map Manager][xmm] allows you easily download new maps.

```
pip install xmm
xmm --help
```

You can seach maps via ```xxm search``` or via a web repo:
http://xonotic.co/

[xmm]: https://xonotic-map-manager.readthedocs.io/
