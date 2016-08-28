require 'fix_bad_links'

namespace :fix_bad_links do
  include FixBadLinks

  desc "Fix all broken links in LSDP articles"
  task fix_bad_links: :environment do
    fix_bad_links
  end
end
