Pod::Spec.new do |s|
    s.name = 'NotMainThreadFix'
    s.version = '1.0.0'
    s.summary = 'Fixes situation where iOS code access some well known UI methods from not main thread (Firebase, etc...)'
    s.homepage = 'https://github.com/ladeiko/NotMainThreadFix'
    s.license = { :type => 'CUSTOM', :file => 'LICENSE' }
    s.author = { 'Siarhei Ladzeika' => 'sergey.ladeiko@gmail.com' }
    s.platform = :ios, '9.0'
    s.source = { :git => 'https://github.com/ladeiko/NotMainThreadFix.git', :tag => "#{s.version}" }
    s.requires_arc = true
    s.source_files = 'Source/**/*.{h,m}'
end
