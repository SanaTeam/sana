if Rails.env == 'production' || Rails.env == 'test'
    Searchkick.client = Elasticsearch::Client.new({
        hosts: ENV["BONSAI_URL"],
        retry_on_failure: true,
        transport_options: { request: { timeout: 250 } }
    })
end