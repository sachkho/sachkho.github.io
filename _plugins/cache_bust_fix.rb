# The jekyll-cache-bust gem hardcodes its Sass source directory as
# "assets/_sass", but this site (like al-folio generally) keeps Sass
# partials in "_sass/" at the repo root. That mismatch made Dir[] find
# no files, so bust_css_cache always hashed an empty string and
# produced the same "?v=d41d8cd9..." query string on every build —
# letting browsers/CDNs cache main.css indefinitely across deploys.
module Jekyll
  module CacheBust
    def bust_css_cache(file_name)
      CacheDigester.new(file_name: file_name, directory: "_sass").digest!
    end
  end
end
