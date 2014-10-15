class TeamController < ApplicationController

	helper :custom_fields

	def index
		group = Setting.plugin_redmine_team_page['group'].to_i
		group = Group.find(group) rescue nil
		if group.nil?
			@users = User.all - [User.anonymous]
		else
			@users = User.in_group(group)
		end
		@users.sort! {|a,b| a.name <=> b.name }
	end

end
