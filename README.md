# GMfxHash

*An fx(hash) extension for GameMaker. This doesn't include anything for setting features (yet).*

## Getting Started

Go to the [releases](https://github.com/CarsonKompon/GMfxHash/releases) and download either the template `.yyz` file or the extension `.yymps` file.

###### If you downloaded the Extension:

In your project, select `Tools > Import Local Package` from the toolbar at the top of the window. Then find and select the downloaded `.yymps` file and import all. Once you've imported the Extension, make sure to call `fxhash_init()` at the very beginning of your game.

Now, export an HTML5 build of your game and copy the `index.html` file into your project's `datafiles` folder (also known as Included Files). Open the file in a text editor and include the [fx(hash) code snippet](https://www.fxhash.xyz/doc/artist/guide-publish-generative-token#fxhash-code-snippet) somewhere in the `<head>` section. Back in GameMaker, go to your HTML5 Game Options and change the `Included file as index.html` to `index.html` instead of `Use Default`.

###### If you downloaded the Template:

Once you create a project from the downloaded `.yyz` file, go to the `datafiles` folder (also known as Included Files) and open the `index.html` file in a text editor. Change the text within the `<title>` tags to reflect your project if you don't wish for it to simply say "fx(hash)".

If you don't plan on using `window_set_size(w,h)` to change the canvas size, you should either:
a) Change the `width` and `height` properties of the `<canvas>` tag to reflect your room width and height
b) Simply call `window_set_size(room_width, room_height)` at the very beginning of your project (similarly to how the template already does)

**Congrats! You're all ready to start creating!**

## Documentation

#### `fxhash_init()`

You must include this as the first line of your project's code, before any randomization or fxhash function calls. This sets up a few variables so that you can emulate fx(hash) functions while running the program on platforms other than HTML5 and also sets GameMaker's own random seed to the hash. It is worth noting that each platform uses it's own solution for randomization in GameMaker, so hashes will show different outputs on different platforms (thankfully this doesn't matter since fx(hash) is only html).

#### `fxhash`

A string equal to the unique 51 character hash of the token. This is a random hash when running on non-html platforms.

#### `fxrand(_max = 1)`

This is simply the `fxrand()` function that generates a pseudo-random number based on the `fxhash`. However, you can now supply an optional argument as the maximum number. This is effectively the same as performing `fxrand() * _max`

#### `fxpreview()`

A function you can call when your code is ready to be captured when using "Programmatic trigger" on fx(hash).

#### `isFxpreview`

A boolean, true when the code is executed to take the capture, false otherwise.

#### `fxrandi(_max = 1)`

This is the same as `fxrand()` but instead only outputs inclusive integer values. When no argument is specified it will return 0 or 1 so it can also be used for random booleans.

#### `fxrand_range(_num1, _num2)`

This is the same as `fxrand()` but has 2 required arguments for a minimum and maximum value.

#### `fxrandi_range(_num1, _num2)`

This is the same as `fxrand_range(_num1, _num2)` but will output inclusive integer values.

#### `fxchoose(_array)`

A function that returns a random value within an array based on the `fxhash`.