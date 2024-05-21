Pod::Spec.new do |spec|
  spec.name         = 'SwiftOde'
  spec.version      = '0.0.2'
  spec.authors      = { 
    'v2.softwarehouse' => 'v2.softwarehouse@gmail.com'
  }
  spec.license      = { 
    :type => 'MIT',
    :file => 'LICENSE' 
  }
  
  spec.homepage     = 'https://github.com/v2-softwarehouse/swift-ode'
  spec.source       = { 
    :git => 'https://github.com/v2-softwarehouse/swift-ode.git', 
    :branch => 'main',
    :tag => spec.version.to_s 
  }
  spec.summary          = 'A framework to drive a clean code'
  spec.description      = <<-DESC
  AKA clean architecture. The Ode create a guide line style to business layer
                        DESC

  spec.ios.deployment_target = '13.0'
  spec.swift_version = "4.2"
  spec.source_files        = "**/*.{h,m,swift}"
  spec.public_header_files = "**/*.h"

end
