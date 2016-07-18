# the name of the project
workspace 'GreedLog'

# let ExampleUnitTests use pods
# link_with 'Example', 'ExampleTests'

platform :ios, '6.0'
use_frameworks!

# the path of test project
xcodeproj 'Example/Example'

# the path of .podspec

def testing_pods
pod 'GreedLog', :path => './'
end

target 'Example' do
testing_pods
end
