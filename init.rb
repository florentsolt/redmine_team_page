Redmine::Plugin.register :redmine_team_page do
  name 'Redmine Team Page plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/florentsolt/redmine_team_page'

  settings :default => {
  	'group' => nil,
  	'wiki' => "h2. Hi Team !\n\nPlease find every details about all members here.\nMore to come."
  },:partial => 'team/settings'

  menu :top_menu, :team, {:controller => 'team', :action => 'index'}, :caption => 'Team'
end

class TeamPageViewListener < ::Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context)
    stylesheet_link_tag("team.css", :plugin => "redmine_team_page", :media => "screen")
  end
end

if not Redmine::WikiFormatting::Macros.available_macros.key? :html
	# http://www.redmine.org/boards/2/topics/2677
	Redmine::WikiFormatting::Macros.macro :html do |obj, args, text|
		text.html_safe
	end
end