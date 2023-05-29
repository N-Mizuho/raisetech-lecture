require 'spec_helper'

#nginxがインストールされているか
describe package('nginx') do
  it { should be_installed }
end

#gitがインストールされているか
describe package('git') do
  it { should be_installed }
end

#80番ポートをListenしているか
describe port(80) do
  it { should be_listening }
end

#コマンドの出力結果からrubyが指定のバージョンがインストールされているか確認する
describe command('ruby -v') do
  its(:stdout) { should match /ruby 3\.0\.6/ }
end

#gemとして指定のバージョンがインストールされているか確認する
describe package('bundler') do
  it { should be_installed.by('gem').with_version('2.2.33') }
end

#コマンド結果からパスが通っているか確認
describe command('which mysql') do
  its(:exit_status) { should eq 0 }
end
