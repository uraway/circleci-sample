require "simplecov"

namespace :simplecov do
  desc "merge_results"
  task merge_results: :environment do
    results = Dir["coverage_results/.resultset*.json"].map { |file| SimpleCov::Result.from_hash(JSON.parse(File.read(file))) }
    SimpleCov::ResultMerger.merge_results(*results).tap do |result|
      SimpleCov::ResultMerger.store_result(result)
    end
  end
end
