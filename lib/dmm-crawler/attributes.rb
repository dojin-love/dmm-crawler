module DMMCrawler
  class Attributes
    HTTP_STATUS_CODE_OF_SUCCESS = 200

    def initialize(url, agent: Agent.instance.agent)
      @page = agent.get(url)
      @r_client = Rdmm::Client.new(affiliate_id: ENV['DMM_AFFILIATE_ID'], api_id: ENV['DMM_API_ID'])
    end

    def to_a
      [
        title,
        title_link,
        image_url,
        submedia,
        author,
        informations,
        affiliateable?,
        tags
      ]
    end

    def affiliateable?
      @r_client.list_items(site: 'DMM.R18', keyword: title).body['result']['status'] == HTTP_STATUS_CODE_OF_SUCCESS
    end

    private

    def title
      if art_page?
        @page.search('.productTitle__txt span').remove
        @page.search('.productTitle__txt').text.strip
      else
        @page.search('.rank-name').first.text.strip
      end
    end

    def title_link
      if art_page?
        @page.uri.to_s
      else
        File.join(BASE_URL, @page.search('.rank-name').first.search('a').first.attributes.first[1].value)
      end
    end

    def image_url
      attrs = @page.search('.productPreview__item img').first.attributes

      if attrs['data-src']
        attrs['data-src'].value
      else
        attrs['src'].value
      end
    end

    def submedia
      @page
        .search('.productAttribute-listItem .c_icon_productGenre')
        .first
        .attributes['class']
        .value
        .gsub('c_icon_productGenre ', '')
        .delete('-')
    end

    def author
      @page.search('div.circleName__item').text.strip
    end

    def informations
      keys = extract_text(@page.search('.m-productInformation .productInformation__item .informationList__ttl'))
      values = extract_text(@page.search('.m-productInformation .productInformation__item .informationList__txt'))

      information = keys.zip(values)
      series = information.find { |array| array.first == 'シリーズ' }

      if series
        information = information.reject { |array| array.first == 'シリーズ' }
        information.push(series)
      end

      information.map { |key, value| { key: key, value: value } }
    end

    def tags
      if art_page?
        @page.search('.genreTagList .genreTagList__item a').map { |e| e.text.strip }
      else
        @page.search('.rank-labelListItem').map { |e| e.search('a').text.strip }
      end
    end

    def extract_text(elements)
      elements
        .reject { |element| element.text.strip == 'ジャンル' }
        .map { |element| element.children.text.strip }
    end

    def art_page?
      @page.search('.rank-name').empty?
    end
  end
end
