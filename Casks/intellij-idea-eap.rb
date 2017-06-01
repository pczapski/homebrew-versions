cask 'intellij-idea-eap' do
  version '2017.2,172.2656.10'
  sha256 'baaf72a4de06225a1596261fdc1f1bde9e02abddc450028a58f487edf4ff724e'

  url "https://download.jetbrains.com/idea/ideaIU-#{version.after_comma}.dmg"
  appcast 'https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=eap',
          checkpoint: '7d1b630a488f35695ac3221f8dcf843dbfca239713ac2603594d0dd493ee3b5e'
  name 'IntelliJ IDEA Ultimate'
  homepage 'https://www.jetbrains.com/idea/nextversion/'

  auto_updates true

  app "IntelliJ IDEA #{version.before_comma} EAP.app"

  uninstall_postflight do
    ENV['PATH'].split(File::PATH_SEPARATOR).map { |path| File.join(path, 'idea') }.each { |path| File.delete(path) if File.exist?(path) }
  end

  zap delete: [
                "~/Library/Caches/IntelliJIdea#{version.major_minor}",
                "~/Library/Logs/IntelliJIdea#{version.major_minor}",
                "~/Library/Application Support/IntelliJIdea#{version.major_minor}",
                "~/Library/Preferences/IntelliJIdea#{version.major_minor}",
                '~/Library/Preferences/com.jetbrains.intellij.plist',
                '~/Library/Saved Application State/com.jetbrains.intellij.savedState',
              ]
end
