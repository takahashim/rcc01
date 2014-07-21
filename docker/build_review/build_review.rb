#!/usr/bin/env ruby

require 'dropbox_sdk'
require 'fileutils'
require 'shellwords'
require 'yaml'

GITHUB_URL = ARGV[0]
DROPBOX_ACCESS_TOKEN = ARGV[1]
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
ret = system("git", "clone", GITHUB_URL, REPO_NAME)
if !ret
  error("cannot get repo: #{GITHUB_URL}")
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
  system("review-pdfmaker", conf)
  system("review-epubmaker", conf)
  epub = File.open("book.epub")
  pdf  = File.open("book.pdf")
  client.put_file(bookname+".epub", epub, true)
  client.put_file(bookname+".pdf", pdf, true)
end

