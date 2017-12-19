class AddressesController < ApplicationController
  def suggestion
    url = 'http://api.map.baidu.com/place/v2/suggestion'
    resp = RestClient.get url, {params: {region: current_city.name, city_limit: true, output: 'json', ak: '6X8Xun79e4znXpgarFTsbFTkN3IrWVA2', query: params[:term]}}

    result = JSON.parse(resp)['result'].map do |result|
      {id: result['name'], text: result['name'], lat: result['location']['lat'], lng: result['location']['lng']}
    end
    
    render json: {results: result}
  end
end