class Repo < ActiveRecord::Base
  belongs_to :user
  has_many :commits

  def repository_url
    if self.provider == "github"
      username = self.user.nickname
      reponame = self.name
      return "https://github.com/#{username}/#{reponame}.git"
    end
  end
end
