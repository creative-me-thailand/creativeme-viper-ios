source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

# Our Libraries
def libraries
	pod 'Moya-ObjectMapper'
end

def libraries_rx_swift
	pod 'Moya-ObjectMapper/RxSwift'
end

def libraries_reactive_cocoa
	pod 'Moya-ObjectMapper/ReactiveCocoa'
	pod 'ReactiveSwift', :git => 'https://github.com/ReactiveCocoa/ReactiveSwift'
end

def required_pods
	pod 'ObjectMapper' #, :git => 'https://github.com/Hearst-DD/ObjectMapper'
	pod 'Moya' #, :git => 'https://github.com/Moya/Moya'
	pod 'RxSwift' #, :git => 'https://github.com/ReactiveX/RxSwift'
	pod 'AlamofireImage', '~> 3.3.1'
end

# Test Libraries
def test_pods
	pod 'ObjectMapper' #, :git => 'https://github.com/Hearst-DD/ObjectMapper'
	pod 'Quick'
	pod 'Nimble'
	pod 'OHHTTPStubs'
end

target 'cmeviper' do
	platform :ios, '9.0'
	required_pods
	libraries
	libraries_rx_swift
end

target 'cmeviperTests' do
	platform :ios, '9.0'
	required_pods
	libraries
	libraries_rx_swift
end
