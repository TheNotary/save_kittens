class TwitterCard
  attr_accessor :type, :header, :body, :img, :url

  # TwitterCard.new(header: "", body: "", img: "", url: "")
  def initialize(hsh = {})
    @type = hsh[:summary].nil? ? "summary" : hsh[:summary]
    @header = hsh[:header].nil? ? "Missing Header" : hsh[:header]
    @body = hsh[:body].nil? ? "" : hsh[:body]
    @img = hsh[:img].nil? ? "" : hsh[:img]
    @url = hsh[:url].nil? ? "" : hsh[:url]
  end

  def render
    renderer = ERB.new(get_template)
    renderer.result(binding).html_safe
  end

  def get_template
    domain = "http://45.55.12.73/"
    template = <<-END
      <meta name="twitter:card" content="<%=self.type%>" />
      <meta name="twitter:site" content="@eff" />
      <meta name="twitter:title" content="<%=self.header%>" />
      <meta name="twitter:description" content="<%=self.body%>" />
      <meta name="twitter:image" content="<%="#{domain}#{self.img}"%>" />
      <meta name="twitter:url" content="<%= "#{domain}#{self.url}"%>" />
    END
  end

end
