require 'test_helper'

class DemoApiError < Minitest::Test
  def setup
    @client = CoingeckoRuby::Client.new(demo_api_key: 'COINGECKO_DEMO_API_KEY')
  end

  def test_that_it_uses_free_base_url_and_sets_demo_headers
    stub_request(:any, "https://api.coingecko.com/api/v3/stubbed_endpoint")

    @client.get('stubbed_endpoint')

    assert_requested :get, "https://api.coingecko.com/api/v3/stubbed_endpoint",
      headers: {'x-cg-demo-api-key' => 'COINGECKO_DEMO_API_KEY'},
      times: 1
  end
end
