fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios code_quality
```
fastlane ios code_quality
```
Running code quality check
### ios unit_test
```
fastlane ios unit_test
```
Running unit tests
### ios tests
```
fastlane ios tests
```
Running all tests and quality check
### ios pack
```
fastlane ios pack
```
Build (packed) application into IPA file
### ios increase_build_number
```
fastlane ios increase_build_number
```
Increase build number and commit new version to git repository
### ios deploy_beta
```
fastlane ios deploy_beta
```
Deploy prepared application to beta
### ios beta
```
fastlane ios beta
```
Build and deploy your (packed) application to beta for testing

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
