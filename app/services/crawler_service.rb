class CrawlerService
  include WebCrawler

  def perform
    WebCrawler::CRAWLED_HOSTS.each do |blog|
      results = WebCrawler::MyScraper.new(blog).get_posts
      posts_url = Post.pluck(:url)

      results["posts"].each do |post_params|
        Post.create post_params unless (posts_url.include?(post_params["url"]) ||
          posts_url.include?(post_params["url"].prepend(post_params["host"])))
      end
    end
  end
end
