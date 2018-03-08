# resize_screenshots plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-resize_screenshots)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-resize_screenshots`, add it to your project by running:

```bash
fastlane add_plugin resize_screenshots
```

## About resize_screenshots

I love using [fastlane frameit]() to create screenshots for my iOS apps for the App Store. It's a handy tool to take screenshots I save from an iOS simulator and put them into an iPhone frame to publish to the App Store. It's a great tool that you should really check out.

However, frameit requires your screenshots to be in this very specific image size in order to put them into a frame. If your screenshot is not in that *exact* image size, it will throw an error.

When I take a screenshot in my iOS simulator, it seems to save those screenshots in `836x1811` size for iPhone X, but frameit requires `1125x2436` for iPhone X. This is super weird because the height/width ratio for `836x1811` and `1125x2436` is off by *1 pixel*. If I try to resize `836x1811` to `1125x____` with the same aspect ratio, I get `1125x2437`. Weird, right?!

Anyway, I digress.

I decided to make this plugin so I can take screenshots from my simulator, put those into a folder, resize the images automatically by device and then run those resized images into frameit for me. 🎊 No more frameit image size issues! 🎊

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

**Note to author:** Please set up a sample project to make it easy for users to explore what your plugin does. Provide everything that is necessary to try out the plugin in this project (including a sample Xcode/Android project if necessary)

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Author

* Levi Bostian - [GitHub](https://github.com/levibostian), [Twitter](https://twitter.com/levibostian), [Website/blog](http://levibostian.com)

![Levi Bostian image](https://gravatar.com/avatar/22355580305146b21508c74ff6b44bc5?s=250)

## Issues and Feedback

For any other issues and feedback about this plugin, please [create an issue]().

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide. After giving that a try and you still need help, please, [create an issue]() and I'll try to help you out.

## What is _fastlane_?

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).
