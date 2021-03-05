module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url
    link_to "GitHub", "https://github.com/naveroot/test_guru_2021", target: "_blank", rel: "nofollow"
  end
end
