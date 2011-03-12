module ApplicationHelper
	def title
		base_title = "Shark\'s Cove NASCAR League"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

  def logo
    image_tag("logo.png", :alt => "SCNL", :class => "round")
  end
end
