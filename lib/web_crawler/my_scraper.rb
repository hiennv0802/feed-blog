module WebCrawler
  class MyScraper
    include Wombat::Crawler

    def initialize args
      @args = args
    end

    def get_posts
      args = @args
      Wombat.crawl do
        base_url args[:host]
        posts args[:post], :iterator do
          title args[:title]
          url args[:link]
          host args[:host]
        end
      end
    end
  end
end
