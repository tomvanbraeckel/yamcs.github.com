require 'octokit'
require 'json'

def pull_repo_info(client, repo)
    releases_by_target = {}
    for r in client.releases "yamcs/#{repo}" do
        next if r.prerelease or r.draft

        release = {
            'name': r.name,
            'tag_name': r.tag_name,
            'created_at': r.created_at,
            'published_at': r.published_at,
            'body': r.body,
        }

        if not releases_by_target[r.target_commitish] then
            releases_by_target[r.target_commitish] = []
        end

        for a in r.assets do
            asset = {'name': a.name, 'size': a.size, 'url': a.browser_download_url}
            
            if repo == 'yamcs' then
                if not a.name.include? 'simulation' and not a.name.include? 'client' then
                    release[:tgz] = asset if a.name.end_with? '.tar.gz'
                    release[:rpm] = asset if a.name.end_with? '.rpm'
                end
            elsif repo == 'yamcs-studio' then
                release[:windows] = asset if a.name.include? 'win32'
                release[:macos] = asset if a.name.include? 'cocoa'
                release[:linux] = asset if a.name.include? 'linux'
            end
        end
    
        releases_by_target[r.target_commitish].push(release)
    end
    
    Dir.mkdir("_data/releases/#{repo}") unless File.directory?("_data/releases/#{repo}")
    for target, releases in releases_by_target do
        File.open("_data/releases/#{repo}/#{target}.json", 'w') do |f|
            f.write(JSON.pretty_generate(releases))
        end
    end
end

client = Octokit::Client.new
client.auto_paginate = true

pull_repo_info client, 'yamcs'
pull_repo_info client, 'yamcs-studio'
