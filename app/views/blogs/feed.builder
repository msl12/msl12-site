xml.instruct! :xml, version: '1.0'
xml.rss(version: '2.0') {
  xml.channel {
    xml.title "msl12's Blog"
    xml.link 'http://msl12.cn'
    xml.description 'My personal blog - stay hungry, stay foolish!'
    xml.language 'zh-cn'
    @blogs.each do |blog|
      xml.item do
        xml.title blog.title
        xml.description markdown blog.content
        xml.pubDate blog.created_at.strftime '%a, %d %b %Y %H:%M:%S %z'
        xml.link blog_url blog
        xml.guid blog_url blog
      end
    end
  }
}