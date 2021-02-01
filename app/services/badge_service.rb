class BadgeService

  def post_badge_cred(first, last, email)
    @response = conn.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers["Authorization"] = ENV['CREDLY_AUTH_KEY']
      req.body = {
        "recipient_email": email,
        "issued_to_first_name": first,
        "issued_to_last_name": last,
        "badge_template_id": "22559c6f-f5a2-414e-a6ba-3353b59e82cb",
        "issued_at": Time.now.to_s
      }.to_json
    end
    JSON.parse(@response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://sandbox-api.youracclaim.com/v1/organizations/b34c1672-82de-4d0c-b345-f7b85cfb319f/badges') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
