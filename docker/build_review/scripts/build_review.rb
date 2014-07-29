#!/usr/bin/env ruby

require 'dropbox_sdk'
require 'fileutils'
require 'shellwords'
require 'yaml'

GITHUB_URL = ARGV[0]
COMMIT_ID = ARGV[1]
DROPBOX_ACCESS_TOKEN = ARGV[2]
REPO_NAME = "repo"

def find_review_project(root)
  Dir.glob(root+"/**/*") do |path|
    filename = File.basename(path)
    if filename == "CHAPS" || filename == "catalog.yml"
      return File.dirname(path)
    end
  end
  nil
end

def find_config(path)
  Dir.glob(path+"/**/*") do |path|
    filename = File.basename(path)
    if filename =~ /conf.*\.y.?ml/i
      return File.basename(path)
    end
  end
  nil
end

def get_bookname(conf)
  obj = YAML.load_file(conf)
  obj["bookname"]
end

def error(msg)
  puts msg
  exit 1
end

client = DropboxClient.new(DROPBOX_ACCESS_TOKEN)

FileUtils.rm_rf(REPO_NAME)
ret = system("git clone -q #{Shellwords.shellescape(GITHUB_URL)} #{REPO_NAME} 2>&1")
if !ret
  error("cannot get repo: #{GITHUB_URL}")
end

if COMMIT_ID
  ret = system("cd #{REPO_NAME} && git checkout -q #{Shellwords.shellescape(COMMIT_ID)} 2>&1")
  if !ret
    error("cannot checkout ID: #{COMMIT_ID}")
  end
end

path = find_review_project(REPO_NAME)
if !path
  error("project not found")
end

conf = find_config(path)
if !conf
  error("config not found")
end

Dir.chdir(path) do
  bookname = get_bookname(conf)
  system("review-pdfmaker #{Shellwords.shellescape(conf)} 2>&1")
  system("review-epubmaker #{Shellwords.shellescape(conf)} 2>&1")
  epubfile = bookname+".epub"
  pdffile = bookname+".pdf"
  epub = File.open(epubfile)
  pdf  = File.open(pdffile)
  client.put_file(epubfile, epub, true)
  client.put_file(pdffile, pdf, true)
end

