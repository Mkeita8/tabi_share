module BoardsHelper
  def render_with_hashtags(body)
    body.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/board/hashtag/#{word.delete("#")}"}.html_safe
  end
end
