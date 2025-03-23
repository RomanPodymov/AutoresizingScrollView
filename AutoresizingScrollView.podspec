Pod::Spec.new do |s|
  s.name = 'AutoresizingScrollView'
  s.version = '1.0.2'
  s.license = 'MIT'
  s.summary = 'For those who are "A very small UIScrollView with a very big content"'
  s.homepage = 'https://github.com/RomanPodymov/AutoresizingScrollView'
  s.authors = { 'Roman Podymov' => 'podymfrombryansk@yandex.com' }
  s.social_media_url = 'https://stackoverflow.com/users/2229783/roman-podymov'
  s.source = { :git => 'https://github.com/RomanPodymov/AutoresizingScrollView.git', :tag => '1.0.2' }

  s.ios.deployment_target = '11.0'
  s.tvos.deployment_target = '11.0'
  s.osx.deployment_target = '10.13'

  s.source_files = 'Sources/AutoresizingScrollView/*.swift'

  s.swift_versions = ['5.0']
end
