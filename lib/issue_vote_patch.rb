require File.join(File.dirname(__FILE__), '../app/models/vote')
require_relative 'acts_as_voteable'

module IssueVotePatch
end

Issue.class_eval do
  acts_as_voteable
end
