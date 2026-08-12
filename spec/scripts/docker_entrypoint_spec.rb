require 'spec_helper'
require 'fileutils'
require 'open3'
require 'tmpdir'

RSpec.describe 'bin/docker-entrypoint' do
  # rails を記録用スタブに差し替えて実行し、渡されたサブコマンドの一覧を返す
  def rails_invocations(*args)
    Dir.mktmpdir do |dir|
      log = File.join(dir, 'rails-calls.log')

      FileUtils.mkdir_p(File.join(dir, 'bin'))
      FileUtils.cp(File.expand_path('../../bin/docker-entrypoint', __dir__), File.join(dir, 'bin/docker-entrypoint'))
      FileUtils.chmod(0o755, File.join(dir, 'bin/docker-entrypoint'))
      File.write(File.join(dir, 'bin/rails'), <<~STUB)
        #!/bin/bash
        echo "$@" >> "#{log}"
      STUB
      FileUtils.chmod(0o755, File.join(dir, 'bin/rails'))

      Open3.capture2e('./bin/docker-entrypoint', *args, chdir: dir)

      File.exist?(log) ? File.readlines(log).map(&:strip) : []
    end
  end

  context 'Dockerfile の CMD どおりに rails server を起動したとき' do
    it 'db:prepare でマイグレーションを適用する' do
      expect(rails_invocations('./bin/rails', 'server', '-b', '0.0.0.0')).to include('db:prepare')
    end

    it 'server を起動する' do
      expect(rails_invocations('./bin/rails', 'server', '-b', '0.0.0.0')).to include('server -b 0.0.0.0')
    end
  end

  context 'server 以外のコマンドを実行したとき' do
    it 'db:prepare を実行しない' do
      expect(rails_invocations('./bin/rails', 'console')).not_to include('db:prepare')
    end
  end
end
