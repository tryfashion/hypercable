# frozen_string_literal: true

module ApplicationHelper
  def disable_with_spinner(text)
    spinner = <<~SPINNER
      <svg class="animate-spin mr-1 h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
      </svg>
    SPINNER
    [spinner, text].join.html_safe
  end

  def collector_server_url(site)
    ["https://", ENV["COLLECTOR_HOST"] || ENV["HOST"], "/", site.uuid].join
  end

  def url_to_path(url)
    (URI.parse(url) rescue nil)&.path
  end

  def time_range_names
    map = {
      "today"      => "Today",
      "week"       => "Week",
      "month"      => "Month",
      "7d"         => "Last 7 days",
      "30d"        => "Last 30 days",
      "6m"         => "Last 6 months",
      "12m"        => "Last 12 months",
      "realtime"   => "Realtime",
    }
    map.default = "Last 7 days"
    map
  end
end
