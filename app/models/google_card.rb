class GoogleCard
  attr_accessor :type, :header, :body, :img, :url

  # TwitterCard.new(header: "", body: "", img: "", url: "")
  def initialize(hsh = {})
    @type = hsh[:summary].nil? ? "article" : hsh[:summary]
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
      <meta property='og:type' content="<%=self.type%>">
      <meta property='og:title' content="<%=self.header%>">
      <meta property='og:description' content="<%=self.body%>" />
      <meta property='og:url' content="<%= "#{domain}#{self.url}"%>">
      <meta property='og:image' content="<%="#{domain}#{self.img}"%>">
      <meta property='og:image:secure_url' content="<%="#{domain}#{self.img}"%>">
    END
  end

end
