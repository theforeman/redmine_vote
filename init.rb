require 'redmine'
require_relative 'lib/issue_vote_patch'
require_relative 'lib/query_vote_patch'
require_relative 'lib/issues_vote_hook'

Redmine::Plugin.register :redmine_vote do
  name 'Redmine Vote plugin'
  author 'Andrew Chaika'
  description 'Issue Vote Plugin'
  version '0.0.3'
  project_module :issue_voting do
    permission :vote_issue, {:issues => :vote}, :require => :loggedin
    permission :multiple_vote_issue, {:issues => :multiple_vote}, :require => :loggedin
    permission :view_votes, {:issues => :view_votes}, :require => :loggedin
    permission :view_voter, {:issues => :view_voter}, :require => :loggedin
  end
end

class RedmineVoteListener < Redmine::Hook::ViewListener
  render_on :view_layouts_base_html_head, :inline => "<%= stylesheet_link_tag 'stylesheet', :plugin => 'redmine_vote' %>"
end 
