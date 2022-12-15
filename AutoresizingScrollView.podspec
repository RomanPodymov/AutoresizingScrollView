Pod::Spec.new do |s|
  s.name = 'AutoresizingScrollView'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'AutoresizingScrollView'
  s.homepage = 'https://github.com/RomanPodymov/AutoresizingScrollView'
  s.authors = { 'Roman Podymov' => 'podymfrombryansk@yandex.ru' }
  s.social_media_url = 'https://twitter.com/RPodymov'
  s.source = { :git => 'https://github.com/RomanPodymov/AutoresizingScrollView.git', :tag => '1.0.0' }

  s.ios.deployment_target = '11.0'
  s.tvos.deployment_target = '11.0'

  s.source_files = 'Sources/AutoresizingScrollView/*.swift'

  s.swift_versions = ['5.0']
end