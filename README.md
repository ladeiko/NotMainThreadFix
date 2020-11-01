# NotMainThreadFix

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/ladeiko/NotMainThreadFix/blob/master/LICENSE)
[![Pod version](https://badge.fury.io/co/NotMainThreadFix.svg)](https://badge.fury.io/co/NotMainThreadFix)
[![Build Status](https://travis-ci.org/ladeiko/NotMainThreadFix.svg?branch=master)](https://travis-ci.org/ladeiko/NotMainThreadFix)


Helpers code which tries to fix access to some UI methods from not main thread. Well know anaytics frameworks and other ones have errors in code (Firebase, etc...) where UIApplication methods are being called from secondary threads. This issues can be tracked when 'Main thread checker' is enabled in Xcode.

## Usage

Just add pod to your Podfile:

```ruby
pod 'NotMainThreadFix'
```

and install it:

```bash
pod install
```

## Authors

 * Siarhei Ladzeika <sergey.ladeiko@gmail.com>

## LICENSE

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
